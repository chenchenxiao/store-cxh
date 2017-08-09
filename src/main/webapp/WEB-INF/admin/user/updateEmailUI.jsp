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
    <title>安全设置</title>
    <%@ include file="../alcss.jsp" %>
    <%@ include file="../aljs.jsp" %>
    <%--<script src="${pageContext.request.contextPath}/resources/js/update.js"></script>--%>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
</head>
<body>
<div id="pageAll">
    <div class="pageTop">
        <div class="page">
            &nbsp;  &nbsp;账户管理&nbsp;-</span>&nbsp;
            安全设置
        </div>
    </div>
    <div class="col-md-12">
        <div class="widget-container">
            <div class="widget-content padded">
                <form action="${pageContext.request.contextPath}/admin/user/securityUpdate" id="updateEmail-form" method="post" enctype="multipart/form-data">
                    <fieldset>
                        <c:if test="${user.email != null}">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3" id="old">
                                    <div class="form-group"> </div>
                                    <div class="form-group"> 请先进行邮箱校验</div>
                                    <div class="form-group">
                                        <label for="checkCode">
                                            验证码： <input maxlength="20" class="form-control" id="checkCode" name="checkCode" type="text" placeholder="请输入验证码">
                                        </label>
                                        <button id="btn-oldEmail" onclick="getCode()" type="button" style="width: 85px;height:46px;border: none;background:#f2f2f2;color:#333; padding:0">获取验证码</button>
                                        <div class="oldEmailTip"></div>
                                    </div>
                                    <input type="hidden" name="oldEmail" id="oldEmail" value="${user.email}"/>
                                    <div class="form-group">
                                        <input class="btn btn-primary " id="submit_" type="button" value="确定">
                                    </div>
                                </div>
                        </c:if>

                            <div class="col-md-6 col-md-offset-3" id="new">
                                <div class="hidden">
                                    <input name="id" type="hidden" value="${user.id}"/>
                                </div>
                                <div class="form-group">
                                    <label for="newEmail">
                                        请输入邮箱：
                                        <input maxlength="20" class="form-control" id="newEmail" name="email" type="text" placeholder="邮箱">
                                    </label>
                                    <div class="newEmailTip"></div>
                                </div>
                                <div class="form-group">
                                    <label for="newCheckCode">
                                        验证码：
                                        <input maxlength="20" class="form-control" id="newCheckCode" name="newCheckCode" type="text" placeholder="请输入验证码">
                                    </label>
                                    <button id="btn-newEmail" type="button"  style="width: 85px;height:46px;border: none;background:#f2f2f2;color:#333; padding:0">获取验证码</button>
                                    <div class="newCheckCodeTip"></div>
                                </div>
                                <div class="form-group">
                                    <input class="btn btn-primary " id="newSubmit" type="button" value="修改">
                                </div>
                            </div>
                        </div>
                        <br>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $("#updateEmail-form").validate({
            rules: {
                email: {
                    email: true
                }
            },
            messages: {
                email: "请填写正确的邮箱地址"
            }
        });
    })
</script>

<c:if test="${user.email != null}">
    <script type="text/javascript">
        $("#new").hide()
    </script>
</c:if>

<script type="text/javascript">
    var checkResult;
    var emailResult = false;
    function getcheckVal(result){
        checkResult = result;
    }
    alert("成功发送信息！")
    $("#btn-oldEmail").click(function () {
        $.ajax({
            "url":"${pageContext.request.contextPath}/admin/user/checkEmail",
            "data":{"email":$('#oldEmail').val()},
            "type":"POST",
            "success":function(data){
                // $("#RealCheckNumber").val(data.result)
                getcheckVal(data.result)
            },
            "dataType":"json"
        });
    })

    $("#submit_").click(function () {
        if($("#checkCode").val().length == 0){
            $(".oldEmailTip").text("请填写验证码");
            $(".oldEmailTip").css("color",'red');
            return;
        }
        if($("#checkCode").val() != checkResult){
            $(".oldEmailTip").text("验证码不正确或已超时，请重新获取");
            $(".oldEmailTip").css("color",'red');
            return;
        }
        else{
            $("#old").hide()
            $("#new").show()
        }
    })
    $("#btn-newEmail").click(function () {
        if($("#newEmail").val().length == 0){
            $(".newEmailTip").text("请先输入邮箱号码");
            $(".newEmailTip").css("color",'red');
            return;
        }
        if(!emailResult){
            alert("请输入正确的邮箱号")
            return;
        }
        alert("成功发送信息！")
        $.ajax({
            "url":"${pageContext.request.contextPath}/admin/user/checkEmail",
            "data":{"email":$('#newEmail').val()},
            "type":"POST",
            "success":function(data){
                // $("#RealCheckNumber").val(data.result)
                getcheckVal(data.result)
            },
            "dataType":"json"
        });
    });
    $("#newEmail").blur(function () {
        if($("#newEmail").val().length == 0){
            return;
        }
        $(".newEmailTip").text("");
            $.ajax({
                "url":"${pageContext.request.contextPath}/admin/user/checkRepeat",
                "data":{"email":$('#newEmail').val()},
                "type":"POST",
                "success":function(data){
                    if(data.success){
                        $(".newEmailTip").text("");
                        // $("#name").parent().next("div").css("color",'white');
                        emailResult = true;
                        return;
                    }else{
                        $(".newEmailTip").text(data.msg);
                        $(".newEmailTip").css("color",'red');
                        emailResult = false;
                        return;
                    }
                },
                "dataType":"json"
            });

    })
    $("#newSubmit").click(function () {

        if($("#newEmail").val().length == 0){
            $(".newEmailTip").text("请先输入邮箱号码");
            $(".newEmailTip ").css("color",'red');
            return;
        }
        if($("#newCheckCode").val() != checkResult){
            $(".newCheckCodeTip").text("验证码不正确或已超时，请重新获取");
            $(".newCheckCodeTip").css("color",'red');
            return;
        }
        if(!emailResult){
            $(".newEmailTip").text("该邮箱已被注册");
            $(".newEmailTip ").css("color",'red');
            return;
        }else{
            $("#updateEmail-form").submit();
        }
    })

    $("#newEmail").click(function () {
        $(".newEmailTip").text("");
    })
    $("#checkCode").click(function () {
        $(".oldEmailTip").text("");
    })
    $("#newCheckCode").click(function () {
        $(".newCheckCodeTip").text("");
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