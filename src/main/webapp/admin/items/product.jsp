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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/items.js"></script>

    <%--<script type="text/javascript">--%>
        <%--jQuery(document).ready(function($) {--%>
            <%--$(".scroll").click(function(event){--%>
                <%--event.preventDefault();--%>
                <%--$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);--%>
            <%--});--%>
        <%--});--%>
    <%--</script>--%>
    <%--<script>--%>
        <%--$(document).ready(function(c) {--%>
        <%--$('.alert-close').on('click', function(c){--%>
            <%--$('.message').fadeOut('slow', function(c){--%>
                <%--$('.message').remove();--%>
            <%--});--%>
        <%--});--%>
    <%--});--%>
    <%--</script>--%>
    <%--<script>--%>
    <%--$(document).ready(function(c) {--%>
        <%--$('.alert-close1').on('click', function(c){--%>
            <%--$('.message1').fadeOut('slow', function(c){--%>
                <%--$('.message1').remove();--%>
            <%--});--%>
        <%--});--%>
    <%--});--%>
    <%--</script>--%>

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
<div class="header-bottom-in">
    <div class="container">
        <div class="header-bottom-on">
            <%--<p class="wel"><a href="#">Welcome visitor you can login or create an account.</a></p>--%>
            <div class="header-can">
                <div class="search">
                    <form action="${pageContext.request.contextPath}/admin/items/showTypeItems" method="post">
                        <input type="text" value="" name="searchText" placeholder="站内搜索" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '';}" >
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
<div class="container">
    <div class="products">
        <h2 class=" products-in">商品列表</h2>
            <form action="${pageContext.request.contextPath}/admin/items/showTypeItems" method="post" class="list_form">
                <input type="hidden" id="pageNum" name="page" value="1">
                <input type="hidden" value="${type}" name="type">
                <div class=" top-products">
                    <c:if test="${PageBean.recordCount == 0}">
                        <h4>找不到相关的宝贝，去逛逛别的吧</h4>
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
