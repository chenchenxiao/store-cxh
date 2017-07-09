<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/7/7
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的商城</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/public.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/public.js"></script>
    <head></head>

<body id="bg">
<!-- 左边节点 -->
<div class="container">

    <div class="leftsidebar_box">
        <a href="${pageContext.request.contextPath}/show.jsp" target="_top"><div class="line">
        <img src="${pageContext.request.contextPath}/resources/img/coin01.png" />&nbsp;&nbsp;首页
    </div></a>
        <%--<dl class="system_log">--%>
            <%--<dt><img class="icon1" src="${pageContext.request.contextPath}/resources/img/coin01.png" /><img class="icon2"src="${pageContext.request.contextPath}/resources/img/coin02.png" />--%>
                <%--返回首页<img class="icon3" src="${pageContext.request.contextPath}/resources/img/coin19.png" /><img class="icon4" src="${pageContext.request.contextPath}/resources/img/coin20.png" /></dt>--%>
        <%--</dl>--%>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${pageContext.request.contextPath}/resources/img/coin03.png" /><img class="icon2"
                                                                  src="${pageContext.request.contextPath}/resources/img/coin04.png" /> 网站管理<img class="icon3"
                                                                                                      src="${pageContext.request.contextPath}/resources/img/coin19.png" /><img class="icon4"
                                                                                                                                     src="${pageContext.request.contextPath}/resources/img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png" /><img class="coin22"
                                                                    src="${pageContext.request.contextPath}/resources/img/coin222.png" /><a class="cks" href="../user.html"
                                                                                                  target="main">管理员管理</a><img class="icon5" src="${pageContext.request.contextPath}/resources/img/coin21.png" />
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${pageContext.request.contextPath}/resources/img/coin05.png" /><img class="icon2"
                                                                  src="${pageContext.request.contextPath}/resources/img/coin06.png" /> 公共管理<img class="icon3"
                                                                                                      src="${pageContext.request.contextPath}/resources/img/coin19.png" /><img class="icon4"
                                                                                                                                     src="${pageContext.request.contextPath}/resources/img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png" /><img class="coin22"
                                                                    src="${pageContext.request.contextPath}/resources/img/coin222.png" /><a class="cks" href="../banner.html"
                                                                                                  target="main">广告管理</a><img class="icon5" src="${pageContext.request.contextPath}/resources/img/coin21.png" />
            </dd>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png" /><img class="coin22"
                                                                    src="${pageContext.request.contextPath}/resources/img/coin222.png" /><a class="cks" href="../opinion.html"
                                                                                                  target="main">意见管理</a><img class="icon5" src="${pageContext.request.contextPath}/resources/img/coin21.png" />
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${pageContext.request.contextPath}/resources/img/coin07.png" /><img class="icon2"
                                                                  src="${pageContext.request.contextPath}/resources/img/coin08.png" /> 会员管理<img class="icon3"
                                                                                                      src="${pageContext.request.contextPath}/resources/img/coin19.png" /><img class="icon4"
                                                                                                                                     src="${pageContext.request.contextPath}/resources/img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png" /><img class="coin22"
                                                                    src="${pageContext.request.contextPath}/resources/img/coin222.png" /><a href="../vip.html" target="main"
                                                                                                  class="cks">会员管理</a><img class="icon5" src="${pageContext.request.contextPath}/resources/img/coin21.png" />
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${pageContext.request.contextPath}/resources/img/coin10.png" /><img class="icon2"
                                                                  src="${pageContext.request.contextPath}/resources/img/coin09.png" /> 行家管理<img class="icon3"
                                                                                                      src="${pageContext.request.contextPath}/resources/img/coin19.png" /><img class="icon4"
                                                                                                                                     src="${pageContext.request.contextPath}/resources/img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png" /><img class="coin22"
                                                                    src="${pageContext.request.contextPath}/resources/img/coin222.png" /><a href="../connoisseur.html"
                                                                                                  target="main" class="cks">行家管理</a><img class="icon5"
                                                                                                                                         src="${pageContext.request.contextPath}/resources/img/coin21.png" />
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${pageContext.request.contextPath}/resources/img/coin11.png" /><img class="icon2"
                                                                  src="${pageContext.request.contextPath}/resources/img/coin12.png" /> 话题管理<img class="icon3"
                                                                                                      src="${pageContext.request.contextPath}/resources/img/coin19.png" /><img class="icon4"
                                                                                                                                     src="${pageContext.request.contextPath}/resources/img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png" /><img class="coin22"
                                                                    src="${pageContext.request.contextPath}/resources/img/coin222.png" /><a href="../topic.html" target="main"
                                                                                                  class="cks">话题管理</a><img class="icon5" src="${pageContext.request.contextPath}/resources/img/coin21.png" />
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${pageContext.request.contextPath}/resources/img/coin14.png" /><img class="icon2"
                                                                  src="${pageContext.request.contextPath}/resources/img/coin13.png" /> 我的收藏<img class="icon3"
                                                                                                      src="${pageContext.request.contextPath}/resources/img/coin19.png" /><img class="icon4"
                                                                                                                                     src="${pageContext.request.contextPath}/resources/img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png" /><img class="coin22"
                                                                    src="${pageContext.request.contextPath}/resources/img/coin222.png" /><a href="../wish.html" target="main"
                                                                                                  class="cks">我的收藏</a><img class="icon5" src="${pageContext.request.contextPath}/resources/img/coin21.png" />
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${pageContext.request.contextPath}/resources/img/coin15.png" /><img class="icon2"
                                                                  src="${pageContext.request.contextPath}/resources/img/coin16.png" /> 约见管理<img class="icon3"
                                                                                                      src="${pageContext.request.contextPath}/resources/img/coin19.png" /><img class="icon4"
                                                                                                                                     src="${pageContext.request.contextPath}/resources/img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png" /><img class="coin22"
                                                                    src="${pageContext.request.contextPath}/resources/img/coin222.png" /><a href="../appointment.html"
                                                                                                  target="main" class="cks">约见管理</a><img class="icon5"
                                                                                                                                         src="${pageContext.request.contextPath}/resources/img/coin21.png" />
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${pageContext.request.contextPath}/resources/img/coin17.png" /><img class="icon2"
                                                                  src="${pageContext.request.contextPath}/resources/img/coin18.png" /> 我的购物车<img class="icon3"
                                                                                                      src="${pageContext.request.contextPath}/resources/img/coin19.png" /><img class="icon4"
                                                                                                                                     src="${pageContext.request.contextPath}/resources/img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png" /><img class="coin22"
                                                                    src="${pageContext.request.contextPath}/resources/img/coin222.png" /><a href="../balance.html"
                                                                                                  target="main" class="cks">我的购物车</a><img class="icon5"
                                                                                                                                         src="${pageContext.request.contextPath}/resources/img/coin21.png" />
            </dd>
        </dl>
        <dl class="system_log">
            <dt>
                <img class="icon1" src="${pageContext.request.contextPath}/resources/img/coinL1.png" /><img class="icon2"
                                                                  src="${pageContext.request.contextPath}/resources/img/coinL2.png" /> 系统管理<img class="icon3"
                                                                                                      src="${pageContext.request.contextPath}/resources/img/coin19.png" /><img class="icon4"
                                                                                                                                     src="${pageContext.request.contextPath}/resources/img/coin20.png" />
            </dt>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png" /><img class="coin22"
                                                                    src="${pageContext.request.contextPath}/resources/img/coin222.png" /><a href="../changepwd.html"
                                                                                                  target="main" class="cks">修改密码</a><img class="icon5"
                                                                                                                                         src="${pageContext.request.contextPath}/resources/img/coin21.png" />
            </dd>
            <dd>
                <img class="coin11" src="${pageContext.request.contextPath}/resources/img/coin111.png" /><img class="coin22"
                                                                    src="${pageContext.request.contextPath}/resources/img/coin222.png" /><a class="cks">退出</a><img
                    class="icon5" src="${pageContext.request.contextPath}/resources/img/coin21.png" />
            </dd>
        </dl>

    </div>

</div>
</body>
</html>

