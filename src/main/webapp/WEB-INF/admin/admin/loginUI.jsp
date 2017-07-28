<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/6/12
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/Wopop_files/style_log.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/Wopop_files/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/Wopop_files/userpanel.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/Wopop_files/jquery.ui.all.css">
<title>管理员登录</title>
<%@ include file="../alcss.jsp" %>
    <link href="${pageContext.request.contextPath}/resources/css/messenger/messenger-theme-air.css" rel="stylesheet" type="text/css" />
<%@ include file="../aljs.jsp" %>
<body class="login" mycollectionplug="bind">
    <div class="login_m">
        <div class="login_logo"><img src="${pageContext.request.contextPath}/resources/img/aodeBig.png" width="196" height="46"></div>
            <form action="${pageContext.request.contextPath}/admin/admin/login" method="post" id="admin-form">
                <div class="login_boder">
                    <div class="login_padding" id="login_model">
                        <h2>用户名</h2>
                        <label>
                            <input type="text" id="account" class="txt_input txt_input2" name="name" placeholder="用户名" >
                        </label>
                        <h2>密码</h2>
                        <label>
                            <input type="password" name="password" id="password" class="txt_input" placeholder="密码">
                        </label>
                        <div class="rem_sub">
                            <label>
                                <input type="submit" class="sub_button" name="button" id="button" value="登录" style="opacity: 0.7;">
                            </label>
                        </div>
                    </div>
                <div id="forget_model" class="login_padding" style="display:none">
                    <br>
                    <h1>Forgot password</h1>
                    <br>
                    <div class="forget_model_h2">(Please enter your registered email below and the system will automatically reset users’ password and send it to user’s registered email address.)</div>
                        <label>
                            <input type="text" id="usrmail" class="txt_input txt_input2">
                        </label>
                        <div class="rem_sub">
                            <div class="rem_sub_l"></div>
                            <label>
                                <input type="submit" class="sub_buttons" name="button" id="Retrievenow" value="Retrieve now" style="opacity: 0.7;">　　
                                <input type="submit" class="sub_button" name="button" id="denglou" value="Return" style="opacity: 0.7;">　　
                            </label>
                        </div>
                </div>
           </form>
        <!--login_padding  Sign up end-->
        </div><!--login_boder end-->
    </div><!--login_m end-->

    <script type="text/javascript">
        $(document).ready(function() {
            $("#admin-form").validate({
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
</body>
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
