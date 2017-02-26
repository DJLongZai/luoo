<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="services.JournalServices"%>
<%@page import="model.Journal"%> 
<%@page import="java.util.List"%> 
<%@page import="model.Song"%> 
<%
	List<Journal> journal = JournalServices.getJournalALL(1,4);
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>落网-独立音乐</title>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="shortcut icon" href="img/favicon.ico">
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
    <div class="content">
         <div class="Hot">
             <div class="Hot-pic">
                 <img id="Hot-pic" src="img/hot%20(1).jpg" alt=""/>
             </div>
             <div id="Hot-btn" class="Hot-btn">
                 <ul>
                     <li><i></i></li>
                     <li><i></i></li>
                     <li><i></i></li>
                     <li><i></i></li>
                     <li><i></i></li>
                 </ul>
             </div>
         </div>
        <div class="Album">
            <div class="Album-header">
                <p><span></span>音乐期刊</p>
            </div>
            <ul>
                <li><a href="<%=request.getContextPath() %>/Styleperiodical.jsp?style=Electronic&p=1">电子</a></li>
                <li><a href="<%=request.getContextPath() %>/Styleperiodical.jsp?style=Classic&p=1">经典</a></li>
                <li><a href="<%=request.getContextPath() %>/Styleperiodical.jsp?style=Ballad&p=1">民谣</a></li>
                <li><a href="<%=request.getContextPath() %>/Styleperiodical.jsp?style=wordmusic&p=1">世界音乐</a></li>
                <li><a href="<%=request.getContextPath() %>/Styleperiodical.jsp?style=Reggae&p=1">雷鬼</a></li>
                <li><a href="<%=request.getContextPath() %>/Styleperiodical.jsp?style=Magic&p=1">迷幻</a></li>
                <li><a href="<%=request.getContextPath() %>/Styleperiodical.jsp?style=Popular&p=1">流行</a></li>
                <li><a href="<%=request.getContextPath() %>/Styleperiodical.jsp?style=Rap&p=1">说唱</a></li>
                <li><a href="<%=request.getContextPath() %>/Periodical.jsp?p=1">更多></a></li>
            </ul>
        </div>
        <div class="Album-cover">
             <div class="Album-cover1">
                 <a href="<%=request.getContextPath()%>/Permusic.jsp?id=<%=journal.get(0).getId()%>"><img src="<%=journal.get(0).getJournalCover() %>" alt="加载失败"/></a>
                 <a href="<%=request.getContextPath()%>/Permusic.jsp?id=<%=journal.get(0).getId()%>"><%=journal.get(0).getJournalName() %></a>
             </div>
             <div class="Album-cover2">
                 <ul>
                 <%for(int i=1;i<journal.size()-1;i++){ %>
                     <li>
                         <a href="<%=request.getContextPath()%>/Permusic.jsp?id=<%=journal.get(i).getId()%>"><img src="<%=journal.get(i).getJournalCover() %>" alt="加载失败"/></a>
                         <a href="<%=request.getContextPath()%>/Permusic.jsp?id=<%=journal.get(i).getId()%>"><%=journal.get(i).getJournalName() %></a>
                     </li>
                     <%} %>
                 </ul>
             </div>
        </div>
        <div class="Original">
            <div class="Album-header">
                <p><span></span>原创推荐</p>
            </div>
            <div class="Original-music">
                <div><img src="<%=journal.get(3).getJournalCover() %>" alt=""/></div>
                <div class="align">
                    <a href=""><%=journal.get(3).getJournalName() %></a>
                    <p><%=journal.get(3).getJournalAuthor() %></p>
                    <p class="xx"><%=journal.get(3).getJournalDate() %></p>
                </div>
                <P class="jj"> Easy Mind（简想）是一名来自北京的90后独立音乐人，目前就读于美国纽约大学音乐硕士专业。2017年初他发行自己独立创作的第四张专辑Cloudland《云深》，融合了氛围、缓拍等电子风格。专辑名取自唐代诗人贾岛的名句：只在此山中，云深不知处。借用“云深”的典故来体现出他在音乐世界中坚持本真的追求。专辑总共收录10首作品，名称连起来同样是一句诗：释浮玉幻月，星旋宁路明。除了在名称上有中国的印记，专辑中亦收入了多首采用中国元素的作品。 </P>
            </div>
        </div>
        <div class="activity">
            <div class="Album">
                <div class="Album-header">
                    <p><span></span>热门活动</p>
                </div>
                <ul>
                    <li><a href="">北京</a></li>
                    <li><a href="">上海</a></li>
                    <li><a href="">广州</a></li>
                    <li><a href="">深圳</a></li>
                    <li><a href="">成都</a></li>
                    <li><a href="">重庆</a></li>
                    <li><a href="">武汉</a></li>
                    <li><a href="">更多></a></li>
                </ul>
            </div>
            <div class="activity-list">
                <ul>
                    <li>
                        <div><img src="img/sm%20(1).png" alt=""/></div>
                        <div>
                            <p><a href="">Msterain小雨乐队新专辑《破墨山谷》2017全国巡演</a></p>
                            <p>时间：2017.02.03</p>
                            <p>地点：成都</p>
                            <p>场所：小酒馆</p>
                            <p>门票：99元-999元</p>
                        </div>
                    </li>
                    <li>
                        <div><img src="img/sm%20(2).jpg" alt=""/></div>
                        <div>
                            <p><a href="">Msterain小雨乐队新专辑《破墨山谷》2017全国巡演</a></p>
                            <p>时间：2017.02.03</p>
                            <p>地点：成都</p>
                            <p>场所：小酒馆</p>
                            <p>门票：99元-999元</p>
                        </div>
                    </li>
                    <li>
                        <div><img src="img/sm%20(3).jpg" alt=""/></div>
                        <div>
                            <p><a href="">Msterain小雨乐队新专辑《破墨山谷》2017全国巡演</a></p>
                            <p>时间：2017.02.03</p>
                            <p>地点：成都</p>
                            <p>场所：小酒馆</p>
                            <p>门票：99元-999元</p>
                        </div>
                    </li>
                    <li>
                        <div><img src="img/sm%20(4).jpg" alt=""/></div>
                        <div>
                            <p><a href="">Msterain小雨乐队新专辑《破墨山谷》2017全国巡演</a></p>
                            <p>时间：2017.02.03</p>
                            <p>地点：成都</p>
                            <p>场所：小酒馆</p>
                            <p>门票：99元-999元</p>
                        </div>
                    </li>
                    <li>
                        <div><img src="img/sm%20(5).jpg" alt=""/></div>
                        <div>
                            <p><a href="">Msterain小雨乐队新专辑《破墨山谷》2017全国巡演</a></p>
                            <p>时间：2017.02.03</p>
                            <p>地点：成都</p>
                            <p>场所：小酒馆</p>
                            <p>门票：99元-999元</p>
                        </div>
                    </li>
                    <li>
                        <div><img src="img/big%20(6).jpg" alt=""/></div>
                        <div>
                            <p><a href="">Msterain小雨乐队新专辑《破墨山谷》2017全国巡演</a></p>
                            <p>时间：2017.02.03</p>
                            <p>地点：成都</p>
                            <p>场所：小酒馆</p>
                            <p>门票：99元-999元</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div id="Top-btn" class="top-btn">
            <a href="javascript:;"><span class="icon_Topbtn"></span></a>
        </div>
    </div>
<jsp:include page="footer.jsp"></jsp:include>

<script>
    var Top_btn = document.getElementById('Top-btn');
    Top(Top_btn,800);
    Top_btn_onclick(Top_btn);
    var Hot_pic = document.getElementById('Hot-pic');
    var Hot_btn = document.getElementById('Hot-btn').getElementsByTagName('li');
    Display();
    for(var i=0;i<Hot_btn.length;i++){
        (function(i){
            Hot_btn[i].onclick=function(){Hot_pic.src = "img/hot%20("+(i+1)+").jpg";}
        })(i);}
    /* setInterval(function(){
    	Hot_pic.src = "img/hot%20("+i+").jpg";
    	i++
    	if(i==5){
    		i=1;
    	}
    },3500) */

</script>
</body>
</html>