<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="model.user"%> 
<script src="js/jquery-3.1.1.js" type="text/javascript"></script>
<script src="js/move2.js" type="text/javascript"></script>
<script src="js/public.js" type="text/javascript"></script>
    <div class="header">
        <div class="header_h">
            <a href="<%=request.getContextPath() %>/index.jsp" style="float: left;margin-top: 8px;"><span class="icon_logo"></span></a>
            <div class="nav">
                <ul>
                    <li><a href="<%=request.getContextPath() %>/Periodical.jsp?p=1">期刊</a></li>
                    <li><a href="<%=request.getContextPath() %>/Single.jsp?p=1">单曲</a></li>
                    <li><a href="<%=request.getContextPath() %>/Dissertation.jsp">专栏</a></li>
                    <li><a href="<%=request.getContextPath() %>/Activity.jsp">活动</a></li>
                    <li><a href="<%=request.getContextPath() %>/APP.jsp">APP</a></li>
                </ul>
            </div>
            <div class="search">
                <form action="Search.jsp" method="post">
                    <input placeholder="期刊搜索" id="searchText" class="searchText" name="search" type="text"/>
                    <button type="submit"><span class="icon_search"></span></button>
                </form>
            </div>
            <%
            	user user = (user)session.getAttribute("user");
            %>
            <%if(user == null) {%>
            <div id="login">
                <span>注册/登录</span>
            </div>
            <div id="login-box">
                <div class="login-headr">
                    <span>登录</span>
                    <span>没有账号？<a id="loginbtn" href="javascript:;">注册</a></span>
                </div>
                <div class="login-DL">
                    <form action="luooHttpServlet" method="post" onsubmit="return false">
                        <span>账号</span><input placeholder="请输入账号" maxlength=12  id="Username" type="text" name="Username"/>
                        <span>密码</span><input placeholder="请输入密码" maxlength=10 id="Password" type="password" name="Password"/>
                        <button type="submit" id="loginSubmit">登录</button>
                    </form>
                </div>
                <div class="login-footer">
                     <input type="checkbox"><span>下次自动登录</span>
                    <span><a href="">找回密码</a></span>
                </div>
            </div>
            <div id="reg-box">
                <div class="reg-headr">
                    <span>注册</span>
                    <span><a id="regbtn" href="javascript:;">返回登录</a></span>
                </div>
                <div class="reg-form">
                	<div id="tishi" style="display:none;position: absolute;left: 76px;top: 30px;color:red;">用户名重复或为空</div>
                    <form action="luooHttpServlet" method="post" onsubmit="return false">
                        <span>昵称</span><input placeholder="请输入昵称"   maxlength=10 id="regUser" type="text" name="regname"/>
                        <span>账号</span><input placeholder="请输入账号" maxlength=12 onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" id="regUsername" type="text" name="regUsername"/>
                        <span class="pass">密码</span><input placeholder="请输入密码" maxlength=12 id="regPassword" type="password" name="regPassword"/>
                        <span class="regEmail">邮箱</span><input placeholder="请输入邮箱"  id="regEmail" type="text" name="regEmail"/>
                        <span class="cc"><input id="check" type="checkbox"><span>同意落网的 <a href="">《使用协议》</a></span></span>
                        <button id="reg" name="reg" type="submit">注册</button>
                    </form>
                </div>
            </div>
            <%}else{ %>
		            <div id="user">
		            <img alt="" src="<%=user.getAvatarsrc()%>">
		                <span><%=user.getName() %></span>
		                <a herf="">个人中心</a> 
		                <a id="Exit" herf="javascript:;">退出</a>
		            </div>
             <%} %>
        </div>
    </div>