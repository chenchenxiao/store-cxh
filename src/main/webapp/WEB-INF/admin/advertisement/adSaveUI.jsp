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
    <title>添加商品</title>
    <%@ include file="../alcss.jsp" %>
    <%@ include file="../aljs.jsp" %>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ueditor.js"></script>--%>
    <script type="text/javascript">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/";
        var ue = UE.getEditor('editor');
    </script>
</head>
<body>
<div id="pageAll">
    <div class="col-md-12">
        <div class="widget-container">
            <div class="widget-content padded">
                <form action="${pageContext.request.contextPath}/admin/advertisement/saveAd" id="items-form" method="post" enctype="multipart/form-data">
                    <fieldset>
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <%--<div class="hidden">--%>
                                <%--<input name="uid" type="hidden" value="${user.uid}"/>--%>
                                <%--</div>--%>
                                <input type="hidden" name="id" value="${ad.id}">
                                <input type="hidden" name="uid" value="${sessionScope.loginUser.id}"/>
                                <div class="form-group">
                                    <label for="photo">广告图片</label>
                                    <a href="#">
                                        <img id="photo" src="${pageContext.request.contextPath}/resources/file/advertisement/${ad.photo}" height="100" width="100">
                                    </a>
                                    <input type="file" name="picture"  id="picture" >
                                    <div class="photoTip">
                                        <c:if test="${ad.photo == null}">
                                            你还有选择图片
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">广告的商品</label>
                                    <div class="">
                                        <select class="form-control" id="type" name="itemsId" >
                                            <c:forEach  items="${itemsList}" var="item" varStatus="status">
                                                <option value="${item.id}" <c:if test="${ad.itemsId == items.id}"></c:if>>${item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                 <div >
                                     <label for="description">商品介绍</label>
                                </div>
                                <div>
                                    <textarea id="description" name="description" cols="15" rows="3">${ad.description}</textarea>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-offset-5 col-md-2">
                            <input class="btn btn-primary " id="items_submit" type="button" value="确定">
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("#items-form").validate({
            rules: {
                name: "required",
                type: "required",
                description: {
                    required:true,
                    minlength: 3,
                    maxlength: 8,
                },

            },
            messages: {
                name: "请填写商品的名称",
                type: "请选择商品的类型",
                description: {
                    required:'请填写商品的价格',
                    minlength:'长度不能小于3',
                    maxlength:'长度不能大于8',
                },
            }
        });
    });
</script>

<script type="text/javascript">
    var photoResult = true;
    function getcheckVal(result){
        photoResult = result;
    }
    $("#picture").change(function () {
        var option={
            type:'POST',
            data:{"id":1},
            url:'${pageContext.request.contextPath }/admin/advertisement/showPhoto',
            dataType:'json',
            success:function(data){
                //返回服务器图片名称，把图片名称设置给img标签
                if(!data.showResult){
                    $(".photoTip").text("只能上传图片格式的文件");
                    $(".photoTip").css("color",'red');
                    $("#photo").attr("src","");
                    getcheckVal(data.showResult);
                    return;
                }
                var path = "${pageContext.request.contextPath }/resources/file/advertisement/"+data.showResult;
                $(".photoTip").text("");
                $("#photo").attr("src",path);
                photoResult = true;
            },
        };
        $("#items-form").ajaxSubmit(option);
    })
    $("#items_submit").click(function () {
        if(photoResult){
            $("#items-form").submit()
            return;
        }else{
            return;
        }

    })

</script>
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
</html>