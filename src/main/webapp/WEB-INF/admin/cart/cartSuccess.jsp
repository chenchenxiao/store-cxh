<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/7/21
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/initcart20150123.css" >
    <%--<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />--%>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />

    <title>商品已成功加入购物车</title>
    <style id="style-1-cropbar-clipper">
        /* Copyright 2014 Evernote Corporation. All rights reserved. */
        .en-markup-crop-options {
            top: 18px !important;
            left: 50% !important;
            margin-left: -100px !important;
            width: 200px !important;
            border: 2px rgba(255, 255, 255, .38) solid !important;
            border-radius: 4px !important;
        }

        .en-markup-crop-options div div:first-of-type {
            margin-left: 0px !important;
        }
    </style>
</head>
<body class="root61">

<%@include file="/header.jsp"%>
<!--main start-->
<div class="w main">
    <div class="left">
        <div class="m" id="succeed">

            <div class="corner tl"></div>
            <div class="corner tr"></div>
            <div class="corner bl"></div>
            <div class="corner br"></div>
            <div class="success">
                <p>
                &nbsp;&nbsp;&nbsp;
                <div class="success-b">
                    <h3>商品已成功加入购物车！</h3>
                    <span id="flashBuy" style="display: none">商品数量有限，请您尽快下单并付款！</span>
                </div>
                <span id="initCart_next_go"> <a class="btn-1"
                                                href="/cart/cart.html"
                                                id="GotoShoppingCart">去购物车结算</a> <span class="ml10">您还可以 <a
                        class="ftx-05" href="javascript:history.back();">继续购物</a></span>
					</span>
            </div>
        </div>
        <!--succeed end-->
    </div>
</div>


</body>
</html>
