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
                        <a href="#" class="hvr-shutter-in-vertical cart-to">加入购物车</a>
                        <div class="clearfix"></div>
                    </div>
                    <h5>库存量&nbsp;&nbsp;&nbsp;&nbsp;${items.number}</h5>
                    <h5><div>商品详情</div>${items.details}</h5>

                </div>
            </div>
            <div class="clearfix"> </div>
            <div class="content-top-in">
                <%--<div class="col-md-4 top-single">--%>
                    <%--<div class="col-md">--%>
                        <%--<img  src="${pageContext.request.contextPath}/resources/images/pic8.jpg" alt="" />--%>
                        <%--<div class="top-content">--%>
                            <%--<h5>Mascot Kitty - White</h5>--%>
                            <%--<div class="white">--%>
                                <%--<a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>--%>
                                <%--<p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>--%>
                                <%--<div class="clearfix"></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-md-4 top-single">--%>
                    <%--<div class="col-md">--%>
                        <%--<img  src="${pageContext.request.contextPath}/resources/images/pic9.jpg" alt="" />--%>
                        <%--<div class="top-content">--%>
                            <%--<h5>Mascot Kitty - White</h5>--%>
                            <%--<div class="white">--%>
                                <%--<a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>--%>
                                <%--<p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>--%>
                                <%--<div class="clearfix"></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-md-4 top-single-in">--%>
                    <%--<div class="col-md">--%>
                        <%--<img  src="${pageContext.request.contextPath}/resources/images/pic10.jpg" alt="" />--%>
                        <%--<div class="top-content">--%>
                            <%--<h5>Mascot Kitty - White</h5>--%>
                            <%--<div class="white">--%>
                                <%--<a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>--%>
                                <%--<p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>--%>
                                <%--<div class="clearfix"></div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <div class="clearfix"></div>
            </div>
        </div>
        <%--<div class="col-md-3">--%>
            <%--<div class="single-bottom">--%>
                <%--<h4>Categories</h4>--%>
                <%--<ul>--%>
                    <%--<li><a href="#"><i> </i>Fusce feugiat</a></li>--%>
                    <%--<li><a href="#"><i> </i>Mascot Kitty</a></li>--%>
                    <%--<li><a href="#"><i> </i>Fusce feugiat</a></li>--%>
                    <%--<li><a href="#"><i> </i>Mascot Kitty</a></li>--%>
                    <%--<li><a href="#"><i> </i>Fusce feugiat</a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--<div class="single-bottom">--%>
                <%--<h4>Product Categories</h4>--%>
                <%--<ul>--%>
                    <%--<li><a href="#"><i> </i>feugiat(5)</a></li>--%>
                    <%--<li><a href="#"><i> </i>Fusce (4)</a></li>--%>
                    <%--<li><a href="#"><i> </i> feugiat (4)</a></li>--%>
                    <%--<li><a href="#"><i> </i>Fusce (4)</a></li>--%>
                    <%--<li><a href="#"><i> </i> feugiat(2)</a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--<div class="single-bottom">--%>
                <%--<h4>Product Categories</h4>--%>
                <%--<div class="product">--%>
                    <%--<img class="img-responsive fashion" src="${pageContext.request.contextPath}/resources/images/st1.jpg" alt="">--%>
                    <%--<div class="grid-product">--%>
                        <%--<a href="#" class="elit">Consectetuer adipiscing elit</a>--%>
                        <%--<span class="price price-in"><small>$500.00</small> $400.00</span>--%>
                    <%--</div>--%>
                    <%--<div class="clearfix"> </div>--%>
                <%--</div>--%>
                <%--<div class="product">--%>
                    <%--<img class="img-responsive fashion" src="${pageContext.request.contextPath}/resources/images/st2.jpg" alt="">--%>
                    <%--<div class="grid-product">--%>
                        <%--<a href="#" class="elit">Consectetuer adipiscing elit</a>--%>
                        <%--<span class="price price-in"><small>$500.00</small> $400.00</span>--%>
                    <%--</div>--%>
                    <%--<div class="clearfix"> </div>--%>
                <%--</div>--%>
                <%--<div class="product">--%>
                    <%--<img class="img-responsive fashion" src="${pageContext.request.contextPath}/resources/images/st3.jpg" alt="">--%>
                    <%--<div class="grid-product">--%>
                        <%--<a href="#" class="elit">Consectetuer adipiscing elit</a>--%>
                        <%--<span class="price price-in"><small>$500.00</small> $400.00</span>--%>
                    <%--</div>--%>
                    <%--<div class="clearfix"> </div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="clearfix"> </div>
    </div>
</div>
<!---->
<div class="footer">
    <div class="footer-top">
        <div class="container">
            <div class="col-md-4 footer-in">
                <h4><i> </i>Suspendisse sed</h4>
                <p>Aliquam dignissim porttitor tortor non fermentum. Curabitur in magna lectus. Duis sed eros diam. Lorem ipsum dolor sit amet, consectetur.</p>
            </div>
            <div class="col-md-4 footer-in">
                <h4><i class="cross"> </i>Suspendisse sed</h4>
                <p>Aliquam dignissim porttitor tortor non fermentum. Curabitur in magna lectus. Duis sed eros diam. Lorem ipsum dolor sit amet, consectetur.</p>
            </div>
            <div class="col-md-4 footer-in">
                <h4><i class="down"> </i>Suspendisse sed</h4>
                <p>Aliquam dignissim porttitor tortor non fermentum. Curabitur in magna lectus. Duis sed eros diam. Lorem ipsum dolor sit amet, consectetur.</p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!---->
    <div class="footer-middle">
        <div class="container">
            <div class="footer-middle-in">
                <h6>About us</h6>
                <p>Suspendisse sed accumsan risus. Curabitur rhoncus, elit vel tincidunt elementum, nunc urna tristique nisi, in interdum libero magna tristique ante. adipiscing varius. Vestibulum dolor lorem.</p>
            </div>
            <div class="footer-middle-in">
                <h6>Information</h6>
                <ul>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Delivery Information</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms & Conditions</a></li>
                </ul>
            </div>
            <div class="footer-middle-in">
                <h6>Customer Service</h6>
                <ul>
                    <li><a href="contact.html">Contact Us</a></li>
                    <li><a href="#">Returns</a></li>
                    <li><a href="#">Site Map</a></li>
                </ul>
            </div>
            <div class="footer-middle-in">
                <h6>My Account</h6>
                <ul>
                    <li><a href="account.html">My Account</a></li>
                    <li><a href="#">Order History</a></li>
                    <li><a href="wishlist.html">Wish List</a></li>
                    <li><a href="#">Newsletter</a></li>
                </ul>
            </div>
            <div class="footer-middle-in">
                <h6>Extras</h6>
                <ul>
                    <li><a href="#">Brands</a></li>
                    <li><a href="#">Gift Vouchers</a></li>
                    <li><a href="#">Affiliates</a></li>
                    <li><a href="#">Specials</a></li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <p class="footer-class">Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
    <script type="text/javascript">
        $(document).ready(function() {
            /*
             var defaults = {
             containerID: 'toTop', // fading element id
             containerHoverID: 'toTopHover', // fading element hover id
             scrollSpeed: 1200,
             easingType: 'linear'
             };
             */

            $().UItoTop({ easingType: 'easeOutQuart' });

        });
    </script>
    <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</div>
</body>
</html></html>
