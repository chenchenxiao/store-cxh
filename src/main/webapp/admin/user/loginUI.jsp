<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/7/6
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/public.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/page.css" />
    <link href="${pageContext.request.contextPath}/resources/css/messenger/messenger.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/messenger/messenger-theme-future.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/messenger/messenger-theme-flat.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/messenger/messenger-theme-air.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/public.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/messenger/messenger.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/messenger/messenger-theme-future.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/messenger/messenger.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
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
            <a href="${pageContext.request.contextPath}/admin/user/findPassword.jsp" class="p2"> 忘记密码</a>
            <a href="${pageContext.request.contextPath}/userRegist.jsp" class="p2"> 免费注册&nbsp;&nbsp;&nbsp;</a>

        </div>
        <!-- 输入框 -->
    <form action="${pageContext.request.contextPath}/admin/user/login" method="post" id="user_form">
        <div class="lgD">
            <img class="img1" src="${pageContext.request.contextPath}/resources/img/logName.png" />
            <input type="text" name="account" id="account" placeholder="输入用户名" />
        </div>
        <div class="lgD">
            <img class="img1" src="${pageContext.request.contextPath}/resources/img/logPwd.png" />
            <input type="password" name="password" id="password"  placeholder="输入用户密码" style="width: 100%;height: 42px" />
        </div>

            <div class="logC">
            <button type="submit">登录</button>
        </div>
        <div class="logD logDtip">
            <a href="${pageContext.request.contextPath}/admin/advertisement/indexAd" class="p2">商城首页</a>
        </div>
    </form>
    </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function() {
        $("#user_form").validate({
            rules: {
                account: {
                    required:true,
                },
                password: "required",
            },
            messages: {
                account: {
                    required: " 请填写你的姓名",
                },
                password: " 请填写您的密码",
            }
        });
    });
</script>
<c:if test="${result!=null}">
    <script>
        $().ready(function(){
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

</html>
