<?php
set_time_limit(0); 
require_once '../../include/common.inc.php';
require_once '../function.php';
require_once '../assets/PHPExcel.php';
if(stripos(auth_group($_SESSION['login_gid']),'sys_log')===false)exit(denied_pape());

if($starttime!='' && $endtime!=''){
$filename=$starttime.'到'.$endtime;}else{
    $filename='日志';
}

$query=$db->query("select * from {$tablepre}auth_group order by id desc");

$arrgroup=array();
while($row=$db->fetch_row($query)){
	$arrgroup[$row['id']]=$row['title'];
	}

        
	$sql="select *  from {$tablepre}msgs   where 1=1 ";
               if($logtype!="" && $logtype!="-1" ){
	$sql.=" and type='$logtype' ";
}
if($starttime!=""){
    $int_starttime =strtotime($starttime);
  
    $sql.=" and mtime>='$int_starttime'";
    
    }
    if($endtime!=""){
    $int_endtime =strtotime($endtime)+24*3600;;

    $sql.=" and mtime<'$int_endtime' ";
    
    }
      if(!empty($login_roomid)){
          
        $sql.=" and rid='$login_roomid' " ;
      }
$excelname='';
       if($keys!=''){
          $sql.=" and  (uid like '%$keys%' or ip like '%$keys%' or uname like '%$keys%') "; 
          $excelname='【'.$keys.'】'; 
       } 
       $sql.=" order by id desc";
        $query=$db->query($sql);
      
	if($db->num_rows($query)==0){
          echo '你查询的条件下无数据!&nbsp;&nbsp;<a href="javascript:history.go(-1)">点击返回</a> ';
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



$objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
							 ->setLastModifiedBy("Maarten Balliauw")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Test result file");
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1','用户ID')
            ->setCellValue('B1','用户名')
           ->setCellValue('C1','用户组')
           ->setCellValue('D1','IP')
           ->setCellValue('E1','时间')
           ->setCellValue('F1','描述')
            ->setCellValue('G1','来源');
       

$i=2;   
while($v=$db->fetch_row($query)){
 $objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A'.$i, $v['id'])
    ->setCellValue('B'.$i, $v['uname'])
   ->setCellValue('C'.$i, $arrgroup[$v['ugid']]."\t")
    ->setCellValue('D'.$i, $v['ip']."\t")
    ->setCellValue('E'.$i, date("Y-m-d H:i:s",$v['mtime'])."\t")
    ->setCellValue('F'.$i, $v['msg']."\t")
    ->setCellValue('G'.$i, $v['laiyuan']."\t");

 
 
 			$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(18);
 			$objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(18);
                        $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(20);
 			$objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(40);
//  			$objAlignA5->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);//水平居右
 $i++;
}
$objPHPExcel->getActiveSheet()->setTitle($excelname.'直播室日志');
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

