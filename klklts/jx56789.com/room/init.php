<?php
require_once '../include/common.inc.php';
//获取用户分组
$query=$db->query("select * from {$tablepre}auth_group order by ov desc");
while($row=$db->fetch_row($query)){
    if($row[id]==0){$groupli.='<div id="group_rebots"></div>';}
	$grouparr.="grouparr['{$row[id]}']=".json_encode($row).";\n";
}
echo "var grouparr=new Array();";

echo $grouparr;
?>
