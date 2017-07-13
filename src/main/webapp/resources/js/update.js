$(function(){
    var accountResult;
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
        alert(accountResult)
        if(accountResult){
            $("#user-form").submit()
        }else{
            return;
        }
    })
})
