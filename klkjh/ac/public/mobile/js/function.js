function addFavorite(obj, table_name, object_id ,url, title) {
	try {
    	$.ajax({
			url: '/public/index.php/mobile/ajax/addFavorite',
		    type: 'GET',
		    dataType: 'json',
		    data:{"table_name":table_name, "object_id":object_id, "url":url, "title":title},
		    timeout: 30000,
		    success: function(data){
		    	result=data.result; 
		    	if(result=='1'){
		    		window.location.reload();		        
		    	}
		    },
		    error:function(e){
		    	console.log(e);
		    }
        });
    }catch (e){
    	
    }
}

function delFavorite(id, title) {
	popTipShow.confirm('删除'+title,'确认删除？',['确 定','取 消'],
		function(e){
			//callback 处理按钮事件
			var button = $(e.target).attr('class');
			if(button == 'ok'){
				try {
			    	$.ajax({
						url: '/public/index.php/mobile/ajax/delFavorite',
					    type: 'GET',
					    dataType: 'json',
					    data:{"id":id},
					    timeout: 30000,
					    success: function(data){
					    	result=data.result; 
					    	if(result=='1'){
					    		$('#favorite'+id).remove();
					    	}					    	
					    },
					    error:function(e){
					    	console.log(e);
					    }
			        });
			    }catch (e){
			    	
			    }
			    this.hide();
			}
			if(button == 'cancel'){
				this.hide();
			}
		}
	);
}

function showPlan(ids, names) {
	var html = "";
	ids=ids.split(',');
	names=names.split(',');
	if(ids.length!=names.length){
		return;
	}
	for (var i = 0; i < ids.length; i++){
		html += '<div class="plan_btn"><a href="/public/index.php/mobile/plan/view/played_id/'+ids[i]+'">'+names[i]+'</a></div>';
	}
	popTipShow.confirm('精准计划',html,['确 定','取 消'],
		function(e){
		  	//callback 处理按钮事件
		  	var button = $(e.target).attr('class');
		  	if(button == 'ok'){			
		  		this.hide();										
		  	}
		  	if(button == 'cancel') {			
		  		this.hide();			
		  	}
		}
	);
}