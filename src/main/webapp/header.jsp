<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!--header-->
<script type="text/javascript">
    function go(){
        window.open("${pageContext.request.contextPath}/admin/user/show");
    }
</script>

<div class="header">
    <div class="header-top">
        <div class="container">
            <div class="header-top-in">
                <div class="logo">
                    <%--<a href="index.html"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt=" " ></a>--%>
                </div>
                <div class="header-in">
                    <ul class="icon1 sub-icon1" >
                        <c:if test="${sessionScope.loginUser == null}">
                            <li  ><a href="${pageContext.request.contextPath}/admin/user/loginUI.jsp">你好，请先登录</a></li>|
                            <li  ><a href="${pageContext.request.contextPath}/admin/user/userRegist.jsp">免费注册</a></li>|
                        </c:if>
                        <c:if test="${sessionScope.loginUser != null}">
                            <li  ><a href="#">欢迎您，${sessionScope.loginUser.name}</a></li>|
                            <li  ><a href="${pageContext.request.contextPath}/admin/user/logout">退出</a></li>|
                        </c:if>
                        <li><a href="#" onclick="go()">我的商城</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/cart/showCart/${sessionScope.loginUser.id}" target="_blank" >我的购物车</a></li>

                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <div class="header-bottom">
        <div class="container">
            <div class="h_menu4">
                <a class="toggleMenu" href="#">Menu</a>
                <ul class="nav">
                    <li class="active"><a href="${pageContext.request.contextPath}/admin/advertisement/indexAd"><i> </i>首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/items/showTypeItems?type=笔记本" >笔记本</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/items/showTypeItems?type=服装" >服装</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/items/showTypeItems?type=美食" >美食</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/items/showTypeItems?type=家居" >家居</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/items/showTypeItems?type=运动" >运动</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/items/showTypeItems?type=其他" >其他</a></li>
                </ul>
                <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/nav.js"></script>
            </div>
        </div>
    </div>
</div>

