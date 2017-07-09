<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/7/7
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
<%@include file="all.jsp"%>
<div class="container">
    <div class="products">
        <h2 class=" products-in">PRODUCTS</h2>
        <div class=" top-products">
            <div class="col-md-3 md-col">
                <div class="col-md">
                    <a href="single.html" class="compare-in"><img  src="${pageContext.request.contextPath}/resources/images/pic.jpg" alt="" />
                        <div class="compare">
                            <span>Add to Compare</span>
                            <span>Add to Wishlist</span>
                        </div>
                    </a>
                    <div class="top-content">
                        <h5><a href="single.html">Popular belief</a></h5>
                        <div class="white">
                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                            <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 md-col">
                <div class="col-md">
                    <a href="single.html" class="compare-in"><img  src="${pageContext.request.contextPath}/resources/images/pic1.jpg" alt="" />
                        <div class="compare">
                            <span>Add to Compare</span>
                            <span>Add to Wishlist</span>
                        </div>
                    </a>
                    <div class="top-content">
                        <h5><a href="single.html" >Simply random</a></h5>
                        <div class="white">
                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                            <p class="dollar"><span class="in-dollar">$</span><span>6</span><span>0</span></p>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 md-col">
                <div class="col-md">
                    <a href="single.html" class="compare-in"><img  src="${pageContext.request.contextPath}/resources/images/pic2.jpg" alt="" />
                        <div class="compare">
                            <span>Add to Compare</span>
                            <span>Add to Wishlist</span>
                        </div>
                    </a>
                    <div class="top-content">
                        <h5> <a href="single.html">Classical Latin</a></h5>
                        <div class="white">
                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                            <p class="dollar"><span class="in-dollar">$</span><span>1</span><span>5</span></p>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 md-col">
                <div class="col-md">
                    <a href="single.html" class="compare-in"><img  src="${pageContext.request.contextPath}/resources/images/pic3.jpg" alt="" />
                        <div class="compare">
                            <span>Add to Compare</span>
                            <span>Add to Wishlist</span>
                        </div>
                    </a>
                    <div class="top-content">
                        <h5><a href="single.html">Standard chunk</a></h5>
                        <div class="white">
                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                            <p class="dollar"><span class="in-dollar">$</span><span>4</span><span>0</span></p>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class=" top-products">
            <div class="col-md-3 md-col">
                <div class="col-md">
                    <a href="single.html" class="compare-in"><img  src="${pageContext.request.contextPath}/resources/images/pic4.jpg" alt="" />
                        <div class="compare">
                            <span>Add to Compare</span>
                            <span>Add to Wishlist</span>
                        </div>
                    </a>
                    <div class="top-content">
                        <h5><a href="single.html">Simply random</a></h5>
                        <div class="white">
                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                            <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>5</span></p>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 md-col">
                <div class="col-md">
                    <a href="single.html" class="compare-in"><img  src="${pageContext.request.contextPath}/resources/images/pic5.jpg" alt="" />
                        <div class="compare">
                            <span>Add to Compare</span>
                            <span>Add to Wishlist</span>
                        </div>
                    </a>
                    <div class="top-content">
                        <h5><a href="single.html">Popular belief</a></h5>
                        <div class="white">
                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                            <p class="dollar"><span class="in-dollar">$</span><span>5</span><span>5</span></p>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 md-col">
                <div class="col-md ">
                    <a href="single.html" class="compare-in"><img  src="${pageContext.request.contextPath}/resources/images/pic6.jpg" alt="" />
                        <div class="compare">
                            <span>Add to Compare</span>
                            <span>Add to Wishlist</span>
                        </div>
                    </a>
                    <div class="top-content">
                        <h5> <a href="single.html">Classical Latin</a></h5>
                        <div class="white">
                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                            <p class="dollar"><span class="in-dollar">$</span><span>3</span><span>0</span></p>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 md-col">
                <div class="col-md ">
                    <a href="single.html" class="compare-in"><img  src="${pageContext.request.contextPath}/resources/images/pic7.jpg" alt="" />
                        <div class="compare">
                            <span>Add to Compare</span>
                            <span>Add to Wishlist</span>
                        </div>
                    </a>
                    <div class="top-content">
                        <h5><a href="single.html">Standard chunk</a></h5>
                        <div class="white">
                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                            <p class="dollar"><span class="in-dollar">$</span><span>6</span><span>0</span></p>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="top-products">
            <div class="col-md-3 md-col">
                <div class="col-md">
                    <a href="single.html" class="compare-in" ><img  src="${pageContext.request.contextPath}/resources/images/pic8.jpg" alt="" />
                        <div class="compare">
                            <span>Add to Compare</span>
                            <span>Add to Wishlist</span>
                        </div>
                    </a>
                    <div class="top-content">
                        <h5> <a href="single.html">Classical Latin</a></h5>
                        <div class="white">
                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                            <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 md-col">
                <div class="col-md">
                    <a href="single.html" class="compare-in"><img  src="${pageContext.request.contextPath}/resources/images/pic9.jpg" alt="" />
                        <div class="compare">
                            <span>Add to Compare</span>
                            <span>Add to Wishlist</span>
                        </div>
                    </a>
                    <div class="top-content">
                        <h5><a href="single.html">Standard chunk</a></h5>
                        <div class="white">
                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                            <p class="dollar"><span class="in-dollar">$</span><span>1</span><span>5</span></p>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 md-col">
                <div class="col-md">
                    <a href="single.html" class="compare-in"><img  src="${pageContext.request.contextPath}/resources/images/pic10.jpg" alt="" />
                        <div class="compare">
                            <span>Add to Compare</span>
                            <span>Add to Wishlist</span>
                        </div>
                    </a>
                    <div class="top-content">
                        <h5><a href="single.html">Simply random</a></h5>
                        <div class="white">
                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                            <p class="dollar"><span class="in-dollar">$</span><span>4</span><span>0</span></p>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 md-col">
                <div class="col-md">
                    <a href="single.html" class="compare-in"><img  src="${pageContext.request.contextPath}/resources/images/pic11.jpg" alt="" />
                        <div class="compare">
                            <span>Add to Compare</span>
                            <span>Add to Wishlist</span>
                        </div>
                    </a>
                    <div class="top-content">
                        <h5><a href="single.html">Popular belief</a></h5>
                        <div class="white">
                            <a href="single.html" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">加入购物车</a>
                            <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>9</span></p>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
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
</html>
