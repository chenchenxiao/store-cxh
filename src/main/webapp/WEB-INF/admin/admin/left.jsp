<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/7/7
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>管理员</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/public.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/public.js"></script>
    <head></head>

<body id="bg">
<!-- 左边节点 -->
<div class="container">

    <div class="leftsidebar_box">
        <a href="${pageContext.request.contextPath}/admin/advertisement/indexAd" target="_top">
            <div class="line">
                <img src="${pageContext.request.contextPath}/resources/img/coin01.png"/>&nbsp;&nbsp;首页
            </div>
        </a>
        <%--<dl class="system_log">--%>
        <%--<dt><img class="icon1" src="${pageContext.request.contextPath}/resources/img/coin01.png" /><img class="icon2"src="${pageContext.request.contextPath}/resources/img/coin02.png" />--%>
        <%--返回首页<img class="icon3" src="${pageContext.request.contextPath}/resources/img/coin19.png" /><img class="icon4" src="${pageContext.request.contextPath}/resources/img/coin20.png" /></dt>--%>
        <%--</dl>--%>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${pageContext.request.contextPath}/resources/img/coin03.png"/>
                <img class="icon2" src="${pageContext.request.contextPath}/resources/img/coin04.png"/>
                     我的商品
                <img class="icon3" src="${pageContext.request.contextPath}/resources/img/coin19.png"/>
                <img class="icon4"src="${pageContext.request.contextPath}/resources/img/coin20.png"/>
            </dt>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png"/>
                <img class="coin22" src="${pageContext.request.contextPath}/resources/img/coin222.png"/>
                <a class="cks" href="${pageContext.request.contextPath}/admin/items/itemsList"
                        <c:if test="${sessionScope.loginUser != null}"> target="main"</c:if>
                        <c:if test="${sessionScope.loginUser == null}"> target="_top"</c:if>>
                    我的商品
                </a>
                <img class="icon5" src="${pageContext.request.contextPath}/resources/img/coin21.png"/>
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${pageContext.request.contextPath}/resources/img/coin07.png"/>
                <img class="icon2" src="${pageContext.request.contextPath}/resources/img/coin08.png"/>
                用户管理
                <img class="icon3" src="${pageContext.request.contextPath}/resources/img/coin19.png"/>
                <img class="icon4" src="${pageContext.request.contextPath}/resources/img/coin20.png"/>
            </dt>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png"/>
                <img class="coin22" src="${pageContext.request.contextPath}/resources/img/coin222.png"/>
                <a href="${pageContext.request.contextPath}/admin/admin/userList" target="main" class="cks">用户管理</a>
                <img class="icon5" src="${pageContext.request.contextPath}/resources/img/coin21.png"/>
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${pageContext.request.contextPath}/resources/img/coin11.png"/>
                <img class="icon2" src="${pageContext.request.contextPath}/resources/img/coin12.png"/>
                广告管理
                <img class="icon3" src="${pageContext.request.contextPath}/resources/img/coin19.png"/>
                <img class="icon4" src="${pageContext.request.contextPath}/resources/img/coin20.png"/>
            </dt>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png"/>
                <img class="coin22" src="${pageContext.request.contextPath}/resources/img/coin222.png"/>
                <a href="${pageContext.request.contextPath}/admin/admin/showAd" target="main" class="cks">广告管理</a>
                <img class="icon5" src="${pageContext.request.contextPath}/resources/img/coin21.png"/>
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${pageContext.request.contextPath}/resources/img/coinL1.png"/>
                <img class="icon2" src="${pageContext.request.contextPath}/resources/img/coinL2.png"/> 我的账户
                <img class="icon3" src="${pageContext.request.contextPath}/resources/img/coin19.png"/>
                <img class="icon4" src="${pageContext.request.contextPath}/resources/img/coin20.png"/>
            </dt>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png"/>
                <img class="coin22" src="${pageContext.request.contextPath}/resources/img/coin222.png"/>
                <a href="${pageContext.request.contextPath}/admin/user/updateUI/${sessionScope.loginUser.id}"
                   target="main" class="cks">个人资料</a>
                <img class="icon5" src="${pageContext.request.contextPath}/resources/img/coin21.png"/>
            </dd>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png"/>
                <img class="coin22" src="${pageContext.request.contextPath}/resources/img/coin222.png"/>
                <a href="${pageContext.request.contextPath}/admin/user/securityUI/${sessionScope.loginUser.id}"
                   target="main" class="cks">安全设置</a>
                <img class="icon5" src="${pageContext.request.contextPath}/resources/img/coin21.png"/>
            </dd>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png"/>
                <img class="coin22" src="${pageContext.request.contextPath}/resources/img/coin222.png"/>
                <a href="${pageContext.request.contextPath}/admin/admin/logout" class="cks" target="_top">退出</a>
                <img class="icon5" src="${pageContext.request.contextPath}/resources/img/coin21.png"/>
            </dd>
        </dl>

    </div>

</div>
</body>
</html>

