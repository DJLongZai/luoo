<%@page import="java.io.Console"%>
<%@page import="services.JournalServices"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.Journal"%> 
<%@page import="java.util.List"%> 
<%@page import="model.Song"%> 
<%
	String p = (String)request.getParameter("p");
	int p1 = Integer.parseInt(p);
    List<Song> songs = JournalServices.getSongsALL(p1,7);
    List<Song> Topsongs = JournalServices.getSongsBylikecount();
    double count = Math.ceil(JournalServices.getmusiccount()/7.0);
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>单曲推荐-落网</title>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="shortcut icon" href="img/favicon.ico">
</head>
<style>
    body{background-color: #f9f8f8;}
</style>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="content">
    <div class="Sing-header">
        <img src="<%=songs.get(0).getCoverSrc()%>" alt=""/>
        <div class="Sing-play">
            <a class="playbtn"  song-url="<%=songs.get(0).getMusicSrc()%>" href="javascript:;"><%=songs.get(0).getSong()%><span class="icon_PlayA"></span></a>
            <p class="sing-tema"><%=songs.get(0).getSinger()%></p>
            <p>
                南方女声旋律金属小雨乐队，2005年成立于广州。在古老而黑暗的音乐氛围中，小雨乐队用高亢的女声演绎着旋律与金属的交响，激情而华丽的交响式编曲，则营造出乐队大气磅礴的音乐和现场。《古风铃》是最新专辑《破墨山谷》里的曲目，不插电的版本中，乐队以木吉他、竹笛、钢琴、箱鼓、贝斯来演绎这首“民乐+旋律金属”的歌曲，展现出歌曲回归自然的另一个形态。
                2月25日，乐队将在深圳A8Live展开新专辑的首站巡演，与你相遇在躁动的舞台！
            </p>
            <p class="date">推荐人： LUO・2017-02-10</p>
            <div>
                <a href="javascript:;"><span class="icon_Share"></span></a>
                <a href="javascript:;"><span class="icon_Collection"></span></a>
            </div>
        </div>
    </div>
    <div class="Single-list">
        <ul>
	        <%for(int i=1;i<songs.size();i++){%>
	            <li>
	                <div><img src="<%=songs.get(i).getCoverSrc()%>" alt=""/></div>
	                <div class="sing">
	                    <p><a class="playbtn"  song-url="<%=songs.get(i).getMusicSrc()%>" href="javascript:;"><%=songs.get(i).getSong()%><span class="icon_PlayA"></span></a></p>
	                    <p><%=songs.get(i).getSinger() %></p>
	                    <p class="sing-js">
				                        南方女声旋律金属小雨乐队，2005年成立于广州。在古老而黑暗的音乐氛围中，
				                        小雨乐队用高亢的女声演绎着旋律与金属的交响，激情而华丽的交响式编曲，则营造出乐队大气磅礴的音乐和现场。
				                        《古风铃》是最新专辑《破墨山谷》里的曲目，不插电的版本中，乐队以木吉他、竹笛、钢琴、箱鼓、贝斯来演绎这首“民乐+旋律金属”的歌曲，
				                        展现出歌曲回归自然的另一个形态。
				                        2月25日，乐队将在深圳A8Live展开新专辑的首站巡演，与你相遇在躁动的舞台！
	                    </p>
	                    <p class="date">推荐人： LUO・2017-02-10</p>
	                    <div>
	                        <a href="javascript:;"><span class="icon_Share"></span></a>
	                        <a href="javascript:;"><span class="icon_Collection"></span></a>
	                    </div>
	                </div>
	            </li>
	        <%} %>
  
        </ul>
    </div>
    <div id="Hot-list" class="Top">
        <div id="top-listB">
            <ul>
                                 推荐单曲
                <%for(int j=0;j<Topsongs.size();j++){ %>                              
	                <li>
	                    <div><img src="<%=Topsongs.get(j).getCoverSrc() %>" alt=""/></div>
	                    <div>
	                        <p><a href=""><%=Topsongs.get(j).getSong()%></a></p>
	                        <p>赞：<%=Topsongs.get(j).getLikeCnunt() %></p>
	                    </div>
	                </li>
                <%} %>
            </ul>
        </div>
    </div>
    <div class="periodocal-list-btn">
        <ul>
        	<%if(p1 > 1){ %>
	            <li class="down"><a href="<%=request.getContextPath() %>/Single.jsp?p=<%=p1-1%>"><span class="icon_up">上一页</span></a></li>
        	<%} %>
        	<%
        		int startpage = ((p1/6)*5+1);
        		int i = startpage;
        		for(;i<=count;i++){ %>
        		<%if(p1==i){ %>
	        		<li class="page"><a href="<%=request.getContextPath() %>/Single.jsp?p=<%=i%>"><span class="pageB"><%=i %></span></a></li>
	        		<%}else{ %>
	        		<li class="page"><a href="<%=request.getContextPath() %>/Single.jsp?p=<%=i%>"><span class="pageA"><%=i %></span></a></li>
	        		<%} %>
        		<%} %>
            <%if(p1 < count ){ %>
	            <li class="down"><a href="<%=request.getContextPath() %>/Single.jsp?p=<%=p1+1%>"><span class="icon_down">下一页</span></a></li>
        	<%} %>
        </ul>
    </div>
    <div id="Top-btn" class="top-btn">
        <a href="javascript:;"><span class="icon_Topbtn"></span></a>
    </div>
    <audio id="audio" style="display:none;" src="<%=songs.get(0).getMusicSrc()%>"></audio>
</div>
<jsp:include page="footer.jsp"></jsp:include>

<script>
    var Top_btn = document.getElementById('Top-btn');
    var Audioplay = document.getElementById('audio');
    var play = document.getElementsByClassName("playbtn");
    var iconp = document.getElementsByClassName("icon_PlayA");
    var audioStatus = "paused";
	Audioplay.addEventListener("pause", function() 
     		{
     	audioStatus = "paused";
     		});
	Audioplay.addEventListener("playing", function() 
     		{
     	audioStatus = "playing";
     		});
		var A = null;
	    for(var i=0;i<play.length;i++){
	        (function(i){
	        	play[i].onclick=function(){
	        		
	        		if(A!=i){
	        			Audioplay.src = "";
	        			Audioplay.pause();
	        			if(document.getElementsByClassName("icon_PlayB")[0]){
	        				document.getElementsByClassName("icon_PlayB")[0].className = "icon_PlayA";
	        			}
	        			 var musicname = play[i].getAttribute("song-url");
		        		Audioplay.src = musicname;
		        		Audioplay.play();
		        		iconp[i].className = "icon_PlayB";
	            	}else if(audioStatus == "playing"){
	            		Audioplay.pause();
	            		document.getElementsByClassName("icon_PlayB")[0].className = "icon_PlayA";
	            	}else{
	            		Audioplay.play();
	            		iconp[i].className = "icon_PlayB";
	            	}
	        		A=i;
	        	}
	        })(i);}
    Top(Top_btn,800);
    Top_btn_onclick(Top_btn);
    Display();
    
</script>
</body>
</html>
