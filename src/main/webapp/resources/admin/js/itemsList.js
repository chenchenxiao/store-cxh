/**
 * Created by i on 2017/7/30.
 */
// 广告弹出框
$(".delban").click(function(){
    $(".banDel").show();
});
$(".close").click(function(){
    $(".banDel").hide();
});
$(".no").click(function(){
    $(".banDel").hide();
});
// 广告弹出框 end

var checkResult = true;
$("#cancelAll").hide()
function showPage(num){
    //1 修改隐藏域的值
    document.getElementById("pageNum").value = num;
    //2 提交表单
    $(".list_form").submit();
}

$("#showSize").change(function () {
    $(".list_form").submit();
})

$("#checkAll").click(function () {
    $('input:checkbox').each(function() {
        $(this).prop('checked', true);
    });
    $("#cancelAll").show()
    $(this).hide()
})

$("#cancelAll").click(function () {
    $('input:checkbox').each(function() {
        $(this).prop('checked', false);
    });
    $("#checkAll").show()
    $(this).hide()
})
$("#deleteByIds").click(function () {
    var val = $("input:checkbox[name='ids']:checked").length > 0;
    if(!val) {
        $(".expTip").text("请选择要导出的商品信息");
        $(".expTip").css("color", 'red');
        return;
    }
    $(".deleteIds_form").submit();
})
function deleteById(){
    var itemsId = $("#itemId").val();
    $("#realId").val(itemsId)
    $("#deleteOne_form").submit();
}

$("#preDate").blur(function () {
    if($(this).val().length > 0){
        $(".list_form").submit();
    }
})
$("#lastDate").blur(function () {
    if($(this).val().length > 0){
        $(".list_form").submit();
    }
})
var expResult = false;


