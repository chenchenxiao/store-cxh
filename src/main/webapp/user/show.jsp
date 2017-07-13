<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/7/7
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的商城</title>
</head>
<frameset rows="100,*" cols="*" scrolling="No" framespacing="0" frameborder="no" border="0">
    <frame src="${pageContext.request.contextPath}/inc/head.jsp" name="headmenu" id="mainFrame" title="mainFrame"><!-- 引用头部 -->
    <!-- 引用左边和主体部分 -->
    <frameset rows="100*" cols="220,*" scrolling="No"  framespacing="0" frameborder="no" border="0">
    <framesrc="${pageContext.request.contextPath}/inc/left.jsp" name="leftmenu" id="mainFrame" title="mainFrame">
    <frame src="${pageContext.request.contextPath}/user/main.html" name="main" scrolling="yes" noresize="noresize" id="rightFrame" title="rightFrame"></frameset></frameset>
</html>
