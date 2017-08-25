<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/7/8
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <a href="${pageContext.request.contextPath}/testRep">测试一下</a>

<input id="bton" type="button" value="ajax">
<form action="${pageContext.request.contextPath}/getDate" method="post">
    <input type="text" id="testDate" name="date" onclick="WdatePicker()" >
    <img onclick="WdatePicker({el:'testDate'})" src="${pageContext.request.contextPath}/resources/My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle">
    <input type="submit" value="submit">
</form>

<form action="${pageContext.request.contextPath}/testExcel" enctype="multipart/form-data">
    <input type="file" name="excelFile">
    <input type="submit" value="SUBMIT">
</form>

<img src="192.168.216.132/images/test.jpg">
</body>
<script type="text/javascript">
    $("#bton").click(function () {
            alert("session" )
        $.ajax({
            "url":"${pageContext.request.contextPath}/testRep",
            "type":"POST",
            "dataType":"json",
            "success":function(data){
                alert(data.id)
            },
        });
    })
</script>
</html>
