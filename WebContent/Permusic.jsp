<%@page import="services.CommentService"%>
<%@page import="services.JournalServices"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.Journal"%> 
<%@page import="java.util.List"%> 
<%@page import="model.Song"%> 
<%@page import="model.Comment"%>
<%@page errorPage="/error.jsp" %>
<%
	String id = (String)request.getParameter("id");
    Journal journal = JournalServices.getJournalById(id);
    List<Song> songs = JournalServices.getSongsByJouralId(id);
    List<Comment> comments = CommentService.getCommentALLByjournalId(id);
    int count = JournalServices.getJournalcount();
    int CommentCount = CommentService.getCommentcount(id);
    int nextJournalid = JournalServices.getIdadd(id);
	int upJournalid = JournalServices.getIdsub(id);
%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="shortcut icon" href="img/favicon.ico">
    <script>
		var jounalId = "<%=id%>";
	</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="contents">
    <div class="back-Per"><a href="<%=request.getContextPath() %>/Periodical.jsp?p=1">&#60 返回期刊首页</a></div>
    <h1><%=journal.getJournalName()%></h1>
    <div class="Per-list">
        <div id="Per-list-up" Journalid="<%=journal.getId()%>">
        	<a href="<%=request.getContextPath()%>/Permusic.jsp?id=<%=upJournalid%>"><span class="Per-list-up"></span></a>
        </div>
        <img src="<%=journal.getJournalCover()%>" class="uesr-Avatar" alt=""/>
        <%if(nextJournalid!=0){ %>
	        <div id="Per-list-down" count ="<%=JournalServices.getJournalcount() %>" >
	            <a href="<%=request.getContextPath()%>/Permusic.jsp?id=<%=nextJournalid%>"><span class="Per-list-down"></span></a>
	        </div>
        <%} %>
    </div>
    <div class="per-about">
        <p><%=journal.getIntro()%></p>
    </div>
    <div class="per-author">
        <p><span class="icon_author"><img src="img/luoo.gif" alt=""/></span><a href=""><%=journal.getJournalAuthor() %> <%=journal.getJournalDate() %></a></p>
    </div>
    <div class="player">
        <div class="covers">
        	<%if(songs.size()>0){ %>
        	<img id="singercover" src="<%=songs.get(0).getCoverSrc()%>" class="uesr-Avatar" alt=""/>
        	<%} %>
        </div>
        <div id="player">
            <div class="playheader">
                <span><%=journal.getJournalName()%></span>
                <%if(songs.size()>0){ %>
                <p id="song">Song:<%=songs.get(0).getSong()%></p>
                <p id="singer">Singer:<%=songs.get(0).getSinger()%></p>
                <%} %>
            </div>
            <div class="control">
                <span id="play-up"></span>
                <span id="play" class="play"></span>
                <span id="play-down"></span>
            </div>
            <div class="player-show">
                 <div class="player-progress">
                     <div id="play-progress"></div>
                 </div>
                <div id="currentTime">00:00 <span>/</span></div>
                <div id="endTime">04:03</div>
                <div id="volume">
                    <span class="volume-btn"></span>
                    <div class="volume-progress">
                     <div id="volume-progress"></div>
                 	</div>
                    <span class="for-btn"></span>
                </div>
            </div>
        </div>
        <div class="music-list">
            <ul>
            <%for(int i=0;i<songs.size();i++){%>
            	<li class="play-control-btn" 
            		song-url="<%=songs.get(i).getMusicSrc()%>"
            		song-cover-url="<%=songs.get(i).getCoverSrc()%>"
            		song="<%=songs.get(i).getSong()%>"
            		song-singer="<%=songs.get(i).getSinger()%>">
            		<span class="icon-play-controlA"></span>
            	<%="0"+(i+1)+"."+songs.get(i).getSong()%>
            	<span class="music-list-author">
            	<%=songs.get(i).getSinger() %>
            	</span></li>
            	<%} %>
            </ul>
        </div>
        <audio id="Audio" style="display:none;" <%if(songs.size()>0){ %>src="<%=songs.get(0).getMusicSrc() %>"<%} %> controls="controls" loop="loop"></audio>
    </div>
    <div class="thanks">
        <p>你们的支持，会让落网走得更远。</p>
        <a href=""><span>感谢</span></a>
        <p><a href="">已有2人表示感谢></a></p>
    </div>

    <div id="Top-btn" class="top-btn">
        <a href="javascript:;"><span class="icon_Topbtn"></span></a>
    </div>
    <div class="comment-publish">
        <div class="comment_content">
            <textarea id="Releasecontent" name="comment" maxlength="400"></textarea>
            <span id="Release">发布</span>
        </div>
        <div class="comment-list">
            <ul>
            	<%for(int i=0;i<CommentCount;i++){ %>
	                <li>
	                    <div>
	                        <img src="<%=comments.get(i).getAvatarsrc() %>" class="uesr-Avatar" alt=""/>
	                        <div class="user"><%=comments.get(i).getUsername()%></div>
	                        <p>
	                        <%=comments.get(i).getContent()%>
	                        </p>
	                    </div>
	                    <div class="comment-header">
	                        <p class="comment-time"><%=comments.get(i).getCreatedTime()%></p>
	                        <a href="<%=request.getContextPath() %>/APP.jsp">来自落网客户端</a>
	                        <div>
	                            <a href="javascript:;"><span class="icon-like"></span>赞</a>
	                            <!-- <a href="javascript:;"><span class="icon-Reply"></span>回复</a> -->
	                        </div>
	                    </div>
	                </li>
                <%} %>
            </ul>
        </div>
    </div>
