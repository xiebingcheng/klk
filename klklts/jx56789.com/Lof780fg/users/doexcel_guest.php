<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
require_once '../assets/PHPExcel.php';
if(stripos(auth_group($_SESSION['login_gid']),'users_admin')===false)exit(denied_pape());
$dateinfo=$_POST['dateinfo'];

switch ($dateinfo) {
    case 0:
        //全部
      $begintime='';
        $endtime='';
        $filename='all';
        break;
    case 1:
        //本日
       $begintime=mktime(0,0,0,date('m'),date('d'),date('Y'));;
        $endtime=mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;;
        $filename=date("Y-m-d");
        break;
    case 2:
        //昨日
       $begintime=mktime(0,0,0,date('m'),date('d')-1,date('Y'));
       $endtime=mktime(0,0,0,date('m'),date('d'),date('Y'))-1;
        $filename=date("Y-m-d",$begintime);
        break;
     case 3:
         //本周
      $begintime=mktime(0,0,0,date('m'),date('d')-date('w')+1,date('Y'));
      $endtime=mktime(23,59,59,date('m'),date('d')-date('w')+7,date('Y'));
        $filename=date("Y-m-d",$begintime).'到'.date("Y-m-d",$endtime);
        break;
     case 4:
         //本月
     $begintime=mktime(0,0,0,date('m'),1,date('Y'));
      $endtime=mktime(23,59,59,date('m'),date('t'),date('Y'));
      $filename=date("Y-m-d",$begintime).'到'.date("Y-m-d",$endtime);
        break;
     case 5:
         //本年
       $begintime=mktime(0,0,0,1,1,date('Y'));
       $endtime=mktime(23,59,59,12,31,date('Y'));
      $filename=date("Y-m-d",$begintime).'到'.date("Y-m-d",$endtime);
        break;
}
 







        
	$sql="select *  from {$tablepre}guest  where 1=1  ";
	if($begintime!="" && $endtime!="" ){
	$sql.=" and  regdate>='$begintime' and regdate<='$endtime' ";
}
        
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


$objPHPExcel->getActiveSheet()->getStyle('B')->getNumberFormat()
	->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_TEXT);
$objPHPExcel->getActiveSheet()->getStyle('C')->getNumberFormat()
	->setFormatCode(PHPExcel_Style_NumberFormat::FORMAT_TEXT);
$objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
							 ->setLastModifiedBy("Maarten Balliauw")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Test result file");
$objPHPExcel->setActiveSheetIndex(0)
   
            ->setCellValue('A1','昵称')
            ->setCellValue('B1','手机号')
	   ->setCellValue('C1','QQ号')
          ->setCellValue('D1','注册ip')    
           ->setCellValue('E1','用户归属')
           ->setCellValue('F1','推广人')
            ->setCellValue('G1','注册时间')
             ->setCellValue('H1','上次登录时间');

$i=2;   
while($v=$db->fetch_row($query)){
 $objPHPExcel->setActiveSheetIndex(0)
        
    ->setCellValue('A'.$i, $v['username'])

    ->setCellValue('B'.$i, $v['phone']."\t")
    ->setCellValue('C'.$i, $v['realname']."\t")
    ->setCellValue('D'.$i, $v['regip']."\t")
    ->setCellValue('E'.$i, $v['fuser']."\t")
    ->setCellValue('F'.$i, $v['tuser']."\t")
    ->setCellValue('G'.$i, date("Y-m-d H:i:s",$v['regdate'])."\t")
    ->setCellValue('H' . $i, date("Y-m-d H:i:s",$v['lastactivity']) . "\t");
 
 
 			$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(18);
 			$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(18);
                        $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(20);
 			$objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(20);
//  			$objAlignA5->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);//水平居右
 $i++;
}
$objPHPExcel->getActiveSheet()->setTitle('游客');
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

