<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!--header-->
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
                            <li  ><a href="${pageContext.request.contextPath}/userRegist.jsp">免费注册</a></li>|
                        </c:if>
                        <c:if test="${sessionScope.loginUser != null}">
                            <li  ><a href="#">欢迎您，${sessionScope.loginUser.name}</a></li>|
                            <li  ><a href="${pageContext.request.contextPath}/admin/user/logout">退出</a></li>|
                        </c:if>
                        <li  ><a href="${pageContext.request.contextPath}/admin/user/show">我的商城</a></li>
                        <li><div class="cart">
                            <a href="#" class="cart-in"> </a>
                            <span> 0</span>
                        </div>
                            <ul class="sub-icon1 list">
                                <h3>最近加入的宝贝</h3>
                                <div class="shopping_cart">
                                    <div class="cart_box">
                                        <div class="message">
                                            <div class="alert-close"> </div>
                                            <div class="list_img"><img src="${pageContext.request.contextPath}/resources/images/14.jpg" class="img-responsive" alt=""></div>
                                            <div class="list_desc"><h4><a href="#">velit esse molestie</a></h4>1 x<span class="actual">
		                             $12.00</span></div>
                                            <div class="clearfix">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cart_box1">
                                        <div class="message1">
                                            <div class="alert-close1"> </div>
                                            <div class="list_img"><img src="${pageContext.request.contextPath}/resources/images/15.jpg" class="img-responsive" alt=""></div>
                                            <div class="list_desc"><h4><a href="#">velit esse molestie</a></h4>1 x<span class="actual">
		                             $12.00</span></div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="total">
                                    <div class="total_left">CartSubtotal : </div>
                                    <div class="total_right">$250.00</div>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="login_buttons">
                                    <div class="check_button"><a href="checkout.html">Check out</a></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="clearfix"></div>
                            </ul>
                        </li>
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
                    <li class="active"><a href="show.jsp"><i> </i>首页</a></li>
                    <li ><a href="#" >笔记本</a>
                        <ul class="drop">
                            <li><a href="product.jsp">索尼</a></li>
                            <li><a href="product.jsp">安卓</a></li>
                            <li><a href="product.jsp">苹果</a></li>
                            <li><a href="product.jsp">Acer(53)</a></li>
                            <li><a href="product.jsp">HP(78)</a></li>
                            <li><a href="product.jsp">Intel(5)</a></li>
                        </ul>
                    </li>
                    <li><a href="product.jsp" >服装</a></li>
                    <li><a href="product.jsp" >美食</a></li>
                    <li><a href="product.jsp" >家居</a></li>
                    <li><a href="product.jsp" >运动</a></li>
                    <li><a href="product.jsp" >其他 </a></li>

                </ul>
                <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/nav.js"></script>
            </div>
        </div>
    </div>
    <div class="header-bottom-in">
        <div class="container">
            <div class="header-bottom-on">
                <%--<p class="wel"><a href="#">Welcome visitor you can login or create an account.</a></p>--%>
                <div class="header-can">
                    <div class="search">
                        <form>
                            <input type="text" value="" placeholder="搜索" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '';}" >
                            <input type="submit" value="">
                        </form>
                    </div>

                    <div class="clearfix">
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

