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

<script type="text/javascript">
    $(".findWay").hide()
    $("#emailWay").hide()
    $("#phoneWay").hide()
    $(".updatePassword").hide()
    var conditionResult = false;
    var codeResult = false;
    var checkResult;
    var emailResult = false;
    var passwordResult = false;
    var configResult = false;
    function getcheckVal(result){
        checkResult = result;
    }
    // 	验证码
    //	 验证码刷新
    function code(){
        var str="qwertyuiopasdfghjklzxcvbnm1234567890QWERTYUIOPLKJHGFDSAZXCVBNM";
        var str1=0;
        for(var i=0; i<4;i++){
            str1+=str.charAt(Math.floor(Math.random()*62))
        }
        str1=str1.substring(1)
        $("#code").text(str1);
    }
    code();
    $("#code").click(code);
    //	验证码验证
    $("#checkCode").blur(function(){
        if($(this).val().length==0){
            $(this).parent().next().next("div").text("");
            $(this).parent().next().next("div").css("color",'#ccc');
            codeResult = false;
        }else if($(this).val().toUpperCase()!=$("#code").text().toUpperCase()){
            $(this).parent().next().next("div").text("验证码不正确");
            $(this).parent().next().next("div").css("color",'red');
            codeResult = false;
        }else{
            $(this).parent().next().next("div").text("");
            codeResult = true;
        }
    })

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
                   alert("false")
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

    $(".findByEmailWay").click(function () {
        $(".findWay").hide()
        $("#emailWay").show()
        $("#phoneWay").hide()
    })
    $(".findByPhoneWay").click(function () {
        $(".findWay").hide()
        $("#emailWay").hide()
        $("#phoneWay").show()
    })

    $("#btn-emailCheck").click(function () {
        $.ajax({
            "url":"${pageContext.request.contextPath}/admin/user/checkEmail",
            "data":{"email":$('#email').val()},
            "type":"POST",
            "success":function(data){
                alert("checkEmail--》" + data.result)
                // $("#RealCheckNumber").val(data.result)
                getcheckVal(data.result)
            },
            "dataType":"json"
        });
    })

    $("#email_btn").click(function () {
        if($("#emailCheckNumber").val().length == 0){
            $(".emailTip").text("请输入验证码");
            $(".emailTip").css("color",'red');
            return;
        }
        if(checkResult != $("#emailCheckNumber").val()){
            $(".emailTip").text("验证码不正确或已超时，请重新获取");
            $(".emailTip").css("color",'red');
            return;
        }else{
            $("#emailWay").hide()
            $(".updatePassword").show()
        }
    })
    $("#btn-phoneCheck").click(function () {
        $.ajax({
            "url":"${pageContext.request.contextPath}/admin/user/checkPhone",
            "data":{"phoneNumber":$('#phoneNumber').val()},
            "type":"POST",
            "success":function(data){
                alert("checkPhone-->" + data.result)
                // $("#RealCheckNumber").val(data.result)
                getcheckVal(data.result)
            },
            "dataType":"json"
        });
    })

    $("#phone_btn").click(function () {
        if($("#phoneCheckNumber").val().length == 0){
            $(".phoneTip").text("请输入验证码");
            $(".phoneTip").css("color",'red');
            return;
        }
        if(checkResult != $("#phoneCheckNumber").val()){
            $(".phoneTip").text("验证码不正确或已超时，请重新获取");
            $(".phoneTip").css("color",'red');
            return;
        }else{
            $("#phoneWay").hide()
            $(".updatePassword").show()
        }
    })
    //密码
    $("#password").blur(function(){
        if($(this).val().length==0){
            $(this).parent().next("div").text("");
            $(this).parent().next("div").css("color",'#ccc');
            passwordResult = false;
        }else if($(this).val().length>0 && $(this).val().length<6){
            $(this).parent().next("div").text("长度只能在6-20个字符之间");
            $(this).parent().next("div").css("color",'red');
            passwordResult = false;
        }else{
            $(this).parent().next("div").text("");
            passwordResult = true;
        }
    })
    //	确认密码
    $("#configPassword").blur(function(){
        if($(this).val().length==0){
            $(this).parent().next("div").text("");
            $(this).parent().next("div").css("color",'#ccc');
            configResult = false;
        }else if($(this).val()!=$("#password").val()){
            $(this).parent().next("div").text("两次密码不匹配");
            $(this).parent().next("div").css("color",'red');
            configResult = false;
        }else{
            $(this).parent().next("div").text("");
            configResult = true;
        }
    })
    $("#updatePassword_btn").click(function () {
//        alert("result-->" + passwordResult && configResult)
        if(passwordResult && configResult){
            $(".findPassword_form").submit();
        }else{
            return;
        }
    })

    $("#emailCheckNumber").click(function () {
        $(".emailTip").text("")
    })
    $("#phoneCheckNumber").click(function () {
        $(".phoneTip").text("")
    })
    $("#checkCode").click(function () {
        $(this).parent().next().next("div").text("");
    })
    $("#condition").click(function () {
        $(".conditionTip").text("")
    })
    $("#emailCheckNumber").click(function () {
        $(".emailTip").text("")
    })
</script>
</html>

