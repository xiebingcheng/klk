<?php
require_once '../../include/common.inc.php';
$uid = $_SESSION['login_uid'];
$sql = "select * from {$tablepre}sign where userid='$uid' and FROM_UNIXTIME(last_sign_time,'%Y%m%d')=date_sub(curdate(),interval 0 day) limit 0,1";
$query = $db->query($sql);
$signin = false;
if ($db->num_rows($query) > 0) {
    $signin = true;
}
//获取历史签到数据
$ym= date('Y-m',time());
 $query=$db->query("select addtime from {$tablepre}sign_info where userid='$uid' and FROM_UNIXTIME(addtime,'%Y-%m')='$ym'  ");
 $signdata='[';
  while($row=$db->fetch_row($query)){ 
     $signdata.= date('d',$row['addtime']).',';
      
  }
  if(strlen($signdata)>1){
  $signdata= substr($signdata, 0, -1);}
  $signdata.=']';

?>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>签到</title>
    <link rel="stylesheet" href="./css/qiandao_style.css">
</head>

<body id="signin">
    <div class="qiandao-warp" style="display:none">
        <div class="qiandap-box">
            <div class="qiandao-con clear">
                <div class="qiandao-left">
                    <div class="qiandao-left-top clear">
                        <div class="current-date"></div>
                        <div class="qiandao-history qiandao-tran qiandao-radius" id="js-just-qiandao"><?=$signin?'已签到':'点击签到'?></div>
                        <div class="qiandao-history qiandao-tran qiandao-radius" id="js-qiandao-history" style="display: none;">我的签到</div>
                    </div>
                    <div class="qiandao-main" id="js-qiandao-main">
                        <ul class="qiandao-list" id="js-qiandao-list"> 
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 我的签到 layer start -->
    <div class="qiandao-layer qiandao-history-layer" style="display: none;">
        <div class="qiandao-layer-con qiandao-radius">
            <a href="javascript:;" class="close-qiandao-layer qiandao-sprits"></a>
            <ul class="qiandao-history-inf clear">
                <li id="persist">
                    <p>连续签到</p>
                    <h4></h4>
                </li>
                <li id="cur-month">
                    <p>本月签到</p>
                    <h4></h4>
                </li>
                <li id="total">
                    <p>总共签到数</p>
                    <h4></h4>
                </li>
                <li id="sum-reward">
                    <p>签到累计奖励</p>
                    <h4></h4>
                </li>
            </ul>
            <div class="qiandao-history-table">
                <table>
                    <thead>
                        <tr>
                            <th>签到日期</th>
                            <th>奖励</th>
                            <th>说明</th>
                        </tr>
                    </thead>
                </table>
                <div class="signin-records-container">
                    <table>
                        <tbody id="signin-records">
                        </tbody>
                    </table>
                </div>
                
            </div>
        </div>
        <div class="qiandao-layer-bg"></div>
    </div>
    <!-- 我的签到 layer end -->
    <!-- 签到 layer start -->
    <div class="qiandao-layer qiandao-active" style="display: none;">
        <div class="qiandao-layer-con qiandao-radius">
            <a href="javascript:;" class="close-qiandao-layer qiandao-sprits"></a>
            <div class="yiqiandao clear">
                <div class="yiqiandao-icon qiandao-sprits"></div>
                <span class="persisit-signin-tip"></span>
            </div>
            <div class="qiandao-jiangli qiandao-sprits">
                <span class="qiandao-jiangli-num"></span>
            </div>
          
        </div>
        <div class="qiandao-layer-bg"></div>
    </div>
    <button style="display:none" id="ShowSigninRes">签到</button>
    <!-- 签到 layer end -->
    <script src="./js/jquery-1.10.2.min.js"></script>
    <script src="./js/qiandao_js.js"></script>
    <script src="/room/m/script/layer.js"></script>
<script>
    var rid = '<?=$rid?>';
    var isMobile = '<?=$isMobile?>';
    if (!isMobile) {
        $('.qiandao-warp').show();
    }
    $(function() {
        if (isMobile) {
            $('#ShowSigninRes').click();
            $('#signin').addClass('ismobile');
        }
    })
    var dateArray =<?=$signdata?>;
</script>


</body></html>