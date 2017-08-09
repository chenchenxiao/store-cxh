<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/7/7
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品详情</title>

    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <link href="${pageContext.request.contextPath}/resources/css/messenger/messenger.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/messenger/messenger-theme-future.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/messenger/messenger-theme-flat.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/messenger/messenger-theme-air.css" rel="stylesheet" type="text/css" />
    <link href='https://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
    <!--//fonts-->
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--fonts-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/move-top.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/easing.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/messenger/messenger.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/messenger/messenger-theme-future.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/messenger/messenger.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/items.js"></script>

    <%--<script type="text/javascript">--%>
        <%--jQuery(document).ready(function($) {--%>
            <%--$(".scroll").click(function(event){--%>
                <%--event.preventDefault();--%>
                <%--$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);--%>
            <%--});--%>
        <%--});--%>
    <%--</script>--%>

    <%--<script>$(document).ready(function(c) {--%>
        <%--$('.alert-close').on('click', function(c){--%>
            <%--$('.message').fadeOut('slow', function(c){--%>
                <%--$('.message').remove();--%>
            <%--});--%>
        <%--});--%>
    <%--});--%>
    <%--</script>--%>
    <%--<script>$(document).ready(function(c) {--%>
        <%--$('.alert-close1').on('click', function(c){--%>
            <%--$('.message1').fadeOut('slow', function(c){--%>
                <%--$('.message1').remove();--%>
            <%--});--%>
        <%--});--%>
    <%--});--%>
    <%--</script>--%>
    <c:if test="${result!=null}">
        <script>
            $().ready(function(){
                alert("!!!")
                alert(${result.msg})
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
</head>
<body>
<!--header-->
<%@include file="/header.jsp"%>
<!---->
<div class="container">
    <div class="single">
        <div class="col-md-9 top-in-single">
            <div class="col-md-5 single-top">
                <!-- start product_slider -->
                <div class="flexslider">
                    <!-- FlexSlider -->
                    <script src="${pageContext.request.contextPath}/resources/js/imagezoom.js"></script>
                    <script defer src="${pageContext.request.contextPath}/resources/js/jquery.flexslider.js"></script>
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css" type="text/css" media="screen" />

                    <script>
                        // Can also be used with $(document).ready()
                        $(window).load(function() {
                            $('.flexslider').flexslider({
                                animation: "slide",
                                controlNav: "thumbnails"
                            });
                        });
                    </script>
                    <!-- //FlexSlider-->

                    <ul class="slides">
                        <li data-thumb="${pageContext.request.contextPath}/resources/file/items/${items.photo}">
                            <div class="thumb-image"> <img src="${pageContext.request.contextPath}/resources/file/items/${items.photo}" data-imagezoom="true" class="img-responsive"> </div>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <!-- end product_slider -->
            </div>
            <div class="col-md-7 single-top-in">
                <div class="single-para">
                    <div><h4>商品名称 &nbsp;&nbsp;&nbsp;&nbsp;${items.name}</h4></div>
                    <div class="para-grid">
                        <div>
                            <div><h5>商品价格</h5></div>
                            <span  class="add-to">￥${items.price}</span>
                        </div>
                        <c:if test="${sessionScope.loginUser.id != items.uid}">
                            <a href="${pageContext.request.contextPath}/admin/cart/addToCart?itemsId=${items.id}" class="hvr-shutter-in-vertical cart-to">加入购物车</a>
                        </c:if>
                        <c:if test="${sessionScope.loginUser.id == items.uid}">
                            <a href="javascript:void(0)" class="hvr-shutter-in-vertical cart-to">你的商品</a>
                        </c:if>
                        <div class="clearfix"></div>
                    </div>
                    <h5>库存量&nbsp;&nbsp;&nbsp;&nbsp;${items.number}</h5>
                    <h5><div>商品详情</div>${items.details}</h5>

                </div>
            </div>
            <div class="clearfix"> </div>
            掌柜推荐
            <div class="content-top-in">
                <c:forEach items="${userItems}" var="items" varStatus="status">
                    <div class="col-md-4 top-single-in">
                        <div class="col-md">
                            <img height="218px" width="250px" src="${pageContext.request.contextPath}/resources/file/items/${items.photo}" alt="" />
                            <div class="top-content">
                                <h5>${items.name}</h5>
                                <div class="white">
                                    <a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${items.id}" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">查看详情</a>
                                    <p class="dollar"><span class="in-dollar">$</span><span>${items.price}</span></p>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <div class="clearfix"></div>
            </div>
        </div>
            <div class="content-top-in">
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<!---->


</body>
</html>
