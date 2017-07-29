<%@ page import="org.springframework.web.context.request.RequestAttributes" %>
<%@ page import="org.springframework.web.context.request.RequestContextHolder" %>
<%@ page import="org.springframework.web.context.request.ServletRequestAttributes" %><%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/7/29
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String url = request.getContextPath();
        response.sendRedirect(url +"/admin/advertisement/indexAd");
    %>
</body>
</html>
