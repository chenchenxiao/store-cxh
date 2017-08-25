<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/8/21
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h4>Login Page</h4>

<form action="${pageContext.request.contextPath}/test/login" method="post">
    用户名:<input type="text" name="username">
    密码:<input type="password" name="password">
    <input type="submit" value="SUBMIT">
</form>
</body>
</html>
