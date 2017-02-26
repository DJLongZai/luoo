<%@page import="services.JournalServices"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.Journal"%> 
<%@page import="java.util.List"%> 
<%@page import="model.Song"%> 
<%
	request.setCharacterEncoding("UTF-8");
	String Searchtext = request.getParameter("search");
	List<Journal> journallike = JournalServices.getJournalBylikecount();
	List<Journal> searchJournal = JournalServices.getSearchJournal(Searchtext);
%>
<!DOCTYPE html>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>搜索期刊</title>
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
                  		<%if(searchJournal!=null && searchJournal.size()>0){ %>
	                  		<%for(int i=0;i<searchJournal.size();i++){ %>
		                        <li>
		                            <div>
		                                <a href="<%=request.getContextPath() %>/Permusic.jsp?id=<%=searchJournal.get(i).getId()%>"><img src="<%=searchJournal.get(i).getJournalCover()%>" alt="加载失败"/></a>
		                                <div class="Periodocal-list-div"><a href=""><%=searchJournal.get(i).getJournalName() %> </a></div>
		                            </div>
		                        </li>
	                      	<%}%>
                  		<%}else{%>
                  			<h1 style="color:#c3baba;">没有找到你想要的内容</h1>
	                    <%}%>
	                </ul>    
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