<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/purchase.2012.css?v=201410141639" >

    <title>我的购物车</title>
    <style>
        a{ text-decoration:none}
    </style>
<body>
<!--shortcut start-->
<!--shortcut end-->
<div class="w w1 header clearfix">
    <%--<div id="logo">--%>
        <%--<a href="/">--%>
            <%--<img clstag="clickcart|keycount|xincart|logo" src="" title="返回首页" alt="返回首页">--%>
        <%--</a>--%>
    <%--</div>--%>
    <div class="language"><a href="javascript:void(0);" onclick="toEnCart()"></a></div>
    <div class="progress clearfix">
        <ul class="progress-1">
            <li class="step-1"><b></b>1.我的购物车</li>
            <li class="step-2"><b></b>2.填写核对订单信息</li>
            <li class="step-3">3.成功提交订单</li>
        </ul>
    </div>
</div>
<div class="w cart">
    <div class="cart-hd group">
        <h2>我的购物车</h2>
    </div>
    <div id="show">

        <div class="cart-frame">
            <div class="tl"></div>
            <div class="tr"></div>
        </div>
        <div class="cart-inner">
            <div class="cart-thead clearfix">
                <span class="column t-checkbox form" id="checkAll">
                    <input data-cart="toggle-cb" name="toggle-checkboxes" id="toggle-checkboxes_up" type="checkbox" checked="" value="">
                    <label for="toggle-checkboxes_up" >全选</label>
                </span>
                <span class="column t-checkbox form" id="cancelAll">
                  <input data-cart="toggle-cb" name="toggle-checkboxes" id="toggle-checkboxes_down" type="checkbox"  value="" class="jdcheckbox" >
                  <label for="toggle-checkboxes_down" > 取消</label>
              </span>
                <div class="column t-goods">商品</div>
                <div class="column t-price">单价</div>
                <div class="column t-promotion">优惠</div>
                <div class="column t-inventory">库存</div>
                <div class="column t-quantity">数量</div>
                <div class="column t-action">操作</div>
            </div>
            <div id="product-list" class="cart-tbody">
                <!-- ************************商品开始********************* -->

                <c:set var="totalPrice" value="0"></c:set>
                <c:forEach items="${orders.orderDetailsList}" var="details" varStatus="status">
                    <c:set var="totalPrice"  value="${ totalPrice + (details.items.price * details.itemsNumber)}"/>
                    <div id="product_11345721" data-bind="rowid:1" class="item item_selected ">
                        <div class="item_form clearfix">
                            <div class="cell p-checkbox">
                                <input data-bind="cbid:1" class="checkbox" type="checkbox" name="checkItem" checked="" onclick="switchState()" value="11345721-1">
                            </div>
                            <div class="cell p-goods">
                                <div class="p-img">
                                    <a href="/item/${details.items.id }.html" target="_blank">
                                        <img clstag="clickcart|keycount|xincart|p-imglistcart" src="${pageContext.request.contextPath}/resources/file/items/${details.items.photo}" alt="${details.items.title}" width="52" height="52">
                                    </a>
                                </div>
                                <div class="p-name">t
                                    <a style="text-decoration: none" href="${pageContext.request.contextPath}/admin/items/viewItems?id=${details.items.id}"  clstag="clickcart|keycount|xincart|productnamelink" target="_blank">
                                        标题&nbsp;&nbsp;&nbsp;&nbsp;
                                        ${details.items.title}测试测试测试
                                    </a>
                                    <span class="promise411 promise411_11345721" id="promise411_11345721"></span>
                                </div>
                            </div>
                            <div class="cell p-price"><span class="price">¥<fmt:formatNumber groupingUsed="false" value="${details.items.price }" maxFractionDigits="2" minFractionDigits="2"/> </span></div>
                            <div class="cell p-promotion">
                            </div>
                            <div class="cell p-inventory stock-11345721">有货</div>
                            <div class="cell p-quantity" for-stock="for-stock-11345721">
                                <div class="quantity-form" data-bind="">
                                    <a href="javascript:void(0);" class="decrement" clstag="clickcart|keycount|xincart|diminish1" id="decrement">-</a>
                                    <input type="text" class="quantity-text" itemPrice="${details.items.price}" itemId="${details.items.id}" value="${details.itemsNumber }" id="changeQuantity-11345721-1-1-0">
                                    <a href="javascript:void(0);" class="increment" clstag="clickcart|keycount|xincart|add1" id="increment">+</a>
                                </div>
                            </div>
                            <div class="cell p-remove"><a id="remove-11345721-1" data-more="removed-87.20-1" clstag="clickcart|keycount|xincart|btndel318558" class="cart-remove" href="/cart/delete/${details.items.id}.html">删除</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div><!-- product-list结束 -->
            <div class="cart-toolbar clearfix">
                <div class="total fr">
                    <p><span class="totalSkuPrice">¥<fmt:formatNumber value="${totalPrice }" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/></span>总计：</p>
                    <p><span id="totalRePrice">- ¥0.00</span>优惠：</p>
                </div>
                <div class="amout fr"><span id="selectedCount">1</span> 件商品</div>
            </div>
            <div class="ui-ceilinglamp-1" style="width: 988px; height: 49px;"><div class="cart-dibu ui-ceilinglamp-current" style="width: 988px; height: 49px;">
                <div class="control fdibu fdibucurrent">

                    <span class="delete">
                  <b>
                  </b>
                  <a href="javascript:void(0);" clstag="clickcart|keycount|xincart|clearcartlink" id="remove-batch">
                          删除选中的商品
                  </a>
              </span>
                    <span class="shopping">
                  <b>
                  </b>
                  <a href="/" target="_blank" clstag="clickcart|keycount|xincart|coudanlink" id="continue">继续购物</a>
              </span>
                </div>
                <div class="cart-total-2014">
                    <div class="cart-button">
                  <span class="check-comm-btns" id="checkout-jd">
                      <a class="checkout" href="${pageContext.request.contextPath}/admin/orders/showCart?id=53" clstag="clickcart|keycount|xincart|gotoOrderInfo" id="toSettlement">去结算<b></b></a>
                  </span>
                        <span class="combine-btns" style="display:none">
                        <span class="fore1" style="display: none;">
                          <a href="" class="combine-btn">不支持合并付款</a>
                      </span>
                  </span>
                    </div>
                    <div class="total fr">
                        总计（不含运费）：
                        <span class="totalSkuPrice">¥<fmt:formatNumber value="${totalPrice }" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/></span>
                        <span class="ml10">
                            <a class="ftx-05" href="javascript:history.back();">返回</a>
                        </span>
                    </div>
                </div>
            </div></div>
        </div><!-- cart-inner结束 -->
    </div>

</div>
<!--推荐位html修改处-->

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/base-v1.js"></script>
<!-- footer start -->

<!-- footer end -->

<!-- 购物车相关业务 -->
<script type="text/javascript">
//    $("#increment").click(function(){//＋
//        alert("!!")
//        var _thisInput = $(this).siblings("input");
//        _thisInput.val(eval(_thisInput.val()) + 1);
//
//    });
$("#cancelAll").hide()
$("#checkAll").click(function () {
    $('input:checkbox').each(function() {
        $(this).prop('checked', true);
    });
    $("#cancelAll").show()
    $("#checkAll").hide()
})

$("#cancelAll").click(function () {
    $('input:checkbox').each(function() {
        $(this).prop('checked', false);
    });
    $("#checkAll").show()
    $("#cancelAll").hide()
})

</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.price_format.2.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cart.js"></script>
</html>