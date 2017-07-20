<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/6/9
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>完整demo</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ueditor.js"></script>
    <style type="text/css">
        div{
            width:100%;
        }
    </style>
</head>
<body>
    <%--<script id="editor" type="text/plain" style="width:500px;height:500px;"></script>--%>
    <!-- 实例化编辑器 -->
    <form action="${pageContext.request.contextPath}/testUed">
        <div>
            <h1>完整demo</h1>
        </div>
            <textarea id="editor" name="testUeditor" >121212</textarea>
            <input type="text" name="aa">
            <input type="submit" value="SUBMIE">
    </form>


</body>
</html>
