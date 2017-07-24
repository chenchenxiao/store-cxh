<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/6/13
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css.css" />
    <title>我的商品</title>
    <%@ include file="../alcss.jsp" %>
    <link href="${pageContext.request.contextPath}/resources/css/messenger/messenger-theme-air.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/manhuaDate.1.0.css" type="text/css" />
    <%@ include file="../aljs.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
    <!-- <script type="text/javascript" src="js/page.js" ></script> -->

</head>

<body>
<div id="pageAll">
    <div class="pageTop">
        <div class="page">
            <img src="${pageContext.request.contextPath}/resources/img/coin02.png" />
            <span><a href="show.jsp">首页</a>&nbsp;-&nbsp;-</span>&nbsp;我的商品
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/admin/items/deleteOne" method="post" id="deleteOne_form">
        <input type="hidden" id="realId" name="id">
    </form>
    <div class="page">
        <!-- user页面样式 -->
        <div class="connoisseur">
            <div class="conform">
                <form action="${pageContext.request.contextPath}/admin/items/itemsList" class="list_form" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="pageNum" name="page" value="1">
                    <input type="hidden" name="uid" value="${sessionScope.loginUser.id}"/>
                    <div class="cfD">
                        <a class="btn btn-sm btn-primary-outline pull-right" href="${pageContext.request.contextPath}/admin/items/saveUI" >
                            <i class="icon-plus"></i>添加
                        </a>
                        <a href="javascript:void(0)" class="checkbox-row btn btn-sm btn-primary-outline pull-right" id="excelImport">导入</a>
                        <input type="file" id="itemsFile" name="itemsFile" class=" checkbox-rowbtn btn-sm btn-primary-outline pull-right"/>
                    </div>
                    <div>
                        时间段：
                        <input name="preDate" value="${preDate}" class="vinput mh_date" id="preDate" type="text"  style="width: 150 px;height: 20px;line-height: 20px;border:2px #AA9FFF solid;cursor:pointer " />
                        <img onclick="WdatePicker({el:'preDate'})" src="${pageContext.request.contextPath}/resources/My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle">&nbsp;&nbsp;至 &nbsp;&nbsp;
                        <input  name="lastDate" value="${lastDate}" class="vinput mh_date" id="lastDate"  type="text"  style="width: 150 px;height: 20px;line-height: 20px;border:2px #AA9FFF solid;cursor:pointer " />
                        <img onclick="WdatePicker({el:'lastDate'})" src="${pageContext.request.contextPath}/resources/My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle">

                    </div>
                    <div>
                        显示<select name="size" id="showSize">
                        <option value="8" <c:if test="${PageBean.size == 8}" >selected = selected</c:if>>8</option>
                        <option value="10"  <c:if test="${PageBean.size == 10}" >selected = selected</c:if>>10</option>
                        <option value="15"  <c:if test="${PageBean.size == 15}" >selected = selected</c:if>>15</option>
                        <option value="20"  <c:if test="${PageBean.size == 20}" >selected = selected</c:if>>20</option>
                    </select>条
                    </div>
                    <div id="checkTip" class="pull-right" style="margin-right:180px"></div>
                </form>
            </div>
            <!-- user 表格 显示 -->
            <form action="${pageContext.request.contextPath}/admin/items/deleteByIds" method="post" class="deleteIds_form">
                <div class="conShow">
                    <table border="1" cellspacing="0" cellpadding="0">
                        <tr>

                            <td width="150px" class="tdColor tdC">商品名称</td>
                            <td width="130px" class="tdColor">商品价格</td>
                            <td width="130px" class="tdColor">商品库存量</td>
                            <td width="130px" class="tdColor">商品类型</td>
                            <td width="200px" class="tdColor">添加时间</td>
                            <td width="200px" class="tdColor">修改时间</td>
                            <td width="200px" class="tdColor">商品标题</td>
                            <td width="100" class="tdColor">操作</td>
                        </tr>
                            <c:if test="${PageBean.recordList[0] == null}">
                                <h3>你还没有添加商品</h3>
                            </c:if>

                        <c:forEach items="${PageBean.recordList}" var="item" varStatus="status">
                            <input type="hidden" value="${item.id}" id="itemId">
                            <tr height="40px">
                                <td>
                                    <label>
                                        <input  name="ids" id="checkBox" type="checkbox" value="${item.id}" ><span></span>
                                    </label>
                                    ${item.name}
                                </td>
                                <td>${item.price}</td>
                                <td>${item.number}</td>
                                <td>${item.type}</td>
                                <td>
                                    <fmt:formatDate
                                        type="date"
                                        value="${item.addDate}"
                                        dateStyle="default"/>
                                </td>
                                <td><fmt:formatDate
                                        type="date"
                                        value="${item.updateDate}"
                                        dateStyle="default"/>
                                </td>
                                <td>${item.title}</td>
                                <td><a href="${pageContext.request.contextPath}/admin/items/updateUI/${item.id}">
                                        <img class="operation" src="${pageContext.request.contextPath}/resources/img/update.png">
                                    </a>
                                    <img class="operation delban"   src="${pageContext.request.contextPath}/resources/img/delete.png">
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="btn-toolbar" role="toolbar">
                        <a href="javascript:void(0)" class="checkbox-row btn btn-sm btn-primary-outline pull-left" id="cancelAll" name="checkAll">全不选</a>
                        <a href="javascript:void(0)" class="checkbox-row btn btn-sm btn-primary-outline pull-left" id="checkAll" name="checkAll">全选</a>
                        <a href="javascript:void(0)" class="checkbox-row btn btn-sm btn-primary-outline pull-left" id="deleteByIds">删除</a>
                        <a href="javascript:void(0)" class="checkbox-row btn btn-sm btn-primary-outline pull-left" id="excelExport">导出</a>
                    </div>
                    <div class="expTip"></div>
                    <!--分页 -->
                    <div class="paging">
                    <span>
                        <c:if test="${PageBean.page > 1}">
                            <a href="javascript:void(0)" onclick="showPage(1)">[首页]</a>&nbsp;&nbsp;
                            <a href="javascript:void(0)" onclick="showPage(${PageBean.page - 1})">[上一页]</a>&nbsp;&nbsp;
                        </c:if>
                    <%--动态显示条 --%>
                        <c:forEach begin = "${PageBean.beginPageIndex}" end = "${PageBean.endPageIndex}" var="num">
                            <a href="javascript:void(0)" onclick="showPage(${num})">
                                    ${num}</a>&nbsp;&nbsp;
                        </c:forEach>
                        <c:if test = "${PageBean.page < PageBean.pageCount}">
                            <a href="javascript:void(0)" onclick="showPage(${PageBean.page+1})">[下一页]</a>&nbsp;&nbsp;
                            <a href="javascript:void(0)" onclick="showPage(${PageBean.pageCount})">[尾页]</a>&nbsp;&nbsp;
                        </c:if>
                    </span
                        <span>第${PageBean.page}/
                            ${pageBean.pageCount}页
                    </span>
                    </div>
                </div>
            </form>
            <!-- user 表格 显示 end-->
        </div>
        <!-- user页面样式end -->
    </div>

