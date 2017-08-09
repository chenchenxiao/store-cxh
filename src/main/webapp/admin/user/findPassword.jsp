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
    <title>找回密码</title>
    <script src="${pageContext.request.contextPath}/resources/libs/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <%--<script src="${pageContext.request.contextPath}/resources/js/index.js" type="text/javascript" charset="utf-8"></script>--%>
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
    <div class="desc">找回密码</div>
    <div class="have-account" style="float: right;margin-top: 55px;font-size: 16px;color: #999">
        已有账号？
        <a href="${pageContext.request.contextPath}/admin/user/loginUI.jsp">请登录</a>
    </div>
</header>
<section>
    <form action="${pageContext.request.contextPath}/admin/user/findPassword" method="post" class="findPassword_form">
        <input type="hidden" id="email" value="" name="email"/>
        <input type="hidden" id="phoneNumber" name="phoneNumber"/>`
        <input type="hidden" id="id" name="id" />
        <br>
         <div class="check">
            <h3>请先进行身份验证</h3>
            <br>
            <div class="register-box">
                <label for="condition" class="username_label">登录名
                    <input maxlength="20" type="text" name="condition" placeholder="手机/邮箱/用户名" id="condition"/>
                </label>
            </div>
                <div class="conditionTip">
                </div>
            <div class="register-box">
                <label for="checkCode" class="other_label">验 证 码
                    <input maxlength="20" type="text" placeholder="请输入验证码" id="checkCode"/>
                </label>
                <span id="code"></span>
                <div class="tips">
                </div>
            </div>
            <div class="findPassword_btn">
                <button type="button" id="findPassword_btn">确定</button>
            </div>
         </div>
        <div id="emailWay">
            <div class="register-box" >
                <label for="emailCheckNumber" class="other_label">邮箱验证码
                    <input maxlength="20" type="text" placeholder="请输入邮箱验证码" id="emailCheckNumber"/>
                </label>
                <%--<input type="hidden" id="RealCheckNumber">--%>
                <button id="btn-emailCheck" type="button" style="width: 85px;height:46px;border: none;background:#f2f2f2;color:#333; padding:0">获取验证码</button>
            </div>
                <div class="emailTip"></div>
            <div class="findPassword_btn">
                <button type="button" id="email_btn">确定</button>
            </div>
        </div>
        <div id="phoneWay">
            <div class="register-box" >
                <label for="phoneCheckNumber" class="other_label">手机验证码
                    <input maxlength="20" type="text" placeholder="请输入手机验证码" id="phoneCheckNumber"/>
                </label>
                <%--<input type="hidden" id="RealCheckNumber">--%>
                <button id="btn-phoneCheck" type="button" style="width: 85px;height:46px;border: none;background:#f2f2f2;color:#333; padding:0">获取验证码</button>
            </div>
                <div class="phoneTip"></div>
            <div class="findPassword_btn">
                <button type="button" id="phone_btn">确定</button>
            </div>
        </div>
        <div class="findWay">
            <div>
                请选择找回密码的方式
            </div>
            <br>
            <div>
                <a href="#" class="findByEmailWay">根据邮箱找回密码</a>
            </div>
            <br>
            <div>
                <a href="#" class="findByPhoneWay">根据手机号找回密码</a>
            </div>
        </div>
        <div class="updatePassword">
            <div class="register-box">
                <label for="password" class="other_label">设 置 密 码
                    <input maxlength="20" name="password" type="password" placeholder="建议至少使用两种字符组合" id="password"/>
                </label>
                <div class="tips">
                </div>
            </div>
            <div class="register-box">
                <label for="configPassword" class="other_label">确 认 密 码
                    <input maxlength="20" type="password" placeholder="请再次输入密码" id="configPassword"/>
                </label>
                <div class="tips">
                </div>
            </div>
            <div class="findPassword_btn">
                <button type="button" id="updatePassword_btn">确定</button>
            </div>
        </div>
    </form>
</section>
</body>
<script type="text/javascript">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/findPassword.js"></script>
<script type="text/javascript">
    $("#findPassword_btn").click(function () {
        if($("#condition").val().length == 0){
            $(".conditionTip").text("请输入登录名")
            $(".conditionTip").css("color",'red');
            return;
        }
        $.ajax({
            "url":"${pageContext.request.contextPath}/admin/user/checkUser",
            "data":{"condition":$('#condition').val()},
            "type":"POST",
            "success":function(data){
               if(data.result == false){
                    $(".conditionTip").text("该账户不存在，请重新输入 ")
                    $(".conditionTip").css("color",'red');
                    conditionResult = false;
                    return;
               }else{
                    $("#email").val(data.email)
                    $("#phoneNumber").val(data.phoneNumber)
                    $("#id").val(data.id)
                    $(".conditionTip").text("")
                   conditionResult = true;
               }
            },
            "dataType":"json"
        })
        if(conditionResult && codeResult){
            $(".check").hide()
            $(".findWay").show()
        }
    })
    $("#btn-emailCheck").click(function () {
        alert("成功发送信息！")
        $.ajax({
            "url":"${pageContext.request.contextPath}/admin/user/checkEmail",
            "data":{"email":$('#email').val()},
            "type":"POST",
            "success":function(data){
                // $("#RealCheckNumber").val(data.result)
                getcheckVal(data.result)
            },
            "dataType":"json"
        });
    })
    $("#btn-phoneCheck").click(function () {
        alert("成功发送信息！")
        $.ajax({
            "url":"${pageContext.request.contextPath}/admin/user/checkPhone",
            "data":{"phoneNumber":$('#phoneNumber').val()},
            "type":"POST",
            "success":function(data){
                // $("#RealCheckNumber").val(data.result)
                getcheckVal(data.result)
            },
            "dataType":"json"
        });
    })
</script>
</html>

