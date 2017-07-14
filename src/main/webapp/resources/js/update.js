$(function(){
    var checkResult;
    var numberResult;
    function getcheckVal(result){
        checkResult = result;
    }
    $("#btn-phoneCheck").click(function(){
        var result;
        alert("成功发送信息")
        $.ajax({
            "url":"admin/user/checkPhone",
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

    $("#checkNumber").blur(function () {
        if($(this).val() != checkResult){
            $(".check").text("验证码不正确或已超时，请重新获取");
            $(".check").css("color",'red');
            numberResult = false;
        }else{
            $(".check").text("");
            numberResult = true;
        }

    })
})
