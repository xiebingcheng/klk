<?php
require_once '../include/common.inc.php';
require_once 'function.php';
$auth_rules=auth_group($_SESSION['login_gid']);
?>
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <title>
    <?=$global['config']['title']?>
    _后台管理</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!--[if lt IE 9]>
      <link rel="stylesheet" type="text/css" href="plugins/jquery-ui/jquery.ui.1.10.2.ie.css"
      />
    <![endif]-->
    <link href="assets/css/main2.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/css/fontawesome/font-awesome.min.css">
    <!--[if IE 7]>
      <link rel="stylesheet" href="assets/css/fontawesome/font-awesome-ie7.min.css">
    <![endif]-->
    <!--[if IE 8]>
      <link href="assets/css/ie8.css" rel="stylesheet" type="text/css" />
    <![endif]-->
    <script type="text/javascript" src="assets/js/libs/jquery-1.10.2.min.js">
    </script>
    <script type="text/javascript" src="plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js">
    </script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js">
    </script>
    <script type="text/javascript" src="plugins/slimscroll/jquery.slimscroll.min.js">
    </script>
    <script type="text/javascript" src="plugins/slimscroll/jquery.slimscroll.horizontal.min.js">
    </script>
    <!--[if lt IE 9]>
      <script src="assets/js/libs/html5shiv.js">
      </script>
    <![endif]-->
    <script type="text/javascript" src="assets/js/libs/breakpoints.js">
    </script>
    <!--[if lt IE 9]>
      <script type="text/javascript" src="plugins/flot/excanvas.min.js">
      </script>
    <![endif]-->
    <script type="text/javascript" src="assets/js/app.js">
    </script>
    <script>
      $(document).ready(function() {
        App.init();

      });
    </script>
    </head>
    <body>
<header class="header navbar navbar-fixed-top" role="banner">
      <div class="container">
    <ul class="nav navbar-nav">
          <li class="nav-toggle"> <a href="javascript:void(0);" title=""> <i class="icon-reorder"> </i> </a> </li>
        </ul>
    <a class="navbar-brand" href="#"> <strong>
    <?=mb_substr($global['config']['title'], 0, 30, 'utf-8');?>
    </strong> </a> <a href="#" class="toggle-sidebar bs-tooltip" data-placement="bottom"
        data-original-title="Toggle navigation"> <i class="icon-reorder"> </i> </a>
    <ul class="nav navbar-nav navbar-left hidden-xs hidden-sm">
          <li> <a href="tongji/tj_zaixian.php?type=newuser" target="main"> 在线用户 </a> </li>
          <li> <a href="tongji/tj_users.php" target="main"> 用户统计 </a> </li>
          <li> <a href="tongji/todayuser.php" target="main"> 今日访问明细 </a> </li>
          <li class="dropdown" style="display:none;"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 下拉菜单 <i class="icon-caret-down small"> </i> </a>
        <ul class="dropdown-menu">
              <li> <a href="#"> <i class="icon-user"> </i> 技术支持Q:2397577130 </a> </li>
              <li class="divider"> </li>
            </ul>
      </li>
        </ul>
    <ul class="nav navbar-nav navbar-right">
          <li class="dropdown"> <a href="/<?=empty($_SESSION['login_roomid'])?$default_roomid:$_SESSION['login_roomid']?>" class="dropdown-toggle" target="_blank" > <i class="icon-hand-right"></i> 返回直播室 </a> </li>
          <li class="dropdown user"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-male"> </i> <span class="username">
          <?=$_SESSION[admincp]?>
          </span> <i class="icon-caret-down small"> </i> </a>
        <ul class="dropdown-menu">
              <li class="divider"> </li>
              <li> <a href="login.php?act=user_logout"> <i class="icon-key"> </i> 退出 </a> </li>
            </ul>
      </li>
        </ul>
  </div>
    </header>
