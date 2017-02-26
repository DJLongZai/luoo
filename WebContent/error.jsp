<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="ture" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>error</title>
<link rel="stylesheet" href="css/index.css"/>
<style>
	.error{
		width:400px;
		height:400px;
		color:red;
		margin:0 auto;
		font-size:50px;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="content">
		<div class="error">服务器内部发生错！</div>
	</div>
</body>
</html>