</div>
<div class="footer">
    <div class="footer-list">
        <div class="FOOTER">
            <ul>
                <li>@最坚硬的肥皂</li>
                <li><a href=""><span class="icon_logoMusic"></span></a></li>
                <li><a href=""><span class="icon_logoQQ"></span></a></li>
                <li><a href=""><span class="icon_logoWX"></span></a></li>
                <li><a href=""><span class="icon_logoXL"></span></a></li>
                <li><a href=""><span class="icon_logoDB"></span></a></li>
            </ul>
        </div>
    </div>
</div>

<script>
    var Top_btn = document.getElementById('Top-btn');
    Top(Top_btn,800);
    Top_btn_onclick(Top_btn);
    Display();
    var played = document.getElementById('play');
    var Audio = document.getElementById('Audio');
    var singercover = document.getElementById('singercover');
    var singer = document.getElementById('singer');
    var song = document.getElementById('song');
    var playprogress = document.getElementById('play-progress');
    var currentTime = document.getElementById('currentTime');
    var endTime = document.getElementById('endTime');
    var audioStatus = "paused";
    var timer = null;
    Audio.addEventListener("pause", function(){
        audioStatus = "paused";
    });
    Audio.addEventListener("playing", function(){
        audioStatus = "playing";
    });
    played.onclick = function(){
        if(audioStatus == "paused"){
            Audio.play();
            played.className = "stop";
        }else{
            Audio.pause();
            clearInterval(timer);
            played.className = "play";
        }
    }
 	$('.play-control-btn').click(function(){
 		Audio.src = $(this).attr("song-url");
 		singercover.src =  $(this).attr("song-cover-url");
   		singer.innerHTML =  $(this).attr("song-singer");
   		song.innerHTML =  $(this).attr("song");
   		played.className = "stop";
   		playprogress.style.width = 0+"px";
   		var index = $(this).index();
   		Audio.play();
   		Audio.currentIndex = index;
   		clearInterval(timer);
    });
	Audio.oncanplaythrough = function(){
		timer = setInterval(function(){
			var currentTimes = Audio.currentTime;
			var time = Audio.duration;
			var speed = currentTimes/time;
			var currentmin = parseInt((currentTimes-(currentTimes%60))/60);
			var currentsec = parseInt(currentTimes%60);
			if(currentsec>=10){
				currentTime.innerHTML = "0"+currentmin+":"+currentsec+"/";
			}else{
				currentTime.innerHTML = "0"+currentmin+":"+"0"+currentsec+"/";
			}
			if(audioStatus == "playing"){
				playprogress.style.width = speed*140+"px";
			}
			if(playprogress.offsetWidth>=140){
				playprogress.style.width = 140+"px";
			}
		},999);
		var time = Audio.duration;
 		var endmin = parseInt((time-(time%60))/60);
 		var endsec = parseInt(time%60);
 		if(endsec<10){
 			endTime.innerHTML = "0"+endmin+":"+"0"+endsec;
 		}else{
 			endTime.innerHTML = "0"+endmin+":"+endsec;
 		}
		}
	$(".for-btn").click(function(){
		Audio.currentTime = 0;
	});
	
	$("#play-down").click(function(){
		var index = Audio.currentIndex = (Audio.currentIndex || 0) + 1;
		index = index %  $('.play-control-btn').length;
		$('.play-control-btn').get(index).click();
	});
	$("#play-up").click(function(){
		var index = Audio.currentIndex = (Audio.currentIndex<=0)?(Audio.currentIndex || 0) + $('.play-control-btn').length-1:(Audio.currentIndex || 0)-1 ;
		$('.play-control-btn').get(index).click();
	});
 	
	
	if($("#Per-list-up").attr("Journalid")==1){
		$("#Per-list-up").hide();
	}
	$(".player-progress").mousedown(function(e){
		var x = e.pageX-($("#player").position().left+7);
		playprogress.style.width = x+"px";
		var curTime = (x/140)*Audio.duration;
		Audio.currentTime = curTime;
		played.className = "stop";
		$(document).mousemove(function(e){
			var x = e.pageX-($("#player").position().left+7);
			if(x>=139){
				playprogress.style.width = 140+"px";
			}else{
				playprogress.style.width = x+"px";
			}
			var curTime = (playprogress.offsetWidth/140)*Audio.duration;
			Audio.currentTime = curTime;
			return false;
		})
		$(document).mouseup(function(){
			$(document).off("mousemove");
			Audio.play();
		})
	})
	$(".volume-btn").click(function(){
		if($('.volume-progress').css('display')=="none"){
			$(".volume-progress").css("display","block");
		}else{
			$(".volume-progress").css("display","none");
		}
		
	})
		$(".volume-progress").mousedown(function(e){
			var Y = e.pageY-($(this).position().top+$("#player").position().top);
			var height = 100-Y;
			$("#volume-progress").css("height",height);
			Audio.volume = height/100;
			$(document).mousemove(function(e){
				var Y = e.pageY-($(".volume-progress").position().top+$("#player").position().top);
				var height = 100-Y;
				if(height>=99){
					$("#volume-progress").css("height","100");
				}else{
					$("#volume-progress").css("height",height);
				}
				Audio.volume = $("#volume-progress").get(0).offsetHeight/100;
				return false;
			})
			$(document).mouseup(function(){
			   	$(document).off("mousemove");
				$(".volume-progress").css("display","none");
			})
		})
	   
</script>
</body>
</html>