<div id="container">
      <div id="sidebar" class="sidebar-fixed">
    <div id="sidebar-content">
          <ul id="nav">
        <?php if(stripos($auth_rules,'sys_set')!==false){ ?>
        <li class="open"> <a href="javascript:void(0);"> <i class=" icon-asterisk"> </i> 系统设置 </a>
              <ul class="sub-menu" style="display: block;">
            <?php if(stripos($auth_rules,'sys_base')!==false){ ?>
            <li > <a href="sys/base.php" target="main"> <i class="icon-angle-right"> </i> 系统配置 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'sys_ban')!==false){ ?>
            <li> <a href="sys/ban.php" target="main"> <i class="icon-angle-right"> </i> 用户屏蔽 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'sys_automsg')!==false){ ?>
            <li> <a href="sys/sysmsg.php" target="main"> <i class="icon-angle-right"> </i> 自动广播 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'sys_notice')!==false){ ?>
            <li> <a href="sys/notice.php" target="main"> <i class="icon-angle-right"> </i> 公告板 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'sys_log')!==false){ ?>
            <li> <a href="sys/log.php" target="main"> <i class="icon-angle-right"> </i> 日志管理 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'sys_log')!==false){ ?>
            <li> <a href="sys/chatlog.php" target="main"> <i class="icon-angle-right"> </i> 聊天记录 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'sys_prize')!==false){ ?>
            <li style="display:none"> <a href="sys/prize.php?getmethod=2" target="main"> <i class="icon-angle-right"> </i> 奖品设置 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'ip_blacklist')!==false){ ?>
            <li> <a href="sys/ip_blacklist.php" target="main"> <i class="icon-angle-right"> </i> IP黑名单 </a> </li>
            <? }?>
          </ul>
            </li>
        <? }?>
        <?php if(stripos($auth_rules,'room_guanli')!==false){ ?>
        <li> <a href="javascript:void(0);"> <i class="icon-hospital"> </i> 房间管理 </a>
              <ul class="sub-menu">
            <?php if(stripos($auth_rules,'room_lists')!==false){ ?>
            <li> <a href="rooms/rooms.php" target="main"> <i class="icon-angle-right"> </i> 房间列表 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'room_adddel')!==false){ ?>
            <li> <a href="rooms/rooms_add.php" target="main"> <i class="icon-angle-right"> </i> 添加房间 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'room_kefu')!==false){ ?>
            <li> <a href="rooms/room_kefu.php" target="main"> <i class="icon-angle-right"> </i> 客服QQ设置 </a> </li>
            <? }?>
          </ul>
            </li>
        <? }?>
        <?php if(stripos($auth_rules,'apps_module')!==false){ ?>
        <li> <a href="javascript:void(0);"> <i class="icon-desktop"> </i> 功能模块 </a>
              <ul class="sub-menu">
            <li style="display:none"> <a href="apps/app_plan_bind.php" target="main"> <i class="icon-angle-right"> </i> 绑定计划 </a> </li>
            <?php if(stripos($auth_rules,'app_video')!==false){ ?>
            <li style="display:none"> <a href="apps/app_video_list.php" target="main"> <i class="icon-angle-right"> </i> 视频库 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'app_course')!==false){ ?>
            <li style="display:none"> <a href="apps/app_course.php" target="main"> <i class="icon-angle-right"> </i> 课程表 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'apps_vote')!==false){ ?>
            <li style="display:none"> <a href="apps/app_vote.php" target="main"> <i class="icon-angle-right"> </i> 投票 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'create_luckcode')!==false){ ?>
            <li style="display:none"> <a href="apps/app_luckcode_create.php" target="main"> <i class="icon-angle-right"> </i> 抽奖码 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'apps_rotate')!==false){ ?>
            <li style="display:none"> <a href="apps/app_rotate.php?getmethod=2" target="main"> <i class="icon-angle-right"> </i> 抽奖统计 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'apps_hongbao')!==false){ ?>
            <li> <a href="apps/app_hongbao.php" target="main"> <i class="icon-angle-right"> </i> 红包 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'tixian_list')!==false){ ?>
            <li> <a href="apps/app_tixian.php" target="main"> <i class="icon-angle-right"> </i> 提现申请 </a> </li>
            <? }?>
          </ul>
            </li>
        <? }?>
        <?php if(stripos($auth_rules,'users_admin')!==false){ ?>
        <li> <a href="javascript:void(0);"> <i class="icon-group"> </i> 用户管理 </a>
              <ul class="sub-menu">
            <?php if(stripos($auth_rules,'robot_list')!==false){ ?>
            <li> <a href="users/rebots.php" target="main"> <i class="icon-angle-right"> </i> 机器人管理 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'users_my')!==false){ ?>
            <li style="display:none"> <a href="users/myusers.php" target="main"> <i class="icon-angle-right"> </i> 我的用户 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'ban_users')!==false){ ?>
            <li> <a href="users/ban_user.php"  target="main"> <i class="icon-angle-right"> </i> 禁言用户 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'users_list')!==false){ ?>
            <li> <a href="users/users.php"  target="main"> <i class="icon-angle-right"> </i> 用户管理 </a> </li>
            <li style="display: none;"> <a href="users/guest.php"  target="main"> <i class="icon-angle-right"> </i> 游客 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'users_tuiguang')!==false){ ?>
            <li style="display:none"> <a href="users/tuiguang.php" target="main"> <i class="icon-angle-right"> </i> 用户推广 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'users_group')!==false){ ?>
            <li> <a href="users/group.php" target="main"> <i class="icon-angle-right"> </i> 用户组管理 </a> </li>
            <? }?>
          </ul>
            </li>
        <? }?>
        <?php if(stripos($auth_rules,'app_admin')!==false){ ?>
        <li> <a href="javascript:void(0);"> <i class="icon-list-ol"> </i> 应用管理 </a>
              <ul class="sub-menu">
            <li class="open-default" style="display:none"> <a href="javascript:void(0);"> <i class="icon-book"> </i> 应用列表 <span class="arrow"> </span> </a>
                  <ul class="sub-menu">
                <?php if(stripos($auth_rules,'apps_hd')!==false){ ?>
                <li> <a href="apps/app_hd.php" target="main"> <i class="icon-volume-up"> </i> 喊单系统 </a> </li>
                <? }?>
                <?php if(stripos($auth_rules,'apps_wt')!==false){ ?>
                <li> <a href="apps/app_wt.php" target="main"> <i class="icon-comments"> </i> 问题答疑 </a> </li>
                <? }?>
                <?php if(stripos($auth_rules,'apps_jyts')!==false){ ?>
                <li> <a href="apps/app_jyts.php" target="main"> <i class="icon-bell"> </i> 交易提示 </a> </li>
                <? }?>
                <?php if(stripos($auth_rules,'apps_scpl')!==false){ ?>
                <li> <a href="apps/app_scpl.php" target="main"> <i class="icon-bell"> </i> 市场评论 </a> </li>
                <? }?>
                <?php if(stripos($auth_rules,'apps_files')!==false){ ?>
                <li> <a href="apps/app_files.php" target="main"> <i class="icon-bell"> </i> 共享文档 </a> </li>
                <? }?>
              </ul>
                </li>
            <?php if(stripos($auth_rules,'apps_manage')!==false){ ?>
            <li> <a href="apps/app_manage.php" target="main"> <i class="icon-globe"> </i> 应用设置 <span class="arrow"> </span> </a> </li>
            <? }?>
          </ul>
            </li>
        <? }?>
        <li> <a href="javascript:void(0);"> <i class="icon-bar-chart"> </i> 数据分析 </a>
              <ul class="sub-menu">
            <?php if(stripos($auth_rules,'tongji_t')!==false){ ?>
            <li class="open-default" style="display:none"> <a href="javascript:void(0);"> <i class="icon-cogs"> </i> 讲师统计 <span class="arrow"> </span> </a>
                  <ul class="sub-menu">
                <li class="open-default"> <a href="tongji/tj_reg.php?type=newuser" target="main"> <i class="icon-user"> </i> 发展会员数 </a> </li>
                <li> <a href="tongji/tj_login.php?type=loginroom" target="main"> <i class="icon-user"> </i> 访客数 </a> </li>
              </ul>
                </li>
            <? }?>
            <?php if(stripos($auth_rules,'tongji_user')!==false){ ?>
            <li> <a href="tongji/tj_users.php" target="main"> <i class="icon-user-md"> </i> 用户统计 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'tongji_l')!==false){ ?>
            <li style="display:none"> <a href="tongji/tj_redbag.php" target="main"> <i class="icon-heart"> </i> 礼物统计 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'tongji_online')!==false){ ?>
            <li> <a href="tongji/tj_zaixian.php?type=newuser" target="main"> <i class="icon-eye-open"> </i> 在线用户 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'tongji_h')!==false){ ?>
            <li> <a href="tongji/history_online.php" target="main"> <i class="icon-eye-open"> </i> 历史在线 </a> </li>
            <? }?>
            <?php if(stripos($auth_rules,'tongji_today')!==false){ ?>
            <li> <a href="tongji/todayuser.php" target="main"> <i class="icon-user-md"> </i> 今日访问明细 </a> </li>
            <? }?>
          </ul>
            </li>
        <?php if(stripos($auth_rules,'mobile_guanli')!==false){ ?>
        <li> <a href="javascript:void(0);"> <i class="icon-tablet"> </i> 移动端设置 </a>
              <ul class="sub-menu">
            <?php if(stripos($auth_rules,'mobile_column')!==false){ ?>
            <li> <a href="mobile/column.php" target="main"> <i class="icon-angle-right"> </i> 导航栏目 </a> </li>
            <? }?>
          </ul>
            </li>
        <? }?>
      </ul>
          <div class="sidebar-widget align-center">
        <div class="btn-group" data-toggle="buttons" id="theme-switcher" style="display:none;">
              <label class="btn active">
            <input type="radio" name="theme-switcher" data-theme="bright">
            <i class="icon-sun"> </i> 白天 </label>
              <label class="btn">
            <input type="radio" name="theme-switcher" data-theme="dark">
            <i class="icon-moon"> </i> 夜晚 </label>
            </div>
      </div>
        </div>
    <div id="divider" class="resizeable"> </div>
  </div>
      <script>
	$('#sidebar-content li li').on('click',function(){
        
                $('#sidebar-content li li').removeClass('current');
		$(this).addClass('current');

	});
	
</script>
      <div id="content">
    <iframe style="overflow:visible" name="main" src="tongji/tj_users.php" frameBorder=0 width="100%" scrolling="yes" height="100%"></iframe>
  </div>
    </div>
</body>
</html>