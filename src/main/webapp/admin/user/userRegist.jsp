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
<script type="text/javascript">
    $(function(){
        var stuList = getStuList();//设置传送信息：学生的集合
        var checkResult;
        var accountResult;
        var passwordResult;
        var configResult;
        var phoneResult = false;
        var codeResult;
        var numberResult;
        var nameResult;
        //聚焦失焦input
        $("#account").eq(0).focus(function(){
            if($(this).val().length==0){
                $(this).parent().next("div").text("支持中文，字母，数字，'-'，'_'的多种组合");
            }
        })
        $("#name").focus(function(){
            if($(this).val().length==0){
                $(this).parent().next("div").text("支持中文，英文的组合");
            }
        })
        $("#password").focus(function(){
            if($(this).val().length==0){
                $(this).parent().next("div").text("建议使用字母、数字和符号两种以上的组合，6-20个字符");
            }
        })
        $("#configPassword").focus(function(){
            if($(this).val().length==0){
                $(this).parent().next("div").text("请再次输入密码");
            }
        })
        $("#phoneNumber").focus(function(){
            if($(this).val().length==0){
                $(this).parent().next("div").text("验证完后，你可以使用该手机登陆和找回密码");
            }
        })
        $("#checkCode").focus(function(){
            if($(this).val().length==0){
                $(this).parent().next().next("div").text("看不清？点击图片更换验证码");
            }
        })
        //input各种判断
        //用户名：
        $("#account").blur(function(){
            if($(this).val().length==0){
                $(this).parent().next("div").text("");
                $(this).parent().next("div").css("color",'#ccc');
                accountResult = false;
            }else if($(this).val().length>0 && $(this).val().length<4){
                $(this).parent().next("div").text("长度只能在4-20个字符之间");
                $(this).parent().next("div").css("color",'red');
                accountResult = false;
            }else if($(this).val().length>=4&& !isNaN($(this).val())){
                $(this).parent().next("div").text("用户名不能为纯数字");
                $(this).parent().next("div").css("color",'red');
                accountResult = false;
            }else{
                $.ajax({
                    "url":"${pageContext.request.contextPath}/admin/user/checkRepeat",
                    "data":{"account":$('#account').val()},
                    "type":"POST",
                    "success":function(data){
                        if(data.success){
                            $("#account").parent().next("div").text("");
                            // $("#name").parent().next("div").css("color",'white');
                            accountResult = true;
                            return;
                        }else{
                            $("#account").parent().next("div").text(data.msg);
                            $("#account").parent().next("div").css("color",'red');
                            accountResult = false;
                            return;
                        }
                    },
                    "dataType":"json"
                });
            }
        })
        //姓名
        $("#name").blur(function () {
            if($(this).val().length==0){
                $(this).parent().next("div").text("");
                $(this).parent().next("div").css("color",'#ccc');
                nameResult = false;
            }else if(!/^[\u4e00-\u9fa5]+$/.test($(this).val())||$(this).val().length < 2){
                $(this).parent().next("div").text("姓名只能是2个以上的中文字符");
                $(this).parent().next("div").css("color",'red');
                nameResult = false;
            }else{
                $(this).parent().next("div").text("");
                nameResult = true;
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
//	手机号
        $("#phoneNumber").blur(function(){
            if($(this).val().length==0){
                $(this).parent().next("div").text("");
                $(this).parent().next("div").css("color",'#ccc');
                phoneResult = false;
            }else if($(this).val().substr(0,3)!=138&&$(this).val().substr(0,3)!=177&&$(this).val().substr(0,3)!=189&&$(this).val().substr(0,3)!=139&&$(this).val().substr(0,3)!=158&&$(this).val().substr(0,3)!=188&&$(this).val().substr(0,3)!=157&&$(this).val().substr(0,3)!=134||$(this).val().length!=11){
                $(this).parent().next("div").text("手机号格式不正确");
                $(this).parent().next("div").css("color",'red');
                phoneResult = false;
            }else{
                $.ajax({
                    "url":"${pageContext.request.contextPath}/admin/user/checkRepeat",
                    "data":{"phoneNumber":$('#phoneNumber').val()},
                    "type":"POST",
                    "success":function(data){
                        if(data.success){
                            $("#phoneNumber").parent().next("div").text("");
                            // $("#name").parent().next("div").css("color",'white');
                            phoneResult = true;
                            return;
                        }else{
                            $("#phoneNumber").parent().next("div").text(data.msg);
                            $("#phoneNumber").parent().next("div").css("color",'red');
                            phoneResult = false;
                            return;
                        }
                    },
                    "dataType":"json"
                });
            }
        })
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
        function getcheckVal(result){
            checkResult = result;
        }

        // $("#checkNumber").blur(function () {
        //     if($(this).val() != checkResult){
        //         $(".check").text("验证码不正确或已超时，请重新获取");
        //         $(".check").css("color",'red');
        //         numberResult = false;
        //     }else{
        //          $(".check").text("");
        //         numberResult = true;
        // }

        // })

//  获取手机验证码
        $("#btn-phoneCheck").click(function(){
            // var countdown = 60;
            // setTimeout(function() {
            //         alert("!!!!!");
            //         $("#btn-phoneCheck").text("重新发送(" + countdown + ")");
            //         countdown--;  }
            //     ,1000)
// //        function checkPhone(){
//         time();
            var result;
            if(!phoneResult){
               alert("请输入正确的手机号码")
                return;
            }
            $.ajax({
                "url":"${pageContext.request.contextPath}/admin/user/checkPhone",
                "data":{"phoneNumber":$('#phoneNumber').val()},
                "type":"POST",
                "success":function(data){
                    // if(data.result.eq($("#checkNumber").val())){
                    //     $("#checkNumber").parent().next("div").text("输入正确");
                    //     $("#checkNumber").parent().next("div").css("color",'green');
                    //     result = true;
                    //     // return;
                    // }else{
                    //
                    //     $("#checkNumber").parent().next("div").text("验证码不正确或已过期，请重新获取");
                    //     $("#checkNumber").parent().next("div").css("color",'red');
                    //     result = false;
                    //     // return;
                    // }
                    alert(data.result)
                    // $("#RealCheckNumber").val(data.result)
                    getcheckVal(data.result)
                },
                "dataType":"json"
            });
            // }
        })
//	提交按钮
        $("#submit_btn").click(function(e){
            alert(!(accountResult && passwordResult && configResult && phoneResult && codeResult && numberResult))
            for(var j=0 ;j<6;j++){
                if($('input').eq(j).val().length==0){
                    $('input').eq(j).focus();
                    if(j==4){
                        $('input').eq(j).parent().next().next("div").text("此处不能为空");
                        $('input').eq(j).parent().next().next("div").css("color",'red');
                        e.preventDefault();
                        return;
                    }
                    $('input').eq(j).parent().next(".tips").text("此处不能为空");
                    $('input').eq(j).parent().next(".tips").css("color",'red');
                    e.preventDefault();
                    return;
                }
            }
            if($("#checkNumber").val().length==0){
                $('.check').text("此处不能为空");
                $('.check').css("color",'red');
                return;
            }
            // 验证码输入不正确
            if($("#checkCode").val().toUpperCase()!=$("#code").text().toUpperCase()){
                return;
            }
            if($("#checkNumber").val() != checkResult){
                $(".check").text("验证码不正确或已超时，请重新获取");
                $(".check").css("color",'red');
                return;
            }else{
                $(".check").css("color",'red');
            }
            // //手机验证码输入不正确
            // if(checkResult != $("#checkNumber").val()){
            //         $(".check").text("验证码不正确或已超时，请重新获取");
            //         $(".check").css("color",'red');
            //     return;
            // }
            if(!(accountResult && passwordResult && configResult && phoneResult && codeResult && nameResult)){
                return;
            }
            // stuList.push(new Student($('input').eq(0).val(),$('input').eq(1).val(),$('input').eq(3).val(),stuList.length+1));
            // localStorage.setItem('stuList',JSON.stringify(stuList));
            // alert("注册成功");
            // window.open("userlist.html","_blank");
            else{
                $(".add_form").submit();
            }

        })

//  建立构造函数，构造学生信息模板
        function Student(name,password,tel,id){
            this.name = name;
            this.password = password;
            this.tel = tel;
            this.id = id;
        }
//	获取之前所有已经注册的用户集合
        function getStuList(){
            var list = localStorage.getItem('stuList');
            if(list != null){
                return JSON.parse(list);
            }else{
                return new Array();
            }
        }

    })


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

