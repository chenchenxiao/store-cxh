/**
 * Created by i on 2017/7/30.
 */
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

    function getcheckVal(result) {
        checkResult = result;
    }

// 	验证码
//	 验证码刷新
    function code() {
        var str = "qwertyuiopasdfghjklzxcvbnm1234567890QWERTYUIOPLKJHGFDSAZXCVBNM";
        var str1 = 0;
        for (var i = 0; i < 4; i++) {
            str1 += str.charAt(Math.floor(Math.random() * 62))
        }
        str1 = str1.substring(1)
        $("#code").text(str1);
    }

    code();
    $("#code").click(code);
//	验证码验证
    $("#checkCode").blur(function () {
        if ($(this).val().length == 0) {
            $(this).parent().next().next("div").text("");
            $(this).parent().next().next("div").css("color", '#ccc');
            codeResult = false;
        } else if ($(this).val().toUpperCase() != $("#code").text().toUpperCase()) {
            $(this).parent().next().next("div").text("验证码不正确");
            $(this).parent().next().next("div").css("color", 'red');
            codeResult = false;
        } else {
            $(this).parent().next().next("div").text("");
            codeResult = true;
        }
    })

    // $("#findPassword_btn").click(function () {
    //     if ($("#condition").val().length == 0) {
    //         $(".conditionTip").text("请输入登录名")
    //         $(".conditionTip").css("color", 'red');
    //         return;
    //     }
    //     $.ajax({
    //         "url": "${pageContext.request.contextPath}/admin/user/checkUser",
    //         "data": {"condition": $('#condition').val()},
    //         "type": "POST",
    //         "success": function (data) {
    //             if (data.result == false) {
    //                 alert("false")
    //                 $(".conditionTip").text("该账户不存在，请重新输入 ")
    //                 $(".conditionTip").css("color", 'red');
    //                 conditionResult = false;
    //                 return;
    //             } else {
    //                 $("#email").val(data.email)
    //                 $("#phoneNumber").val(data.phoneNumber)
    //                 $("#id").val(data.id)
    //                 $(".conditionTip").text("")
    //                 conditionResult = true;
    //             }
    //
    //         },
    //         "dataType": "json"
    //     })
    //     if (conditionResult && codeResult) {
    //         $(".check").hide()
    //         $(".findWay").show()
    //     }
    // })

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

    // $("#btn-emailCheck").click(function () {
    //     $.ajax({
    //         "url": "${pageContext.request.contextPath}/admin/user/checkEmail",
    //         "data": {"email": $('#email').val()},
    //         "type": "POST",
    //         "success": function (data) {
    //             alert("checkEmail--》" + data.result)
    //             // $("#RealCheckNumber").val(data.result)
    //             getcheckVal(data.result)
    //         },
    //         "dataType": "json"
    //     });
    // })

    $("#email_btn").click(function () {
        if ($("#emailCheckNumber").val().length == 0) {
            $(".emailTip").text("请输入验证码");
            $(".emailTip").css("color", 'red');
            return;
        }
        if (checkResult != $("#emailCheckNumber").val()) {
            $(".emailTip").text("验证码不正确或已超时，请重新获取");
            $(".emailTip").css("color", 'red');
            return;
        } else {
            $("#emailWay").hide()
            $(".updatePassword").show()
        }
    })
    // $("#btn-phoneCheck").click(function () {
    //     $.ajax({
    //         "url": "${pageContext.request.contextPath}/admin/user/checkPhone",
    //         "data": {"phoneNumber": $('#phoneNumber').val()},
    //         "type": "POST",
    //         "success": function (data) {
    //             alert("checkPhone-->" + data.result)
    //             // $("#RealCheckNumber").val(data.result)
    //             getcheckVal(data.result)
    //         },
    //         "dataType": "json"
    //     });
    // })

    $("#phone_btn").click(function () {
        if ($("#phoneCheckNumber").val().length == 0) {
            $(".phoneTip").text("请输入验证码");
            $(".phoneTip").css("color", 'red');
            return;
        }
        if (checkResult != $("#phoneCheckNumber").val()) {
            $(".phoneTip").text("验证码不正确或已超时，请重新获取");
            $(".phoneTip").css("color", 'red');
            return;
        } else {
            $("#phoneWay").hide()
            $(".updatePassword").show()
        }
    })
//密码
    $("#password").blur(function () {
        if ($(this).val().length == 0) {
            $(this).parent().next("div").text("");
            $(this).parent().next("div").css("color", '#ccc');
            passwordResult = false;
        } else if ($(this).val().length > 0 && $(this).val().length < 6) {
            $(this).parent().next("div").text("长度只能在6-20个字符之间");
            $(this).parent().next("div").css("color", 'red');
            passwordResult = false;
        } else {
            $(this).parent().next("div").text("");
            passwordResult = true;
        }
    })
//	确认密码
    $("#configPassword").blur(function () {
        if ($(this).val().length == 0) {
            $(this).parent().next("div").text("");
            $(this).parent().next("div").css("color", '#ccc');
            configResult = false;
        } else if ($(this).val() != $("#password").val()) {
            $(this).parent().next("div").text("两次密码不匹配");
            $(this).parent().next("div").css("color", 'red');
            configResult = false;
        } else {
            $(this).parent().next("div").text("");
            configResult = true;
        }
    })
    $("#updatePassword_btn").click(function () {
//        alert("result-->" + passwordResult && configResult)
        if (passwordResult && configResult) {
            $(".findPassword_form").submit();
        } else {
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
