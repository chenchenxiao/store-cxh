$(function(){
    var stuList = getStuList();//设置传送信息：学生的集合
    var checkResult;
    var nameResult;
    var passwordResult;
    var configResult;
    var phoneResult;
    var codeResult;
    var numberResult;
    //聚焦失焦input
    $('input').eq(0).focus(function(){
        if($(this).val().length==0){
            $(this).parent().next("div").text("支持中文，字母，数字，'-'，'_'的多种组合");
        }
    })
    $('input').eq(1).focus(function(){
        if($(this).val().length==0){
            $(this).parent().next("div").text("建议使用字母、数字和符号两种以上的组合，6-20个字符");
        }
    })
    $('input').eq(2).focus(function(){
        if($(this).val().length==0){
            $(this).parent().next("div").text("请再次输入密码");
        }
    })
    $('input').eq(3).focus(function(){
        if($(this).val().length==0){
            $(this).parent().next("div").text("验证完后，你可以使用该手机登陆和找回密码");
        }
    })
    $('input').eq(4).focus(function(){
        if($(this).val().length==0){
            $(this).parent().next().next("div").text("看不清？点击图片更换验证码");
        }
    })
    //input各种判断
    //用户名：
    $('input').eq(0).blur(function(){
        if($(this).val().length==0){
            $(this).parent().next("div").text("");
            $(this).parent().next("div").css("color",'#ccc');
            nameResult = false;
        }else if($(this).val().length>0 && $(this).val().length<4){
            $(this).parent().next("div").text("长度只能在4-20个字符之间");
            $(this).parent().next("div").css("color",'red');
            nameResult = false;
        }else if($(this).val().length>=4&& !isNaN($(this).val())){
            $(this).parent().next("div").text("用户名不能为纯数字");
            $(this).parent().next("div").css("color",'red');
            nameResult = false;
        }else{
            // for(var m=0;m<stuList.length;m++){
            //     if($(this).val()==stuList[m].name){
            //         $(this).parent().next("div").text("该用户名已被注册");
            //         $(this).parent().next("div").css("color",'red');
            //         return;
            //     }
            // }
            // $(this).parent().next("div").text("");
            $.ajax({
                "url":"admin/user/checkRepeat",
                "data":{"name":$('#name').val()},
                "type":"POST",
                "success":function(data){
                    if(data.result){
                        $("#name").parent().next("div").text("");
                        // $("#name").parent().next("div").css("color",'white');
                        nameResult = true;
                        return;
                    }else{
                        $("#name").parent().next("div").text("该用户名已被注册");
                        $("#name").parent().next("div").css("color",'red');
                        nameResult = false;
                        return;
                    }
                },
                "dataType":"json"
            });
        }
    })
    //ajax验证用户名是否可用
    // $("#username").change(function () {
    //     $.ajax({
    //         "url":"${pageContext.request.contextPath }/admin/user/checkName",
    //         "data":{"username":$('#username').val()},
    //         "type":"POST",
    //         "success":function(data){
    //             if(data.result){
    //                 $(this).parent().next("div").text("该用户名已被注册");
    //                 $(this).parent().next("div").css("color",'red');
    //                 return;
    //             }else if(data.result==2&&$('#username').val().length>6){
    //                 $(this).parent().next("div").text("该用户名可用使用");
    //                 $(this).parent().next("div").css("color",'red');
    //                 return;
    //             }
    //         },
    //         "dataType":"json"
    //     });
    // })
    //密码
    $('input').eq(1).blur(function(){
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
    $('input').eq(2).blur(function(){
        if($(this).val().length==0){
            $(this).parent().next("div").text("");
            $(this).parent().next("div").css("color",'#ccc');
            configResult = false;
        }else if($(this).val()!=$('input').eq(1).val()){
            $(this).parent().next("div").text("两次密码不匹配");
            $(this).parent().next("div").css("color",'red');
            configResult = false;
        }else{
            $(this).parent().next("div").text("");
            configResult = true;
        }
    })
//	手机号
    $('input').eq(3).blur(function(){
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
                "url":"admin/user/checkRepeat",
                "data":{"phoneNumber":$('#phoneNumber').val()},
                "type":"POST",
                "success":function(data){
                    if(data.result){
                        $("#phoneNumber").parent().next("div").text("");
                        // $("#name").parent().next("div").css("color",'white');
                        phoneResult = true;
                        return;
                    }else{
                        $("#phoneNumber").parent().next("div").text("该手机号已被注册");
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
    $('input').eq(4).blur(function(){
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

//  获取手机验证码
    $("#btn-phoneCheck").click(function(){
//        function checkPhone(){
        var result;
        alert("成功发送信息")
        $.ajax({
            "url":"admin/user/checkPhone",
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
        for(var j=0 ;j<5;j++){
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
        if($('input').eq(4).val().toUpperCase()!=$("#code").text().toUpperCase()){
            return;
        }
        // //手机验证码输入不正确
        // if(checkResult != $("#checkNumber").val()){
        //         $(".check").text("验证码不正确或已超时，请重新获取");
        //         $(".check").css("color",'red');
        //     return;
        // }
        if(!(nameResult && passwordResult && configResult && phoneResult && codeResult && numberResult)){
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

