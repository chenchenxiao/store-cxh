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
    <title>我的广告</title>
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
            <div class="conform">
                <form action="${pageContext.request.contextPath}/admin/admin/showAllAd" class="list_form" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="pageNum" name="page" value="1">
                    <input type="hidden" name="uid" value="${sessionScope.loginUser.id}"/>
                    <div class="cfD">
                        <a class="btn btn-sm btn-primary-outline pull-right" href="${pageContext.request.contextPath}/admin/advertisement/adSaveUI/" >
                            <i class="icon-plus"></i>添加
                        </a>
                    </div>
                    <div>
                        <input class="userinput" type="text" name="searchText" placeholder="输入查询条件" value=" "/>&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
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
            <div class="conShow">
                <div style="color: dodgerblue">

                </div>
                <table border="1" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="200px" class="tdColor tdC">广告图片</td>
                        <td width="200px" class="tdColor tdC">商品名称</td>
                        <td width="200px" class="tdColor tdC">商品介绍</td>
                        <td width="200px" class="tdColor">是否显示</td>
                    </tr>
                    <form action="#" class="ad_form" method="post">
                        <input type="hidden" value="" id="advesId">
                        <c:forEach items="${PageBean.recordList}" var="ad" varStatus="status">
                            <tr height="40px">
                                <td>
                                    <label>
                                        <input  name="ids" id="checkBox" type="checkbox" value="${ad.id}" ><span></span>
                                    </label>
                                    <img width="52" height="52" src="${pageContext.request.contextPath}/resources/file/advertisement/${ad.photo}"/>
                                </td>
                                <td>${ad.itemsName}</td>
                                <td>${ad.description}</td>
                                <td>${ad.status == 0 ? '否':'是'}</td>
                            </tr>
                        </c:forEach>
                    </form>
                </table>
                <div class="btn-toolbar" role="toolbar">
                    <a href="javascript:void(0)" class="checkbox-row btn btn-sm btn-primary-outline pull-left" id="cancelAll" name="checkAll">全不选</a>
                    <a href="javascript:void(0)" class="checkbox-row btn btn-sm btn-primary-outline pull-left" id="checkAll" name="checkAll">全选</a>
                    <a href="javascript:void(0)" class="checkbox-row btn btn-sm btn-primary-outline pull-left" id="show">显示</a>
                    <a href="javascript:void(0)" class="checkbox-row btn btn-sm btn-primary-outline pull-left" id="notShow">不显示</a>

                </div>
                <div class="expTip"></div>
                <!--分页 -->
                <c:if test="${PageBean.pageCount > 0}">
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
                    <span>
                                第${PageBean.page}/${pageBean.pageCount}页
                        </span>
                </div>
            </div>
            </c:if>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/adList.js"></script>
<script type="text/javascript">
    $("#show").click(function () {
        $(".ad_form").attr("action","${pageContext.request.contextPath}/admin/admin/adPass");
        $(".ad_form").submit();
    })
    $("#notShow").click(function () {
        $(".ad_form").attr("action","${pageContext.request.contextPath}/admin/admin/adNotPass");
        $(".ad_form").submit();
    })
</script>
</html>