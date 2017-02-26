<%@page import="services.JournalServices"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.Journal"%> 
<%@page import="java.util.List"%> 
<%@page import="model.Song"%> 
<%
	String p = (String)request.getParameter("p");
	int p1 = Integer.parseInt(p);
	List<Journal> journal = JournalServices.getJournalALL(p1,7);
	List<Journal> journallike = JournalServices.getJournalBylikecount();
    double count = Math.ceil(JournalServices.getJournalcount()/7.0);
    int nextJournalid = JournalServices.getIdadd(p);
%>
<!DOCTYPE html>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>音乐期刊-落网</title>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="shortcut icon" href="img/favicon.ico">
</head>

<body>

  <jsp:include page="header.jsp"></jsp:include>
    <div class="content">
        <div>
            <div style="float: left">
               <jsp:include page="StyleList.jsp"></jsp:include>
                <div class="Periodocal-list">
                    <ul>
                  		<%for(int i=0;i<journal.size();i++){ %>
	                        <li>
	                            <div>
	                                <a href="<%=request.getContextPath() %>/Permusic.jsp?id=<%=journal.get(i).getId()%>"><img src="<%=journal.get(i).getJournalCover()%>" alt="加载失败"/></a>
	                                <div class="Periodocal-list-div"><a href="<%=request.getContextPath() %>/Permusic.jsp?id=<%=journal.get(i).getId()%>"><%=journal.get(i).getJournalName() %> </a></div>
	                            </div>
	                        </li>
                      	<%} %>

                    </ul>
                    <div class="periodocal-list-btn">
                        <ul>
                            <%if(p1 > 1){ %>
					            <li class="down"><a href="<%=request.getContextPath() %>/Periodical.jsp?p=<%=p1-1%>"><span class="icon_up">上一页</span></a></li>
				        	<%} %>
				        	<%
				        		int startpage = ((p1/6)*5+1);
				        		int i = startpage;
				        		for(;i<=5 && i<=count;i++){ %>
				        		<%if(p1==i){ %>
					        		<li class="page"><a href="<%=request.getContextPath() %>/Periodical.jsp?p=<%=i%>"><span class="pageB"><%=i %></span></a></li>
					        		<%}else{ %>
					        		<li class="page"><a href="<%=request.getContextPath() %>/Periodical.jsp?p=<%=i%>"><span class="pageA"><%=i %></span></a></li>
					        		<%} %>
				        	<%} %>
				            <%if(p1==count-1){ %>
					            <li class="down"><a href="<%=request.getContextPath() %>/Periodical.jsp?p=<%=p1+1%>"><span class="icon_down">下一页</span></a></li>
				        	<%} %>
                    </div>
                </div>
            </div>
        </div>

        <div id="top-list" class="Top">
            <div id="top-listB">
                <ul>
                    最近热门期刊
                   <%for(int j=0;j<journallike.size()-1;j++){ %>
	                    <li>
	                        <div><img src="<%=journallike.get(j).getJournalCover() %>" alt=""/></div>
	                        <div>
	                            <p><a href="<%=request.getContextPath() %>/Permusic.jsp?id=<%=journallike.get(j).getId()%>"><%=journallike.get(j).getJournalName() %></a></p>
	                            <p>赞:<%=journallike.get(j).getLikeCount() %></p>
	                        </div>
	                    </li>
	                 <%} %> 
                </ul>
            </div>
        </div>
        <div id="Top-btn" class="top-btn">
            <a href="javascript:;"><span class="icon_Topbtn"></span></a>
        </div>

    </div>
<jsp:include page="footer.jsp"></jsp:include>
    <script>
        var top_list = document.getElementById('top-listB');
        list(top_list,100);
        var Top_btn = document.getElementById('Top-btn');
        Top(Top_btn,800);
        Top_btn_onclick(Top_btn);
        Display();
    </script>
    </body>
</html>