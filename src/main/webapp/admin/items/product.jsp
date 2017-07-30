<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/7/7
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");
%>
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

    <script type="text/javascript">
        function viewItems(id){
            window.open("${pageContext.request.contextPath}/admin/items/viewItems?id="+id);
        }
        function addCart(id){
            $(".list_form").attr("action","${pageContext.request.contextPath}/admin/cart/addToCart?itemsId="+id)
            <%--window.open("${pageContext.request.contextPath}/admin/orders/addToCart?itemsId="+id);--%>
            $(".list_form").submit();
        }
    </script>
</head>
<body>
<!--页面顶部 -->
<%@include file="/header.jsp"%>
<div class="container">
    <div class="products">
        <h2 class=" products-in">商品列表</h2>
            <form action="${pageContext.request.contextPath}/admin/items/showTypeItems" method="post" class="list_form">
                <input type="hidden" id="pageNum" name="page" value="1">
                <input type="hidden" value="${type}" name="type">
                <div class=" top-products">
                    <c:if test="${PageBean.recordCount == 0}">
                        <h4>还没有该类型的商品，去逛逛别的吧</h4>
                    </c:if>
                    <c:forEach items="${PageBean.recordList}" var="items" varStatus="status">
                      <div class="col-md-3 md-col">
                        <div class="col-md">
                            <a href="#" class="compare-in">
                                <img height="207px" width="250px" src="${pageContext.request.contextPath}/resources/file/items/${items.photo}" alt="" />
                                <div class="compare">
                                        <c:if test="${sessionScope.loginUser.id != items.uid}">
                                            <span id="addCart" onclick="addCart(${items.id})">
                                                <%--<c:if test="${sessionScope.loginUser.id == items.uid}">你的商品</c:if>--%>
                                                加入购物车
                                            </span>
                                        </c:if>
                                        <c:if test="${sessionScope.loginUser.id == items.uid}">
                                            <span id="addCart" onclick="viewItems(${items.id})">
                                               你的商品
                                            </span>
                                       </c:if>
                                </div>
                            </a>
                            <div class="top-content">
                                名称:&nbsp;&nbsp;&nbsp; ${items.name}
                                <h5>标题:&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${items.id}">${items.title}</a></h5>
                                <div class="white">
                                    <a href="#" onclick="viewItems(${items.id})" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">查看详情</a>
                                    <p class="dollar"><span class="in-dollar">￥</span><span>${items.price}</span></p>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="clearfix"></div>
                </div>
                <ul class="start">
                    <c:if test="${PageBean.page > 1}">
                        <li class="arrow"><a href="javascript:void(0)" onclick="showPage(1)">[首页]</a></li>
                        <li ><a href="javascript:void(0)" onclick="showPage(${PageBean.page - 1})"><i></i></a></li>
                        <%--<li class="arrow"><a href="javascript:void(0)" onclick="showPage(${PageBean.page - 1})">[上一页]</a>&nbsp;&nbsp;</li>--%>
                    </c:if>
                <%--动态显示条 --%>
                    <c:forEach begin = "${PageBean.beginPageIndex}" end = "${PageBean.endPageIndex}" var="num">
                        <li class="arrow"><a href="javascript:void(0)" onclick="showPage(${num})">${num}</a></li>
                    </c:forEach>
                    <c:if test = "${PageBean.page < PageBean.pageCount}">
                        <li ><a href="javascript:void(0)" onclick="showPage(${PageBean.page+1})"><i  class="next"> </i></a></li>
                        <%--<li class="next"><a href="javascript:void(0)" onclick="showPage(${PageBean.page+1})">[下一页]</a>&nbsp;&nbsp;</li>--%>
                        <li class="next"><a href="javascript:void(0)" onclick="showPage(${PageBean.pageCount})">[尾页]</a>&nbsp;&nbsp;</li>
                    </c:if>
                    <c:if test="${PageBean.pageCount > 0}">
                        <span>第${PageBean.page}/
                                ${pageBean.pageCount}页
                        </span>
                    </c:if>
                </ul>
                <div class="clearfix"></div>
            </form>
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

<script type="text/javascript">
    function showPage(num){
        //1 修改隐藏域的值
        document.getElementById("pageNum").value = num;
        //2 提交表单
        $(".list_form").submit();
    }
</script>
</html>
