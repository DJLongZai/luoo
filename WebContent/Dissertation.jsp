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

<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="content">
    <div>
        <div style="float: left">
            <div class="Periodocal-list">
                <div class="list-header">
                    <div>
                        <img src="img/big%20(2).jpg" alt=""/>
                    </div>
                    <div class="list-header-txt">
                        <a href="">人们都来比谁最聪明，那谁来当傻子？</a>
                        <p>有人比你傻何乐不为呢？每个人都聪明无比，谁来当傻子呢？</p>
                        <p>2017.02.12</p>
                    </div>
                </div>
                <div class="Dis-list">
                    <ul>
                        <li>
                            <div><img src="img/sm%20(1).png" alt=""/></div>
                            <div>
                                <p><a href="">韩寒，走好不送</a></p>
                                <p>言之・假酒馆音乐・2017-02-07</p>
                                <p>韩寒，既然你决意离去，那我也不会再送别你了</p>
                            </div>
                        </li>
                        <li>
                            <div><img src="img/sm%20(1).png" alt=""/></div>
                            <div>
                                <p><a href="">韩寒，走好不送</a></p>
                                <p>言之・假酒馆音乐・2017-02-07</p>
                                <p>韩寒，既然你决意离去，那我也不会再送别你了</p>
                            </div>
                        </li>
                        <li>
                            <div><img src="img/sm%20(1).png" alt=""/></div>
                            <div>
                                <p><a href="">韩寒，走好不送</a></p>
                                <p>言之・假酒馆音乐・2017-02-07</p>
                                <p>韩寒，既然你决意离去，那我也不会再送别你了</p>
                            </div>
                        </li>
                        <li>
                            <div><img src="img/sm%20(1).png" alt=""/></div>
                            <div>
                                <p><a href="">韩寒，走好不送</a></p>
                                <p>言之・假酒馆音乐・2017-02-07</p>
                                <p>韩寒，既然你决意离去，那我也不会再送别你了</p>
                            </div>
                        </li>
                        <li>
                            <div><img src="img/sm%20(1).png" alt=""/></div>
                            <div>
                                <p><a href="">韩寒，走好不送</a></p>
                                <p>言之・假酒馆音乐・2017-02-07</p>
                                <p>韩寒，既然你决意离去，那我也不会再送别你了</p>
                            </div>
                        </li>
                        <li>
                            <div><img src="img/sm%20(1).png" alt=""/></div>
                            <div>
                                <p><a href="">韩寒，走好不送</a></p>
                                <p>言之・假酒馆音乐・2017-02-07</p>
                                <p>韩寒，既然你决意离去，那我也不会再送别你了</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div id="Hot-list" class="Top">
                    <div id="top-listB">
                        <ul>
                            推荐文章
                            <li>
                                <div><img src="img/sm%20(2).jpg" alt=""/></div>
                                <div>
                                    <p><a href="">散漫的春天</a></p>
                                    <p>19276收藏</p>
                                </div>
                            </li>
                            <li>
                                <div><img src="img/sm%20(2).jpg" alt=""/></div>
                                <div>
                                    <p><a href="">像叶子一样飞</a></p>
                                    <p>19276收藏</p>
                                </div>
                            </li>
                            <li>
                                <div><img src="img/sm%20(2).jpg" alt=""/></div>
                                <div>
                                    <p><a href="">时代的挽歌</a></p>
                                    <p>19276收藏</p>
                                </div>
                            </li>
                            <li>
                                <div><img src="img/sm%20(2).jpg" alt=""/></div>
                                <div>
                                    <p><a href="">听到日子的尽头</a></p>
                                    <p>19276收藏</p>
                                </div>
                            </li>
                            <li>
                                <div><img src="img/sm%20(2).jpg" alt=""/></div>
                                <div>
                                    <p><a href="">散漫的春天</a></p>
                                    <p>19276收藏</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="periodocal-list-btn">
                    <ul>
                        <li class="down"><a href=""><span class="icon_up">上一页</span></a></li>
                        <li><a href=""><span class="page">1</span></a></li>
                        <li><a href=""><span class="page">2</span></a></li>
                        <li class="down"><a href=""><span class="icon_down">下一页</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="Top-btn" class="top-btn">
        <a href="javascript:;"><span class="icon_Topbtn"></span></a>
    </div>


</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
    var top_list = document.getElementById('top-listB');
    list(top_list,500);
    var Top_btn = document.getElementById('Top-btn');
    Top(Top_btn,800);
    Top_btn_onclick(Top_btn);
    Display();
</script>
</body>
</html>