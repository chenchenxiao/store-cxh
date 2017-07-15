<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--
  Created by IntelliJ IDEA.
  User: ${陈晓海}
  Date: 2017/6/13
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>安全设置</title>
    <%@ include file="../alcss.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
    <%@ include file="../aljs.jsp" %>
    <%--<script src="${pageContext.request.contextPath}/resources/js/update.js"></script>--%>
</head>
<body>
<div id="pageAll">
    <div class="pageTop">
        <div class="page">
            &nbsp;  &nbsp;账户管理&nbsp;-</span>&nbsp;
            安全设置
        </div>
    </div>
    <div class="col-md-12">
        <div class="widget-container">
            <div class="widget-content padded">
                <form action="${pageContext.request.contextPath}/admin/user/update" id="user-form" method="post" enctype="multipart/form-data">
                    <fieldset>
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <div class="hidden">
                                    <input name="id" type="hidden" value="${user.id}"/>
                                </div>
                                <div class="form-group"> </div>
                                <div class="form-group"> </div>
                                <div class="form-group">
                                    您的基本信息:
                                </div>
                                <div class="form-group">
                                     用户名 : ${user.account}
                                </div>
                                <div class="form-group">
                                    绑定手机 :${phone}
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/user/updatePhoneUI/${user.id}">修&nbsp;&nbsp;改</a>
                                </div>
                                <div class="form-group">
                                    绑定邮箱 :
                                    <c:if test="${user.email == null}">
                                        您还有绑定邮箱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/user/updateEmailUI/${user.id}">添&nbsp;加&nbsp;邮&nbsp;箱</a>
                                    </c:if>
                                    <c:if test="${user.email != null}">
                                        ${email}
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/user/updateEmailUI/${user.id}">修&nbsp;&nbsp;改</a>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <br>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>