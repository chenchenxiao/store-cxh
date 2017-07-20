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
                <form action="${pageContext.request.contextPath}/admin/user/securityUpdate" id="updatePhone-form" method="post" enctype="multipart/form-data">
                    <fieldset>
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3" id="phone">
                                <div class="form-group"> </div>
                                <div class="form-group"> 请先进行短信校验</div>
                                <div class="form-group">
                                    <label for="checkCode">
                                        验证码： <input maxlength="20" class="form-control" id="checkCode" name="checkCode" type="text" placeholder="请输入验证码">
                                    </label>
                                    <button id="btn-phoneCheck" onclick="getCode()" type="button" style="width: 85px;height:46px;border: none;background:#f2f2f2;color:#333; padding:0">获取验证码</button>
                                    <div class="checkCodetip"></div>
                                </div>
                                <input type="hidden" id="oldPhoneNumber" value="${user.phoneNumber}"/>
                                <div class="form-group">
                                    <input class="btn btn-primary " id="submit_" type="button" value="确定">
                                </div>
                            </div>
                            <div class="col-md-6 col-md-offset-3" id="newPhone">
                                <div class="hidden">
                                    <input name="id" type="hidden" value="${user.id}"/>
                                </div>
                                <div class="form-group">
                                    <label for="newPhoneNumber">
                                        请输入新的手机号码：
                                        <input maxlength="20" class="form-control" id="newPhoneNumber" name="phoneNumber" type="text" placeholder="手机号码">
                                    </label>
                                    <div class="newPhoneTip"></div>
                                </div>
                                <div class="form-group">
                                    <label for="checkCode">
                                        验证码：
                                        <input maxlength="20" class="form-control" id="newCheckCode" name="newCheckCode" type="text" placeholder="请输入验证码">
                                    </label>
                                    <button id="btn-newPhone" type="button"  style="width: 85px;height:46px;border: none;background:#f2f2f2;color:#333; padding:0">获取验证码</button>
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
        $("#updatePhone-form").validate({
            rules: {
                newPhoneNumber: {
                    minlength: 11,
                    maxlength: 11,
                    number: true
                },
            },
            messages: {
                newPhoneNumber: '请输入正确的手机号码',
            }
        });

    })
</script>
<script type="text/javascript">
    $("#newPhone").hide()
    var checkResult;
    var phoneResult = false;
    var checkRepeatResult = false;
    function getcheckVal(result){
        checkResult = result;
    }
    function getCode() {
        $.ajax({
            "url":"${pageContext.request.contextPath}/admin/user/checkPhone",
            "data":{"phoneNumber":$('#oldPhoneNumber').val()},
            "type":"POST",
            "success":function(data){
                alert(data.result)
                // $("#RealCheckNumber").val(data.result)
                getcheckVal(data.result)
            },
            "dataType":"json"
        });
    }
    $("#btn-newPhone").click(function () {
        if($("#newPhoneNumber").val().length == 0){
            $(".newPhoneTip").text("请先输入手机号码");
            $(".newPhoneTip").css("color",'red');
            return;
        }
        $.ajax({
            "url":"${pageContext.request.contextPath}/admin/user/checkPhone",
            "data":{"phoneNumber":$('#newPhoneNumber').val()},
            "type":"POST",
            "success":function(data){
                alert(data.result)
                // $("#RealCheckNumber").val(data.result)
                getcheckVal(data.result)
            },
            "dataType":"json"
        });
    })

    $("#newPhoneNumber").blur(function () {
        if($(this).val().length==0){
            $(this).parent().next("div").text("");
            $(this).parent().next("div").css("color",'#ccc');
            phoneResult = false;
        }else if($(this).val().substr(0,3)!=138&&$(this).val().substr(0,3)!=189&&$(this).val().substr(0,3)!=139&&$(this).val().substr(0,3)!=158&&$(this).val().substr(0,3)!=188&&$(this).val().substr(0,3)!=157&&$(this).val().substr(0,3)!=134||$(this).val().length!=11){
            $(this).parent().next("div").text("手机号格式不正确");
            $(this).parent().next("div").css("color",'red');
            phoneResult = false;
        }else{
            $.ajax({
                "url":"${pageContext.request.contextPath}/admin/user/checkRepeat",
                "data":{"phoneNumber":$('#newPhoneNumber').val()},
                "type":"POST",
                "success":function(data){
                    if(data.result){
                        $(".newPhoneTip").text("");
                        // $("#name").parent().next("div").css("color",'white');
                        phoneResult = true;
                        checkRepeatResult = true;
                        return;
                    }else{
                        $(".newPhoneTip").text("该手机号已被注册");
                        $(".newPhoneTip").css("color",'red');
                        phoneResult = false;
                        checkRepeatResult = false;
                        return;
                    }
                },
                "dataType":"json"
            });
        }
    })
    $("#submit_").click(function () {
        if($("#checkCode").val() != checkResult){
            $(".checkCodetip").text("验证码不正确或已超时，请重新获取");
            $(".checkCodetip").css("color",'red');
            return;
        }
        else{
            $("#phone").hide()
            $("#newPhone").show()
        }
    })

    $("#newSubmit").click(function () {
        if($("#newPhoneNumber").val().length == 0){
            $(".newPhoneTip").text("请输入手机号码");
            $(".newPhoneTip ").css("color",'red');
            return;
        }
        if($("#newCheckCode").val() != checkResult){
            $(".newCheckCodeTip").text("验证码不正确或已超时，请重新获取");
            $(".newCheckCodeTip").css("color",'red');
            return;
        }
        if(!checkRepeatResult){
            $(".newPhoneTip").text("该手机号已被注册");
            $(".newPhoneTip").css("color",'red');
            return;
        }
        if(phoneResult){
            $("#updatePhone-form").submit()
        }

    })

    $("#newCheckCode").click(function () {
        $(".newCheckCodeTip").text("");
    })
    $("#checkCode").click(function () {
        $(".checkCodetip").text("");
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