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
            <span></span>&nbsp;用户管理
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/admin/items/deleteOne" method="post" id="deleteOne_form">
        <input type="hidden" id="realId" name="id">
    </form>
    <div class="page">
        <!-- user页面样式 -->
        <div class="connoisseur">
            <div class="conform">
                <form action="${pageContext.request.contextPath}/admin/admin/userList" class="list_form" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="pageNum" name="page" value="1">
                    <input type="hidden" name="uid" value="${sessionScope.loginUser.id}"/>
                    <div>
                        <input class="userinput" type="text" name="searchText" placeholder="输入查询条件" value=""/>&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-sm btn-primary-outline" id="search">查询</button>  </div>
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
            <form action="#" method="post" class="deleteIds_form">
                <div class="conShow">
                    <div style="color: dodgerblue">
                        点击用户查看用户的订单详情
                    </div>
                    <table border="1" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="200px" class="tdColor tdC">姓名</td>
                            <td width="200px" class="tdColor">用户名</td>
                            <td width="200px" class="tdColor">邮箱</td>
                            <td width="200px" class="tdColor">手机号码</td>
                        </tr>
                        <c:forEach items="${PageBean.recordList}" var="user" varStatus="status">
                            <input type="hidden" value="${user.id}" id="userId">
                            <tr height="40px">
                                <td><a href="${pageContext.request.contextPath}/admin/admin/showOrders/${user.id}">${user.name}</a></td>
                                <td>${user.account}</td>
                                <td>${user.email}</td>
                                <td>${user.phoneNumber}</td>
                            </tr>
                        </c:forEach>
                    </table>
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
                    </span>
                        <c:if test="${PageBean.recordList[0] != null}">
                            <span>
                                第${PageBean.page}/
                                ${pageBean.pageCount}页

                             </span>
                        </c:if>
                    </div>
                </div>
            </form>
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