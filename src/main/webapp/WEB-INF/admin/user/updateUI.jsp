<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/6/13
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加管理员</title>
    <%@ include file="../alcss.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
    <%@ include file="../aljs.jsp" %>
    <%--<script src="${pageContext.request.contextPath}/resources/js/update.js"></script>--%>
</head>
<body>
<div id="pageAll">
    <div class="pageTop">
        <div class="page">
            &nbsp;  &nbsp;账户管理&nbsp;-</span>&nbsp;
           修改资料
        </div>
    </div>
    <div class="col-md-12">
        <div class="widget-container">
            <div class="widget-content padded">
                <form action="${pageContext.request.contextPath}/admin/user/update" id="user-form" method="post" enctype="multipart/form-data">
                    <fieldset>
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <div class="hidden">
                                    <input name="id" type="hidden" value="${user.id}"/>
                                </div>
                                <div class="form-group">
                                    <label for="pictures">当前头像</label>
                                    <a href="${pageContext.request.contextPath}/resources/file/user/${user.photo}">
                                          <img id="photo" src="${pageContext.request.contextPath}/resources/file/user/${user.photo}" height="100" width="100">
                                    </a>
                                    <input type="file" name="pictures"  id="pictures" >
                                    <div class="photoTip">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="account">登录账户</label>
                                    <input class="form-control" id="account" name="account" type="text" value="${user.account}">
                                    <div class="tips">
                                    </div>
                                </div>
                                <input type="hidden" name="oldAccount" id="oldAccount" value="${user.account}">
                                <div class="form-group">
                                    <label for="name">姓名</label>
                                    <input class="form-control" id="name" name="name" type="text" value="${user.name}">
                                </div>
                                <div class="form-group">
                                    <label for="password">密码</label>
                                    <input class="form-control" id="password" name="password" type="password" >
                                </div>
                                <div class="form-group">
                                    <label for="confirm_password">确认密码</label>
                                    <input class="form-control" id="confirm_password" name="confirm_password" type="password">
                                </div>
                                <%--<div class="form-group">--%>
                                    <%--<label for="phoneNumber">手机号码</label>--%>
                                    <%--<input class="form-control" id="phoneNumber" name="phoneNumber" type="text" value="${user.phoneNumber}">--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label for="email">邮箱</label>--%>
                                    <%--<input class="form-control" id="email" name="email" type="email" value="${user.email}">--%>
                                <%--</div>--%>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-offset-5 col-md-2">
                            <input class="btn btn-primary " id="submit_" type="button" value="保存">
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("#user_page").addClass("current");
        $("#user-form").validate({
            rules: {
                name: "required",
                account: {
                    required: true,
                    minlength: 4
                },
//                phoneNumber: {
//                    minlength: 11,
//                    maxlength: 11,
//                    number: true
//                },
                password: {
                    required: true,
                    minlength: 6
                },
                confirm_password: {
                    required: true,
                    minlength: 6,
                    equalTo: "#password"
                },
//                email: {
//                    email: true
//                }
            },
            messages: {
                name: "请填写您的姓名",
                account: {
                    required: "请填写您的用户名",
                    minlength: "用户名长度不能小于4位"
                },
                password: {
                    required: "请填写密码",
                    minlength: "密码长度不能小于6位"
                },
                confirm_password: {
                    required: "请重复填写密码",
                    minlength: "密码长度不能小于6位",
                    equalTo: "两次密码不一致"
                },
//                phoneNumber: '请输入正确的手机号码',
//                email: "请填写正确的邮箱地址"
            }
        });
    });
</script>
<script type="text/javascript">
    var accountResult = true;
    $("#account").blur(function () {
        if($("#oldAccount").val() == $("#account").val()){
            $(".tips").text("");
            accountResult = true;
            return;
        }
        $.ajax({
            "url":"${pageContext.request.contextPath}/admin/user/checkRepeat",
            "data":{"account":$('#account').val()},
            "type":"POST",
            "success":function(data){
                if(data.result){
                    $(".tips").text("");
                    // $("#name").parent().next("div").css("color",'white');
                    accountResult = true;
                }else{
                    $(".tips").text("该用户名已被注册");
                    $(".tips").css("color",'red');
                    accountResult = false;
                }
            },
            "dataType":"json"
        });
    })

    $("#submit_").click(function () {
//        $("#user-form").submit()
        alert(accountResult)
        if(accountResult){
            $("#user-form").submit()
        }else{
            return;
        }
    })

    $("#pictures").change(function () {
        alert("session" )
        var option={
            //$.ajax({
            type:'POST',
            url:'${pageContext.request.contextPath }/admin/user/showPhoto',
            dataType:'json',
            //data:$('#regist_form').serialize(),
            success:function(data){
                alert("!!" + data.showResult)
                //把json格式的字符串转换成json对象
                //var jsonObj = $.parseJSON(data);
                //返回服务器图片路径，把图片路径设置给img标签
                if(!data.showResult){
                    $(".photoTip").text("头像只能是照片格式的文件");
                    $(".photoTip").css("color",'red');
                    return;
                }
                alert("data.showResult-->" + data.showResult )
                var path = "${pageContext.request.contextPath }/resources/file/user/"+data.showResult;
                alert("path" + path)
                $("#photo").attr("src",path);
            },
        };
        $("#user-form").ajaxSubmit(option);
    })
</script>

<script type="text/javascript">
    function showPhoto() {
        alert("showPhoto")
        var option={
            //$.ajax({
            type:'POST',
            url:'${pageContext.request.contextPath }/admin/user/showPhoto',
            dataType:'json',
            //data:$('#regist_form').serialize(),
            success:function(data){
                //把json格式的字符串转换成json对象
                //var jsonObj = $.parseJSON(data);
                //返回服务器图片路径，把图片路径设置给img标签
                alert("data.showreslut-->" + data.showresult )
                var path = "/project2/images/"+data.showresult;
                $("#photo").attr("src",path);
            }
        };
        //});
        $("#password").val(${sessionScope.loginUser.password})
        $("#configPassword").val(${sessionScope.loginUser.password})
        $("#user-form").ajaxSubmit(option);
//    })
    }
//    $("#photo").change(function () {

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