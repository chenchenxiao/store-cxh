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
    <title>用户列表</title>
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
            <span><a href="show.jsp">首页</a>&nbsp;-&nbsp;-</span>&nbsp;用户订单列表
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/admin/items/deleteOne" method="post" id="deleteOne_form">
        <input type="hidden" id="realId" name="id">
    </form>
    <div class="page">
        <!-- user页面样式 -->
        <div class="connoisseur">
            <c:forEach items="${ordersList}" var="orders" varStatus="status">
                <!-- user 表格 显示 -->
                        <div class="conShow">
                            <div style="color: dodgerblue">
                                订单号:${orders.id}
                            </div>
                            <table border="1" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="200px" class="tdColor tdC">图片</td>
                                    <td width="200px" class="tdColor tdC">商品名称</td>
                                    <td width="200px" class="tdColor">商品标题</td>
                                    <td width="200px" class="tdColor">数量</td>
                                    <td width="200px" class="tdColor">单价</td>
                                    <td width="200px" class="tdColor">总额</td>
                                </tr>
                                <c:forEach items="${orders.orderDetailsList}" var="orderDetails" varStatus="status">
                                    <tr height="40px">
                                        <td>
                                            <img width="52" height="52" src="${pageContext.request.contextPath}/resources/file/items/${orderDetails.items.photo}"/>
                                        </td>
                                        <td>${orderDetails.items.name}</td>
                                        <td>${orderDetails.items.title}</td>
                                        <td>${orderDetails.itemsNumber}</td>
                                        <td>${orderDetails.money}</td>
                                        <td>${orderDetails.cost}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <div class="expTip"></div>
            </c:forEach>
                            <!--分页 -->
                    <%--<div class="paging">--%>
                        <%--<span>--%>
                            <%--<c:if test="${PageBean.page > 1}">--%>
                                <%--<a href="javascript:void(0)" onclick="showPage(1)">[首页]</a>&nbsp;&nbsp;--%>
                                <%--<a href="javascript:void(0)" onclick="showPage(${PageBean.page - 1})">[上一页]</a>&nbsp;&nbsp;--%>
                            <%--</c:if>--%>
                        <%--&lt;%&ndash;动态显示条 &ndash;%&gt;--%>
                            <%--<c:forEach begin = "${PageBean.beginPageIndex}" end = "${PageBean.endPageIndex}" var="num">--%>
                                <%--<a href="javascript:void(0)" onclick="showPage(${num})">--%>
                                        <%--${num}</a>&nbsp;&nbsp;--%>
                            <%--</c:forEach>--%>
                            <%--<c:if test = "${PageBean.page < PageBean.pageCount}">--%>
                                <%--<a href="javascript:void(0)" onclick="showPage(${PageBean.page+1})">[下一页]</a>&nbsp;&nbsp;--%>
                                <%--<a href="javascript:void(0)" onclick="showPage(${PageBean.pageCount})">[尾页]</a>&nbsp;&nbsp;--%>
                            <%--</c:if>--%>
                        <%--</span>--%>
                                <%--<span>第${PageBean.page}/--%>
                                <%--${pageBean.pageCount}页--%>
                        <%--</span>--%>
                            <%--</div>--%>
                    <%--</div>--%>
            <!-- user 表格 显示 end-->
        </div>
        <!-- user页面样式end -->
    </div>

</div>


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
    function showPage(num){
        //1 修改隐藏域的值
        document.getElementById("pageNum").value = num;
        //2 提交表单
        $(".list_form").submit();
    }

    $("#showSize").change(function () {
        $(".list_form").submit();
    })
</script>
</html>