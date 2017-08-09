<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    //页面每隔30秒自动刷新一遍
    response.setHeader("refresh" , "3600" );

%>
<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/7/6
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <title>Store</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--fonts-->
    <link href='https://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
    <!--//fonts-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/move-top.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!--slider-script-->
    <script src="${pageContext.request.contextPath}/resources/js/responsiveslides.min.js"></script>
    <script>
        $(function () {
            $("#slider1").responsiveSlides({
                auto: true,
                speed: 500,
                namespace: "callbacks",
                pager: true,
            });
        });
        $(function () {
            $("#desc").responsiveSlides({
                auto: true,
                speed: 500,
                namespace: "callbacks",
            });
        });
    </script>
    <!--//slider-script-->
    <script>$(document).ready(function(c) {
        $('.alert-close').on('click', function(c){
            $('.message').fadeOut('slow', function(c){
                $('.message').remove();
            });
        });
    });
    </script>
    <script>$(document).ready(function(c) {
        $('.alert-close1').on('click', function(c){
            $('.message1').fadeOut('slow', function(c){
                $('.message1').remove();
            });
        });
    });
    </script>
</head>
<body>
<!--页面顶部 -->
<%@include file="header.jsp"%>
<div class="header-bottom-in">
    <div class="container">
        <div class="header-bottom-on">
            <%--<p class="wel"><a href="#">Welcome visitor you can login or create an account.</a></p>--%>
            <div class="header-can">
                <div class="search">
                    <form action="${pageContext.request.contextPath}/admin/items/showTypeItems" method="post">
                        <input type="text" value="" name="searchText" placeholder="搜索" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '';}" >
                        <input type="submit" value="">
                    </form>
                </div>

                <div class="clearfix">
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="banner-mat">
    <div class="container">
        <div class="banner">

            <!-- Slideshow 4  style="overflow: hidden;width: 100%;list-style: none;padding: 0;margin: 0"-->
            <div class="slider">
                <ul class="rslides" id="slider1">
                    <c:forEach items="${adList}" var="ad" varStatus="sta">
                        <li><img src="${pageContext.request.contextPath}/resources/file/advertisement/${ad.photo}" alt="">
                        </li>
                    </c:forEach>
                    <%--<li><img src="${pageContext.request.contextPath}/resources/images/test.png" alt="">--%>
                    <%--</li>--%>
                    <%--<li><img src="${pageContext.request.contextPath}/resources/images/test2.jpg" alt="">--%>
                    <%--</li>--%>
                    <%--<li><img  src="${pageContext.request.contextPath}/resources/images/banner.jpg" alt="">--%>
                    <%--</li>--%>
                    <%--<li><img src="${pageContext.request.contextPath}/resources/images/banner2.jpg" alt="">--%>
                    <%--</li>--%>
                </ul>
            </div>

            <div class="banner-bottom">
                <div class="banner-matter" id="desc" style="float:right;">
                    <c:forEach items="${adList}" var="ad" varStatus="sta">
                        <div>
                            <p style="color: black">${ad.description}</p>
                            <a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${ad.itemsId}" class="hvr-shutter-in-vertical ">查看详情</a>
                        </div>
                    </c:forEach>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //slider-->
    </div>
