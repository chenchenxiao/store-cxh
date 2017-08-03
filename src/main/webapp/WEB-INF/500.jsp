
<%@ page contentType="text/html;charset=UTF-8"  isErrorPage="true" language="java" %>
<link href="${pageContext.request.contextPath}/resources/admin/stylesheets/bootstrap.min.css" media="all" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/admin/stylesheets/font-awesome.css" media="all" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/admin/stylesheets/se7en-font.css" media="all" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/admin/stylesheets/style.css" media="all" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/resources/admin/javascripts/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/admin/javascripts/jquery-ui.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/admin/javascripts/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/admin/javascripts/modernizr.custom.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/admin/javascripts/main.js" type="text/javascript"></script>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<%response.setStatus(HttpServletResponse.SC_OK);%>
<html>
<head>
    <title></title>
</head>
<body class="fourofour">
<div class="fourofour-container">
    <h1>
        抱歉
    </h1>
    <h2>
        500您访问的地址不存在，请确认您输入的URL地址
    </h2>
    <a class="btn btn-lg btn-default-outline" onclick="returnPage()"><i class="icon-home"></i>返回</a>
</div>
</body>
<script language="javascript">
    function returnPage(){
        window.history.go(-1);
    }
</script>
</html>
