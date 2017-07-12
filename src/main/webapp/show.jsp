<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>在线商城</title>
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
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
<div class="banner-mat">
    <div class="container">
        <div class="banner">

            <!-- Slideshow 4 -->
            <div class="slider">
                <ul class="rslides" id="slider1">
                    <li><img src="${pageContext.request.contextPath}/resources/images/banner.jpg" alt="">
                    </li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/banner1.jpg" alt="">
                    </li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/banner.jpg" alt="">
                    </li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/banner2.jpg" alt="">
                    </li>
                </ul>
            </div>

            <div class="banner-bottom">
                <div class="banner-matter">
                    <p>Childish Gambino - Camp Now Available for just $9.99</p>
                    <a href="single.html" class="hvr-shutter-in-vertical ">Purchase</a>
                </div>
                <div class="purchase">
                    <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">Purchase</a>
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
            <h3 class="future">FEATURED</h3>
            <div class="content-top-in">
                <div class="col-md-3 md-col">
                    <div class="col-md">
                        <a href="single.html"><img  src="${pageContext.request.contextPath}/resources/images/pi.jpg" alt="" /></a>
                        <div class="top-content">
                            <h5><a href="single.html">Mascot Kitty - White</a></h5>
                            <div class="white">
                                <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">加入购物车</a>
                                <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>
                                <div class="clearfix"></div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-3 md-col">
                    <div class="col-md">
                        <a href="single.html"><img  src="${pageContext.request.contextPath}/resources/images/pi1.jpg" alt="" />	</a>
                        <div class="top-content">
                            <h5><a href="single.html">Bite Me</a></h5>
                            <div class="white">
                                <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                                <p class="dollar"><span class="in-dollar">$</span><span>3</span><span>0</span></p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 md-col">
                    <div class="col-md">
                        <a href="single.html"><img  src="${pageContext.request.contextPath}/resources/images/pi2.jpg" alt="" /></a>
                        <div class="top-content">
                            <h5><a href="single.html">Little Fella</a></h5>
                            <div class="white">
                                <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                                <p class="dollar"><span class="in-dollar">$</span><span>5</span><span>0</span></p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 md-col">
                    <div class="col-md">
                        <a href="single.html"><img  src="${pageContext.request.contextPath}/resources/images/pi3.jpg" alt="" /></a>
                        <div class="top-content">
                            <h5><a href="single.html">Astral Cruise</a></h5>
                            <div class="white">
                                <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                                <p class="dollar"><span class="in-dollar">$</span><span>4</span><span>5</span></p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!---->
        <div class="content-middle">
            <h3 class="future">BRANDS</h3>
            <div class="content-middle-in">
                <ul id="flexiselDemo1">
                    <li><img src="${pageContext.request.contextPath}/resources/images/ap.png"/></li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/ap1.png"/></li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/ap2.png"/></li>
                    <li><img src="${pageContext.request.contextPath}/resources/images/ap3.png"/></li>

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
            <h3 class="future">LATEST</h3>
            <div class="content-bottom-in">
                <ul id="flexiselDemo2">
                    <li><div class="col-md men">
                        <a href="single.html" class="compare-in "><img  src="${pageContext.request.contextPath}/resources/images/pi4.jpg" alt="" />
                            <div class="compare in-compare">
                                <span>Add to Compare</span>
                                <span>Add to Wishlist</span>
                            </div></a>
                        <div class="top-content bag">
                            <h5><a href="single.html">Symbolic Bag</a></h5>
                            <div class="white">
                                <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                                <p class="dollar"><span class="in-dollar">$</span><span>4</span><span>0</span></p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div></li>
                    <li><div class="col-md men">
                        <a href="single.html" class="compare-in "><img  src="${pageContext.request.contextPath}/resources/images/pi5.jpg" alt="" />
                            <div class="compare in-compare">
                                <span>Add to Compare</span>
                                <span>Add to Wishlist</span>
                            </div></a>
                        <div class="top-content bag">
                            <h5><a href="single.html">Interesting Read</a></h5>
                            <div class="white">
                                <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                                <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>5</span></p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div></li>
                    <li><div class="col-md men">
                        <a href="single.html" class="compare-in "><img  src="${pageContext.request.contextPath}/resources/images/pi6.jpg" alt="" />
                            <div class="compare in-compare">
                                <span>Add to Compare</span>
                                <span>Add to Wishlist</span>
                            </div></a>
                        <div class="top-content bag">
                            <h5><a href="single.html">The Carter</a></h5>
                            <div class="white">
                                <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                                <p class="dollar"><span class="in-dollar">$</span><span>1</span><span>0</span></p>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div></li>
                    <li><div class="col-md men">
                        <a href="single.html" class="compare-in "><img  src="${pageContext.request.contextPath}/resources/images/pi7.jpg" alt="" />
                            <div class="compare in-compare">
                                <span>Add to Compare</span>
                                <span>Add to Wishlist</span>
                            </div></a>
                        <div class="top-content bag">
                            <h5><a href="single.html">Onesie</a></h5>
                            <div class="white">
                                <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                                <p class="dollar"><span class="in-dollar">$</span><span>6</span><span>0</span></p>
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
        <ul class="start">
            <li ><a href="#"><i></i></a></li>
            <li><span>1</span></li>
            <li class="arrow"><a href="#">2</a></li>
            <li class="arrow"><a href="#">3</a></li>
            <li class="arrow"><a href="#">4</a></li>
            <li class="arrow"><a href="#">5</a></li>
            <li ><a href="#"><i  class="next"> </i></a></li>
        </ul>
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
                    <!--此处是页面底部 -->
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
</html>