</div>
<!---->
<div class="container">
    <div class="content">
        <div class="content-top">
            <h3 class="future">热销</h3>
            <div class="content-top-in">
                <c:forEach items="${hotSellList}" var="items">
                    <div class="col-md-3 md-col">
                        <div class="col-md">
                            <a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${items.id}">
                                <img height="177px" width="204px" src="${pageContext.request.contextPath}/resources/file/items/${items.photo}" alt="" />
                            </a>
                            <div class="top-content">
                                <h5><a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${items.id}">${items.title}</a></h5>
                                <div class="white">
                                    <a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${items.id}" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">查看详情</a>
                                    <p class="dollar"><span class="in-dollar">￥</span><span>${items.price}</span></p>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="clearfix"></div>
            </div>
        </div>
        <!---->
        <div class="content-middle">
            <h3 class="future">类型</h3>
            <div class="content-middle-in">
                <ul id="flexiselDemo1">
                    <li><img src="${pageContext.request.contextPath}/resources/images/homeFurnishing.jpg"/></li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/clothes.jpg"/></li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/food.jpg"/></li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/notebook.png"/></li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/sport.jpg"/></li>

                </ul>
                <script type="text/javascript">
                    $(window).load(function() {
                        $("#flexiselDemo1").flexisel({
                            visibleItems: 4,
                            animationSpeed: 1000,
                            autoPlay: true,
                            autoPlaySpeed: 3000,
                            pauseOnHover: true,
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: {
                                portrait: {
                                    changePoint:480,
                                    visibleItems: 1
                                },
                                landscape: {
                                    changePoint:640,
                                    visibleItems: 2
                                },
                                tablet: {
                                    changePoint:768,
                                    visibleItems: 3
                                }
                            }
                        });

                    });
                </script>
                <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.flexisel.js"></script>

            </div>
        </div>
        <!---->
        <div class="content-bottom">
            <h3 class="future">推荐</h3>
            <div class="content-bottom-in">
                <ul id="flexiselDemo2">
                    <li><div class="col-md men">
                        <a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${home.id}" class="compare-in ">
                            <img height="177px" width="204px" src="${pageContext.request.contextPath}/resources/file/items/${home.photo}" alt="" />
                        </a>
                        <div class="top-content bag">
                            <h5><a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${home.id}">${home.name}</a></h5>
                            <div class="white">
                                <a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${home.id}" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">查看详情</a>
                                <p class="dollar"><span class="in-dollar">￥</span><span>${home.price}</span></p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div></li>
                    <li><div class="col-md men">
                        <a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${clothes.id}" class="compare-in ">
                            <img height="177px" width="204px"  src="${pageContext.request.contextPath}/resources/file/items/${clothes.photo}" alt="" />
                        </a>
                        <div class="top-content bag">
                            <h5><a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${clothes.id}">${clothes.name}</a></h5>
                            <div class="white">
                                <a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${clothes.id}" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">查看详情</a>
                                <p class="dollar"><span class="in-dollar">$</span><span>${clothes.price}</span></p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div></li>
                    <li><div class="col-md men">
                        <a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${food.id}" class="compare-in ">
                            <img height="177px" width="204px" src="${pageContext.request.contextPath}/resources/file/items/${food.photo}" alt="" />
                        </a>
                        <div class="top-content bag">
                            <h5><a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${food.id}">${food.name}</a></h5>
                            <div class="white">
                                <a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${food.id}" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">查看详情</a>
                                <p class="dollar"><span class="in-dollar">￥</span><span>${food.price}</span></p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div></li>
                    <li><div class="col-md men">
                        <a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${notebook.id}" class="compare-in ">
                            <img height="177px" width="204px" src="${pageContext.request.contextPath}/resources/file/items/${notebook.photo}" alt="" />
                        </a>
                        <div class="top-content bag">
                            <h5><a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${notebook.id}">${notebook.name}</a></h5>
                            <div class="white">
                                <a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${notebook.id}" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">查看详情</a>
                                <p class="dollar"><span class="in-dollar">￥</span><span>${notebook.price}</span></p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div></li>
                    <li><div class="col-md men">
                        <a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${sports.id}" class="compare-in ">
                            <img height="177px" width="204px" src="${pageContext.request.contextPath}/resources/file/items/${sports.photo}" alt="" />
                        </a>
                        <div class="top-content bag">
                            <h5><a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${sports.id}">${sports.name}</a></h5>
                            <div class="white">
                                <a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${sports.id}" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">查看详情</a>
                                <p class="dollar"><span class="in-dollar">￥</span><span>${sports.price}</span></p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div></li>

                </ul>
                <script type="text/javascript">
                    $(window).load(function() {
                        $("#flexiselDemo2").flexisel({
                            visibleItems: 4,
                            animationSpeed: 1000,
                            autoPlay: true,
                            autoPlaySpeed: 3000,
                            pauseOnHover: true,
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: {
                                portrait: {
                                    changePoint:480,
                                    visibleItems: 1
                                },
                                landscape: {
                                    changePoint:640,
                                    visibleItems: 2
                                },
                                tablet: {
                                    changePoint:768,
                                    visibleItems: 3
                                }
                            }
                        });

                    });
                </script>
            </div>
        </div>
    </div>
</div>
<!---->
</body>
<c:if test="${result!=null}">
    <script>
        $().ready(function(){
            alert("找不到相关的宝贝")
            var success=${result.success};
            var msg='${result.msg}';
            var type="error";
            if(success=true){
                type="success"
            }
            Messenger.options = {
                extraClasses: 'messenger-fixed messenger-on-top messenger-on-right',
                theme: 'future'
            }
            $.globalMessenger().post({
                message:"提示："+ msg,
                type: type,
                showCloseButton: true
            })
        })
    </script>
</c:if>
</html>