</div>


<!-- 删除弹出框 -->
<div class="banDel">
    <div class="delete">
        <div class="close">
            <a><img src="img/shanchu.png" /></a>
        </div>
        <p class="delP1">你确定要删除此条记录吗？</p>
        <p class="delP2">
            <a href="javascript:void(0)" class="ok no"  onclick="deleteById()">确定</a><a class="ok no">取消</a>
        </p>
    </div>
</div>
<!-- 删除弹出框  end-->
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

<script type="text/javascript">
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
</script>

<script type="text/javascript">
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
        $(".deleteIds_form").submit();
    })
    function deleteById(){
        var itemsId = $("#itemId").val();
        $("#realId").val(itemsId)
        $("#deleteOne_form").submit();
    }

    $("#preDate").blur(function () {
        $(".list_form").submit();
    })
    $("#lastDate").blur(function () {
        $(".list_form").submit();
    })
    var expResult = false;
    $("#excelExport").click(function () {
        var val = $("input:checkbox[name='ids']:checked").length > 0
        if(!val){
            $(".expTip").text("请选择要导出的商品信息");
            $(".expTip").css("color",'red');
            return;
        }else{
            $(".expTip").text("");
        }
        $(".deleteIds_form").attr("action","${pageContext.request.contextPath}/admin/items/exportExcel");
        $(".deleteIds_form").submit();
    })

    $("#itemsFile").change(function () {
        var option={
            type:'POST',
            url:'${pageContext.request.contextPath }/admin/items/checkExcel',
            dataType:'json',
            success:function(data){
                if(!data.checkResult){
                    $("#checkTip").text("只能导入excel格式的文件");
                    $("#checkTip").css("color",'red');
                    checkResult = false;
                    return;
                }
                $("#checkTip").text("");
                checkResult = true;
            },
        };
        $(".list_form").ajaxSubmit(option);
    })

    $("#excelImport").click(function () {
        $(".list_form").attr("action","${pageContext.request.contextPath}/admin/items/importExcel");
        if(checkResult){
            $(".list_form").submit();
        }else{
            return;
        }
    })
</script>
</html>