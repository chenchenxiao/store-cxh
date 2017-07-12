<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/7/7
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>账户注册</title>
    <script src="${pageContext.request.contextPath}/resources/libs/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/resources/js/index.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css"/>
    <link href="${pageContext.request.contextPath}/resources/css/messenger/messenger.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/messenger/messenger-theme-future.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/messenger/messenger-theme-flat.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/messenger/messenger-theme-air.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/js/messenger/messenger.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/messenger/messenger-theme-future.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/messenger/messenger.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
</head>
<body>
<header class="header">
    <a href="#" class="logo"></a>
    <div class="desc">欢迎注册</div>
    <div class="have-account" style="float: right;margin-top: 55px;font-size: 16px;color: #999">
        已有账号？
        <a href="${pageContext.request.contextPath}/admin/user/loginUI.jsp">请登录</a>
    </div>
</header>
<section>
    <form action="${pageContext.request.contextPath}/admin/user/regist" method="post" class="add_form">
        <div class="register-box">
            <label for="username" class="username_label">用 户 名
                <input maxlength="20" type="text" name="account" placeholder="您的用户名和登录名" id="account"/>
            </label>
            <div class="tips">

            </div>
        </div>
        <div class="register-box">
            <label for="username" class="username_label">姓 名
                <input maxlength="20" type="text" name="name" placeholder="您的用户名和登录名" id="name"/>
            </label>
            <div class="tips">

            </div>
        </div>
        <div class="register-box">
            <label for="password" class="other_label">设 置 密 码
                <input maxlength="20" name="password" type="password" placeholder="建议至少使用两种字符组合" id="password"/>
            </label>
            <div class="tips">

            </div>
        </div>
        <div class="register-box">
            <label for="passwordConfig" class="other_label">确 认 密 码
                <input maxlength="20" type="password" placeholder="请再次输入密码" id="configPassword"/>
            </label>
            <div class="tips">

            </div>
        </div>
        <div class="register-box">
            <label for="phoneNumber" class="other_label">
                <span>中国 0086∨</span>
                <input class="phone" id="phoneNumber" name="phoneNumber" maxlength="20" type="text" placeholder="建议使用常用手机" />
            </label>
            <div class="tips">

            </div>
        </div>
        <div class="register-box">
            <label for="username" class="other_label">验 证 码
                <input maxlength="20" type="text" placeholder="请输入验证码" id="checkCode"/>
            </label>
            <span id="code"></span>
            <div class="tips">
            </div>
        </div>
        <div class="register-box">
            <label for="checkNumber" class="other_label">手机验证码
                <input maxlength="20" type="text" placeholder="请输入手机验证码" id="checkNumber"/>
            </label>
            <%--<input type="hidden" id="RealCheckNumber">--%>
            <button id="btn-phoneCheck" type="button" style="width: 85px;height:46px;border: none;background:#f2f2f2;color:#333; padding:0">获取验证码</button>
        </div>
         <div class="check"></div>
        <%--<div class="arguement">--%>
            <%--<input type="checkbox" id="xieyi"/>--%>
            <%--阅读并同意--%>
            <%--<a href="#">《京东用户注册协议》</a>--%>
            <%--<a href="#">《隐私政策》</a>--%>
            <%--<div class="tips">--%>

            <%--</div>--%>
        <%--</div>--%>
        <div class="submit_btn">
            <button type="button" id="submit_btn">立 即 注 册</button>
        </div>
    </form>
</section>
</body>
<script type="text/javascript">
    $(document).ready(function() {
        $("#user_form").validate({
            rules: {
                name: {
                    required: true,
                    isChinese: true
                },
            messages: {
                name: {
                    required:"请填写你的姓名",
                    isChinese:"请正确填写你的姓名"
                },
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

