<?php

/**
 * Excela表格操作类
 * @author Administrator
 *
 */
class ExcelCommon
{
	
	
	public static $isFromSecond ;
	/**
	 * 将数据导出成Excel表格数据格式
	 *
	 * @param String $sheetname 表格名
	 * @param String $filename 文件名
	 * @param array $header 标题信息
	 * @param array $data 内容信息
	 * 
	 * @return String 返回Excel表格字符串数据，失败则返回false
	 */
	public static function export( $sheetname, $filename, $header, $data )
	{
		$abc = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
                    ,'AA','AB','AC');
		
		// 创建一个处理对象实例
		$objExcel = new PHPExcel();
		
		// 创建文件格式写入对象实例, uncomment
		$objWriter = new PHPExcel_Writer_Excel5($objExcel);     // 用于其他版本格式

		$objExcel->setActiveSheetIndex(0);
		
		$objActSheet = $objExcel->getActiveSheet();
		
		//设置当前活动sheet的名称
		$objActSheet->setTitle($sheetname);

		//设置单元格内容
		
		/* 表头 */
		
		
// 		for($i=0;$i<count($header);$i++) {
// 			$name = "";
// 			$objActSheet->setCellValue($abc[$i] . 1, $name);
// 			$objActSheet->getColumnDimension($abc[$i])->setWidth(20);
// 		}
		
		//dump($header);
		//dump($data);
		
		for($i=0;$i<count($header);$i++) {
			$name = $header[$i];
		    if(self::$isFromSecond){
		    	$objActSheet->setCellValue($abc[$i] . 2, $name);
		    }else {
		    	$objActSheet->setCellValue($abc[$i] . 1, $name);
		    }
			
			$objActSheet->getColumnDimension($abc[$i])->setWidth(20);
			
			//echo '头部'.strval($abc[$i]. 1).'<Br>';
		}
		
		/* 字段值 */
		for($i=0;$i<count($data);$i++) {
			$row = $data[$i];
			$keys = array_keys($row);
			for($j=0;$j<count($row);$j++) {
			//	echo '头部'.$abc[$j] . ($i+2).'<Br>';
				$value = $row[$keys[$j]];
				if(self::$isFromSecond){
					if (strlen($value)<10) $objActSheet->setCellValue($abc[$j] . ($i+3), $value);
					else $objActSheet->setCellValueExplicit($abc[$j] . ($i+3), $value, PHPExcel_Cell_DataType::TYPE_STRING);
				}else{
					if (strlen($value)<10) $objActSheet->setCellValue($abc[$j] . ($i+2), $value);
					else $objActSheet->setCellValueExplicit($abc[$j] . ($i+2), $value, PHPExcel_Cell_DataType::TYPE_STRING);
				}
			
			}
		}
		
		
	//	die();
		
		$objStyleA5 = $objActSheet->getStyle('A1');
		
		//--------------------- 设置全局样式
		//设置字体
		//$objFontA5 = $objStyleA5->getFont();
		//$objFontA5->setName('微软雅黑');
		//$objFontA5->setSize(10);
		
		$objActSheet->duplicateStyle($objStyleA5, 'A1:' . $abc[count($header)-1] . (count($data)-1));
		
		//--------------------- 设置隔行样式
		//设置填充颜色
		$objFillA5 = $objStyleA5->getFill();
		$objFillA5->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
		$objFillA5->getStartColor()->setARGB('FFefefef');
		
		$objActSheet->duplicateStyle($objStyleA5, 'A1:' . $abc[count($header)-1] . '1');
		
		/* 字段值 */
		for($i=0;$i<count($data);$i+=2) {
			$objActSheet->duplicateStyle($objStyleA5, 'A' . ($i+3) . ':' . $abc[count($header)-1] . ($i+3));
		}
		
		//--------------------- 设置表头样式
		//设置字体
		//$objFontA5->getColor()->setARGB('FF3a3a3a');
		
		//设置对齐方式
		$objAlignA5 = $objStyleA5->getAlignment();
		$objAlignA5->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$objAlignA5->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER);
		
		//设置填充颜色
		$objFillA5->getStartColor()->setARGB('FFa3a3a3');
		
		//从指定的单元格复制样式信息.
		$objActSheet->duplicateStyle($objStyleA5, 'A1:' . $abc[count($header)-1] . '1');
		
		// ------------------------------------------

		$objWriter->save($filename);
		return true;
	}
	
	/**
	 * 提供文件下载，将文件发送至浏览器
	 *
	 * @param String $filename 文件路径名
	 * @param String $name 显示在浏览器的文件名，不包含后缀名
	 * @param String $charset 输出的编码
	 * 
	 * @param mixed 读取成功则返回读取的内容，失败则返回false
	 */
	public static function download( $filename, $name, $charset )
	{
		if (!$filename||!file_exists($filename)) {
			return false;
		}
	
		/* 文件扩展名 */
		$extName = strtolower(substr($filename, strrpos($filename, ".")==0?strlen($filename):strrpos($filename, ".")+1));
		
		if(!$extName)return false;
	
		/* 判断文件类型 */
		$contentType = null;
		switch($extName){
	
			case "pdf":
				$contentType = "application/pdf";
				break;
			case "exe":
				$contentType = "application/octet-stream";
				break;
			case "zip":
				$contentType = "application/zip";
				break;
			case "doc":
				$contentType = "application/msword";
				break;
			case "xls":
				$contentType = "application/vnd.ms-excel";
				break;
			case "ppt":
				$contentType = "application/vnd.ms-powerpoint";
				break;
			case "gif":
				$contentType = "image/gif";
				break;
			case "png":
				$contentType = "image/png";
				break;
			case "jpeg":
			case "jpg":
				$contentType = "image/jpg";
				break;
			case "mp3":
				$contentType = "audio/mpeg";
				break;
			case "mp3":
				$contentType = "audio/mpeg";
				break;
			case "wav":
				$contentType = "audio/x-wav";
				break;
			case "mpeg":
			case "mpg":
			case "mpe":
				$contentType = "video/mpeg";
				break;
			case "mov":
				$contentType = "video/quicktime";
				break;
			case "avi":
				$contentType = "video/x-msvideo";
				break;
			case "json":
				$contentType = "application/json";
				break;
			case "xml":
				$contentType = "text/xml";
				break;
			case "html":
			case "htm":
			case "txt":
				$contentType = "text/html";
				break;
			default:
				$contentType = "application/force-download";
		}
	
		/* 发送至浏览器 */
		$name = mb_convert_encoding($name, $charset, "utf-8,gbk,gb2312,ISO-8859-1");
		header("Pragma: public");
		header("Expires: 0");
		header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
		header("Cache-Control: public");
		header("Content-Type: {$contentType}; charset=$charset");
		header("Content-Description: File Transfer");
		header("Content-Disposition:attachment;filename={$name}.{$extName}");
		header("Content-Transfer-Encoding: binary");
		echo file_get_contents($filename);
		// exit();
	}
}