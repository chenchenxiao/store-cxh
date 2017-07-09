<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/7/6
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/public.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/page.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/public.js"></script>
</head>
<body>

<!-- 登录页面头部 -->
<%--<div class="logHead">--%>
    <%--<img src="${pageContext.request.contextPath}/resources/img/logLOGO.png" />--%>
<%--</div>--%>
<!-- 登录页面头部结束 -->

<!-- 登录body -->
<div class="logDiv">
    <img class="logBanner" src="${pageContext.request.contextPath}/resources/img/logBanner.png" />
    <div class="logGet">
        <!-- 头部提示信息 -->
        <div class="logD logDtip">
            <p class="p1">登录</p>
            <a href="#" class="p2"> 忘记密码</a>
            <a href="userRegist.jsp" class="p2"> 免费注册&nbsp;&nbsp;&nbsp;</a>

        </div>
        <!-- 输入框 -->
        <div class="lgD">
            <img class="img1" src="${pageContext.request.contextPath}/resources/img/logName.png" />
            <input type="text"  placeholder="输入用户名" />
        </div>
        <div class="lgD">
            <img class="img1" src="${pageContext.request.contextPath}/resources/img/logPwd.png" />
            <input type="text"  placeholder="输入用户密码" />
        </div>
        <%--<div class="lgD logD2">--%>
            <%--<input class="getYZM" type="text" />--%>
            <%--<div class="logYZM">--%>
                <%--<img class="yzm" src="${pageContext.request.contextPath}/resources/img/logYZM.png" />--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="logC">
            <button>登 录</button>
        </div>
    </div>
</div>
<!-- 登录body  end -->

<!-- 登录页面底部 -->
<%--<div class="logFoot">--%>
    <%--<p class="p1">版权所有：南京设易网络科技有限公司</p>--%>
    <%--<p class="p2">南京设易网络科技有限公司 登记序号：苏ICP备11003578号-2</p>--%>
<%--</div>--%>
<!-- 登录页面底部end -->
</body>
</html>
