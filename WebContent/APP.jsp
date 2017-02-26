<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="shortcut icon" href="img/favicon.ico">
</head>
<style>
    body{background-color: #f9f8f8;}
</style>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="content">
    <div style="width: 450px; ">
        <div class="APP">
            <div class="app">
                <img id="App-img" src="img/app-screen.jpg" alt=""/>
            </div>
        </div>
    </div>
    <div class="APP-right">
        <div class="App-logo">
            <ul>
                <li>
                    <a href="http://www.luoo.net/"><span class="icon_logos"></span></a>
                </li>
                <li>
                    <h1>落网客户端</h1>
                </li>
            </ul>
            <a href="http://localhost:63342/meg/index.html"><span class="icon_logoMusics"></span></a>
        </div>
        <div class="APP-down">
            <div><img src="img/app-qr.png" alt=""/><p>手机扫描下载</p></div>
            <div>
                <ul>
                    <li>
                        <a target="_blank" href="https://itunes.apple.com/cn/app/luo-wang/id788474943"><span class="icon_logoIP"></span>版本6.0.0</a>
                    </li>
                    <li>
                        <a target="_blank" href="https://www.microsoft.com/zh-cn/store/p/%E8%90%BD%E7%BD%91/9wzdncrfj0bk"><span class="icon_logoWP"></span>版本6.2.0</a>
                    </li>
                    <li>
                        <a target="_blank" href="http://luoo-dl.kss.ksyun.com/luoo_fm/Luoo-latest.apk?v=6.0.3"><span class="icon_logoAD"></span>版本6.0.3</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

<script>
   window.onload = function(){
       var Appimg = document.getElementById('App-img');
               setInterval(function(){
                   var A = Appimg.offsetLeft;
                   if(A<-949){
                       Appimg.style.left = 0+'px';
                   }else{
                       starMover(Appimg,{left:A-190});
                   }
               },3000);
       Display();
   }
</script>
</body>
</html>
