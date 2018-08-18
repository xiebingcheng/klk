<?php
require_once '../../include/common.inc.php';
require_once '../function.php';
if(stripos(auth_group($_SESSION['login_gid']),'users_group')===false)exit("没有权限！");
if($act=="getGroupRule"){ 
    //获取当前登录用户组的所有权限
    $query=$db->query("select * from {$tablepre}auth_group where id='$id'");
while($row=$db->fetch_row($query)){
	$rules=$row['rules'];
}
$rules=explode(',',$rules);
//列出系统所有权限
  $query=$db->query("select id,pid,title,rulename from {$tablepre}auth_rule where type='$type' order by ov asc ");
while($row=$db->fetch_row($query)){ 

    if(in_array($row['rulename'],$rules)){$row['checked']=true;}
       //  unset($row['rulename']);
   
	$ruleslist[]=$row;
    
}
  echo json_encode($ruleslist);
  exit;  
}
if($act=="updateAuthGroupRule"){ 
    
    group_rules_edit($id,implode(',',$auth_rule_ids));
    $data['code']=1;
    $data['msg']='授权成功';
    echo json_encode($data);
    
    exit;
}


?>
<!DOCTYPE HTML>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" />
<!-- 下面的样式，仅是为了显示代码，而不应该在项目中使用-->
<link href="../assets/css/prettify.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../assets/css/ztree-metro-style.css">
<style type="text/css">
code { padding: 0px 4px; color: #d14; background-color: #f7f7f9; border: 1px solid #e1e1e8; }
input,select{vertical-align:middle;}
.liw { width:160px; height:25px; line-height:25px;}
</style>
</head>
<body>
<div class="container" style="margin-bottom:50px;">
    <div style="float:left;width: 40%;    padding-left: 200px;">
 <div style="border-bottom:1px dashed #CCCCCC; padding:5px; margin-bottom:5px;"><strong>后台权限</strong></div>
          <ul id="tree" class="ztree"></ul>
          </div>
      <div style="float:right; width: 40%;">
 <div style="border-bottom:1px dashed #CCCCCC; padding:5px; margin-bottom:5px;"><strong>前台权限</strong></div>
          <ul id="tree2" class="ztree"></ul>
  </div>
  <div style="position:fixed; bottom:0; background: #FFF; width:100%; padding-top:5px;">
    <button type="button" id="auth-btn" class="button button-success">确定</button>
    <button type="button"  class="button" onclick="layer_close()">关闭</button>
    <input type="hidden" name="act" value="group_rules_edit">
  </div>

</div>
<script type="text/javascript" src="../assets/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript" src="../assets/layer/layer.js"></script>
<script src="../assets/js/jquery.ztree.all.min.js"></script>
<script>
        $(document).ready(function(){
        /**
         * 加载树形授权菜单
         */
        var _id =<?=$id?>;
        var tree = $("#tree");
          var tree2 = $("#tree2");
        var zTree;
        var zTree2;

        // zTree 配置项
        var setting = {
            check: {
                enable: true
            },
            view: {
                dblClickExpand: false,
                showLine: true,
                showIcon: false,
                selectedMulti: false
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "pid",
                    rootpid: ""
                },
                key: {
                    name: "title"
             
                }
            }
        };

        $.ajax({
            url: "group_rule.php?act=getGroupRule",
            type: "post",
            dataType: "json",
            cache: false,
            data: {
                id: _id,
                type:0
            },
            success: function (data) {
                zTree = $.fn.zTree.init(tree, setting, data);
            }
        });
  $.ajax({
            url: "group_rule.php?act=getGroupRule",
            type: "post",
            dataType: "json",
            cache: false,
            data: {
                id: _id,
                type:1
            },
            success: function (data) {
                zTree2 = $.fn.zTree.init(tree2, setting, data);
            }
        });
        /**
         * 授权提交
         */
        $("#auth-btn").on("click", function () { 

            var checked_ids,checked_ids2,auth_rule_ids = [];
            checked_ids = zTree.getCheckedNodes(); // 获取当前选中的后台checkbox
            checked_ids2 = zTree2.getCheckedNodes(); // 获取当前选中的前台checkbox
            $.each(checked_ids, function (index, item) { 
              auth_rule_ids.push(item.rulename);
            });
             $.each(checked_ids2, function (index, item) { 
              auth_rule_ids.push(item.rulename);
            });
          
            $.ajax({
                url: "group_rule.php?act=updateAuthGroupRule",
                type: "post",
                cache: false,
                 dataType:'JSON',
                data: {
                    id: _id,
                    auth_rule_ids: auth_rule_ids
                },
                success: function (data) {
                     if(data.code === 1){
                        setTimeout(function () {
                           window.location.reload(); 
                        }, 1000);
                    }
                 
                   
                    layer.msg(data.msg);
                }
            });
        });
    });
function layer_close(){
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}

</script>
</body>
</html>
