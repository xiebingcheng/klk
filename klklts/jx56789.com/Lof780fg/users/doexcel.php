<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
require_once '../assets/PHPExcel.php';
if(stripos(auth_group($_SESSION['login_gid']),'users_admin')===false)exit(denied_pape());

$filename=$starttime.'-'.$endtime;
if($starttime!=""){
    $begintime =strtotime($starttime);
}
    if($endtime!=""){
    $endtime =strtotime($endtime)+24*3600;;
 }





$query=$db->query("select * from {$tablepre}auth_group order by id desc");

$arrgroup=array();
while($row=$db->fetch_row($query)){
	$arrgroup[$row['id']]=$row['title'];
	}

        $roomsql=$roomid==0?'':" m.roomid=$roomid  and";
	$sql="select m.*,ms.*  from {$tablepre}members m,{$tablepre}memberfields ms  where m.uid=ms.uid and  $roomsql m.uid!=0";
        
	if($begintime!="" && $endtime!="" ){
	$sql.=" and  m.regdate>='$begintime' and m.regdate<='$endtime' ";
}
       if($gid>-1 && $gid!=''){
          $sql.=" and  m.gid='$gid' "; 
           
       } 
       $sql.=" order by m.uid desc";
        $query=$db->query($sql);
      
	if($db->num_rows($query)==0){
          echo '你选择的日期无数据!&nbsp;&nbsp;<a href="javascript:history.go(-1)">点击返回</a> ';
           exit;
      }



$objPHPExcel=new PHPExcel();

//E 列为文本
$objPHPExcel->getActiveSheet()->getStyle('A')->getNumberFormat()
	->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_TEXT);
//水平居中
$objPHPExcel->getActiveSheet()->getStyle('A')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
$objPHPExcel->getActiveSheet()->getStyle('B')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
$objPHPExcel->getActiveSheet()->getStyle('C')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
$objPHPExcel->getActiveSheet()->getStyle('D')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
$objPHPExcel->getActiveSheet()->getStyle('E')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
$objPHPExcel->getActiveSheet()->getStyle('F')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
$objPHPExcel->getActiveSheet()->getStyle('G')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
$objPHPExcel->getActiveSheet()->getStyle('H')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
$objPHPExcel->getActiveSheet()->getStyle('I')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
$objPHPExcel->getActiveSheet()->getStyle('J')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

$objPHPExcel->getActiveSheet()->getStyle('D')->getNumberFormat()
	->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_TEXT);
$objPHPExcel->getActiveSheet()->getStyle('E')->getNumberFormat()
	->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_TEXT);
$objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
							 ->setLastModifiedBy("Maarten Balliauw")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Test result file");
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1','会员ID')
            ->setCellValue('B1','会员名')
            ->setCellValue('C1','昵称')
            ->setCellValue('D1','手机号')
	   ->setCellValue('E1','QQ号')
            ->setCellValue('F1','用户组')
           ->setCellValue('G1','用户归属')
           ->setCellValue('H1','推广人')
            ->setCellValue('I1','注册时间')
             ->setCellValue('J1','上次登录时间');

$i=2;   
while($v=$db->fetch_row($query)){
 $objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A'.$i, $v['uid'])
    ->setCellValue('B'.$i, $v['username'])
    ->setCellValue('C'.$i, $v['nickname'])
    ->setCellValue('D'.$i, $v['phone']."\t")
    ->setCellValue('E'.$i, $v['realname']."\t")
    ->setCellValue('F'.$i, $arrgroup[$v['gid']]."\t")
    ->setCellValue('G'.$i, $v['fuser']."\t")
    ->setCellValue('H'.$i, $v['tuser']."\t")
    ->setCellValue('I'.$i, date("Y-m-d H:i:s",$v['regdate'])."\t")
    ->setCellValue('J' . $i, date("Y-m-d H:i:s",$v['lastactivity']) . "\t");
 
 
 			$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(18);
 			$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(18);
                        $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(20);
 			$objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(20);
//  			$objAlignA5->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);//水平居右
 $i++;
}
$objPHPExcel->getActiveSheet()->setTitle('会员');
$objPHPExcel->setActiveSheetIndex(0);



ob_end_clean();//清除缓冲区,避免乱码

//header('Content-Type: application/vnd.ms-excel');
header("Content-Type: application/vnd.ms-excel; charset=UTF-8");
header('Content-Disposition: attachment;filename="'.$filename.'.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');


/*
*生成xls文件
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="'.$filename.'.xls"');
header('Cache-Control: max-age=0');
$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
*/

$objWriter->save('php://output');
exit;

