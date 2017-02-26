$(function(){
	$("#loginSubmit").click(function(){
		var u = $("#Username").val();
		var p = $("#Password").val();
		$.post('LoginServlet',{Username:u,Password:p},function(res){
			if(res.success){
				location.reload();
			}else{
				alert('检查用户名和密码！')
			}
		});
	
	});
	$("#login").bind("selectstart",function(){return false;});
	
	$("#Release").click(function(){
		var Rcontent =$("#Releasecontent").val();
		var date = new Date();
		var createdTime = date.getFullYear()+"-"+date.getMonth()+"-"+date.getDay()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()
		
		$.post('commentServlet',{Releasecontent:Rcontent,jounalId:jounalId},function(res){
			if(res.success){
				var src = res.user.avatarsrc;
				var name = res.user.name;
				var li = $('<li>'+
						'<div>'+
						'<img src="'+src+'" class="uesr-Avatar" alt="">'+
						'<div class="user">'+name+'</div>'+
						'<p>'+
						Rcontent+
						'</p>'+
						'</div>'+
						'<div class="comment-header">'+
						'<p class="comment-time">'+createdTime+'</p>'+
						'<a href="/Djlongzai/APP.jsp">来自落网客户端</a>'+
						'<div>'+
						'<a href="javascript:;"><span class="icon-like"></span>赞</a>'+
						'</div>'+
						'</div>'+
				'</li>');
				$(".comment-list > ul").prepend(li);
				alert('发表成功');
			}else{
				alert('请登录');
			}
		})
	});
	$("#reg").click(function(){
		verify();
	})
	$("#regUsername").blur(function(){ 
		userExist();
	}); 
	$("#user").mouseover(function(){
		var a = document.getElementById('user');
		starMover(a,{height:100},function(){});
	})
	$("#user").mouseout(function(){
		var a = document.getElementById('user');
		starMover(a,{height:45},function(){});
	})
	$("#Exit").click(function(){
		$.get('LoginServlet',{mes:1,},function(res){
			location.reload();
		});
	
	});
	
});
function Display(){
    $("#login").click(function(){
    	 if(getStyle($("#login-box")[0],"display")=="none"){
         	$("#login-box").show();
         }
         else{
         	$("#login-box").hide();
         	$("#reg-box").hide();
         }
    	 
    });
    
    $("#loginbtn").click(function(){
    	$("#reg-box").show();
    })
    $("#regbtn").click(function(){
    	 $("#login-box").show();
        $("#reg-box").hide();
    })
}

function verify(){
	var re=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
	var Email = $("#regEmail").val();
	if($("#regUser").val()==null || $("#regUsername").val()==null || $("#regPassword").val()==null){
		$("#reg").html("请输入完善信息");
		return ;
	}else if(!re.test(Email)){
		$("#reg").html("请输入正确的邮箱");
		return ;
	}else{
		var u = $("#regUsername").val();
		var p = $("#regPassword").val();
		var n = $("#regUser").val();
		var e = $("#regEmail").val();
		$.post('RegServlet',{Username:u,Password:p,Name:n,Email:e},function(res){
			if(res.success){
				location.reload();
			}else{
				alert('你的输入错误')
			}
		});
	}
}
function userExist(){
	var user = $("#regUsername").val();
	$.post('luooHttpServlet',{User:user},function(res){
		if(res.success){
			$("#tishi").css("display","block");
		}else{
			$("#tishi").css("display","none");
		}
	});
}