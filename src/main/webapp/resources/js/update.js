$(function(){
    var accountResult = true;
    var numberResult = true;
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
    if($("#checkCode").val().length == 0){
        numberResult == false;
    }
    $("#submit_").click(function () {
        alert(accountResult)
        if(accountResult && numberResult){
            if($("#checkCode").val() != checkResult){
                $(".tip").text("验证码不正确或已超时，请重新获取");
                $(".tip").css("color",'red');
                return;
            }
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
                $(".photoTip").text("");
                $("#photo").attr("src",path);
            },
        };
        $("#user-form").ajaxSubmit(option);
    })

    var checkResult;
    var numberResult;
    function getcheckVal(result){
        checkResult = result;
    }
    $("#btn-phoneCheck").click(function(){
        var result;
        alert("成功发送信息")
        $.ajax({
            "url":"${pageContext.request.contextPath}/admin/user/checkPhone",
            "data":{"phoneNumber":$('#phoneNumber').val()},
            "type":"POST",
            "success":function(data){
                alert(data.result)
                // $("#RealCheckNumber").val(data.result)
                getcheckVal(data.result)
            },
            "dataType":"json"
        });
        // }
    })

//    $("#checkCode").blur(function () {
//        if($(this).val() != checkResult){
//            $(".check").text("???测试测试");
//            $(".check").css("color",'red');
//            numberResult = false;
//        }else{
//            $(".check").text("");
//            numberResult = true;
//        }
//
//    })
})
