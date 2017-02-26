<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/img/favicon.ico">
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="content">
    <div>
        <div style="float: left">
            <div class="Periodocal-list" style="width: 960px">
                <div class="Activity-nav">
                    <div class="Activity-header"><a href="">当前地区：成都</a></div>
                    <div class="Activity-city">
                        <div><a href="">最新活动</a></div>
                        <div><a href="">演出场所</a></div>
                        <ul>
                            <li><a href="">上海</a></li>
                            <li><a href="">北京</a></li>
                            <li><a href="">广东</a></li>
                            <li><a href="">成都</a></li>
                            <li><a href="">深圳</a></li>
                            <li><a href="">更多</a></li>
                        </ul>
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
                <div id="Hot-Activity" class="Top">
                    <div id="top-listB" style="margin: 0">
                        <div>
                            <img style="width: 315px;height: 220px;" src="img/big%20(7).jpg" alt=""/>
                        </div>
                        <ul>
                            推荐文章
                            <li>
                                <div><img src="img/sm%20(2).jpg" alt=""/></div>
                                <div>
                                    <p><a href="">Msterain小雨乐队新专辑《破墨山谷》</a></p>
                                </div>
                            </li>
                            <li>
                                <div><img src="img/sm%20(2).jpg" alt=""/></div>
                                <div>
                                    <p><a href="">Msterain小雨乐队新专辑《破墨山谷》2017全国巡演</a></p>
                                </div>
                            </li>
                            <li>
                                <div><img src="img/sm%20(2).jpg" alt=""/></div>
                                <div>
                                    <p><a href="">Msterain小雨乐队新专辑《破墨山谷》2017全国巡演</a></p>
                                </div>
                            </li>
                            <li>
                                <div><img src="img/sm%20(2).jpg" alt=""/></div>
                                <div>
                                    <p><a href="">Msterain小雨乐队新专辑《破墨山谷》2017全国巡演</a></p>
                                </div>
                            </li>
                            <li>
                                <div><img src="img/sm%20(2).jpg" alt=""/></div>
                                <div>
                                    <p><a href="">Msterain小雨乐队新专辑《破墨山谷》2017全国巡演</a></p>
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
    var Top_btn = document.getElementById('Top-btn');
    Top(Top_btn,800);
    Top_btn_onclick(Top_btn);
    Display();
</script>
</body>
</html>