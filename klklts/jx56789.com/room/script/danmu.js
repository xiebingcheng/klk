 $("#danmu").danmu({
    left:0,
    top:160,
    height:120,
    width:"100%",
    zindex :1, 
    speed:10000,
    opacity:1,
    font_size_small:16,
    font_size_big:30,
    SubtitleProtection:true, 
    positionOptimize:true,
    top_botton_danmu_time:6000
  });

   $('#danmu').danmu('danmuStart');
   
   $("#danmu").danmu("addDanmu",[
   { text:"这是滚动弹幕" ,color:"white",size:1,position:0,time:2}
 
])

  //发送弹幕，使用了文档README.md第7节中推荐的方法
  function send(){
      
    var text = document.getElementById('text').value;
    var color = document.getElementById('color').value;
    var position = document.getElementById('position').value;
    var time = $('#danmu').data("nowTime")+1;
    var size =document.getElementById('text_size').value;
    var text_obj='{ "text":"'+text+'","color":"'+color+'","size":"'+size+'","position":"'+position+'","time":'+time+'}';


    var new_obj=eval('('+text_obj+')');
    $('#danmu').danmu("addDanmu",new_obj);
    document.getElementById('text').value='';
  }
  
 





 