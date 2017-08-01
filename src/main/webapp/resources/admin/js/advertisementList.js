/**
 * Created by i on 2017/7/30.
 */
function showPage(num){
    //1 修改隐藏域的值
    document.getElementById("pageNum").value = num;
    //2 提交表单
    $(".list_form").submit();
}

$("#showSize").change(function () {
    $(".list_form").submit();
})

$("#deleteByIds").click(function () {
    $(".delete_form").submit();
})

$("#cancelAll").hide()
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