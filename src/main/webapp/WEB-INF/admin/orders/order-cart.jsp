<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" /> 
    <meta name="format-detection" content="telephone=no" />  
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" /> 
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>订单结算页</title>

	<!--结算页面样式-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/base.css" media="all" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order-commons.css" source="widget"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.6.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/base.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/order.common.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.checkout.js"></script>
</head>	<body id="mainframe">
<!--shortcut end-->

<!-- main -->
<div id="container">
	<div id="content" class="w">
		<div class="m">
			<div class="mt">
				<h2>填写并核对订单信息</h2>
			</div>
			<div class="mc">
				<div class="checkout-steps">
<!--  /widget/consignee-step/consignee-step.tpl -->


<!--/ /widget/consignee-step/consignee-step.tpl -->
	
<!--/ /widget/shopping-list/shopping-list.tpl -->
<div id="shipAndSkuInfo">
  <div id="payShipAndSkuInfo">
    <div class="step-tit">
	<h3>支付方式</h3>
</div>
<div class="step-cont">
	<div class="payment-list" id="">
		<div class="list-cont">
			<ul id="payment-list">
				<input type="hidden" id="instalmentPlan" value="false">
				<li style="cursor: pointer;" onclick="save_Pay(1);">
					<div class="payment-item online-payment "
						for="pay-method-1" payname="货到付款" payid="1" id="payByface">
						<b></b> 货到付款<span class="qmark-icon qmark-tip"
							data-tips="送货上门后再收款，支持现金、POS机刷卡、支票支付 <a href='http://help.jd.com/help/distribution-768-2-2813-2863-0-1410707152669.html' target='_blank' class='ftx-05'>查看服务及配送范围</a>"></span>
					</div>
				</li>
				<li style="cursor: pointer;" onclick="save_Pay(4);">
					<div class="payment-item online-payment " id="payOnline"
						for="pay-method-4" payname="支付宝支付" payid="4">
						<b></b> 支付宝支付 <font class="whiteBarSpanClass hide"
							color="#FF6600">[支持打白条]</font> <span
							class="qmark-icon qmark-tip"
							data-tips="即时到帐，支持绝大数银行借记卡及部分银行信用卡 <a href='http://www.jd.com/help/onlinepay.aspx' target='_blank' class='ftx-05'> 查看银行及限额</a>"></span>
					</div>
				</li>
				<!--div id="shipment"></div--> 
				<script>
					$("#payOnline").click(function () {
                        $(this).attr("class","payment-item item-selected online-payment");
                        $("#payByface").attr("class","payment-item online-payment");
                    })
					$("#payByface").click(function () {
						$(this).attr("class","payment-item item-selected online-payment");
						$("#payOnline").attr("class","payment-item online-payment");
					})
				</script>
			</ul>
		</div>
	</div>
</div>
<!--/ /widget/payment-step/payment-step.tpl -->
<div class="step-tit">
	<h3>送货清单</h3>
	<div class="extra-r">
		<a class="ftx-05" href="javascript:history.back();"><返回购物车></返回购物车></a>
			</div>
</div>
<div class="step-cont" id="skuPayAndShipment-cont">
	<!--添加商品清单  zhuqingjie -->
<div class="shopping-lists" id="shopping-lists"> 
<div class="shopping-list ABTest">
	<div class="goods-list">
     <!--配送方式-->
    <h4 class="vendor_name_h" id="0">商家：淘淘商城</h4>
	<form action="${pageContext.request.contextPath}/admin/orders/creatOrders" method="post" id="orders_form">
		 <div class="goods-suit goods-last">
			 <c:forEach items="${cartItemsList }" var="cartItems">
				<input type="hidden" name="itemIds" value="${cartItems.itemsId}"/>
				<input type="hidden" name="cartId" value="${cartItems.cartId}"/>

			    <c:set var="totalPrice"  value="${ totalPrice + cartItems.cost}"/>
				<div class="goods-item goods-item-extra">
					<div class="p-img">
						<a target="_blank" href="${pageContext.request.contextPath}/admin/items/viewItems?id=${cartItems.itemsId}">
							<img src="${pageContext.request.contextPath}/resources/file/items/${cartItems.photo}" alt="">
						</a>
					</div>
					<div class="goods-msg">
						<div class="p-name">
							<a href="${pageContext.request.contextPath}/admin/items/viewItems?id=${cartItems.itemsId}" target="_blank">
								${cartItems.title }
							</a>
						</div>
						<div class="p-price">
							<!--增加预售金额显示 begin   预售分阶段支付类型（1：一阶梯全款支付；2：一阶梯定金支付(全款或定金可选)；3：三阶梯仅定金支付） -->
							<strong>￥<fmt:formatNumber
									groupingUsed="false" maxFractionDigits="2"
									minFractionDigits="2" value="${cartItems.money}" /></strong>
							<!--增加预售金额显示 end-->
							<span class="ml20"> x${cartItems.itemsNumber} </span>
							<span class="ml20 p-inventory" skuId="11555193">有货</span>
						</div>
						<i class="p-icon p-icon-w"></i><span class="ftx-04">7天无理由退货</span>
					</div>
					<div class="clr"></div>
				</div>
			</c:forEach>
	     </div>
	</form>
</div>
<!--goods-list 结束-->
<div class="dis-modes">
	<!--配送方式-->
	<div class="mode-item mode-tab">
		<h4>
			配送方式：（<a id="jd-goods-item" class="ftx-05 alink"
				href="#none">对应商品</a>）
		</h4>
		<div class="mode-tab-nav">
			<ul>
				<li class="mode-tab-item " id="jd_shipment_item"
					onclick="doSwithTab('pay')"><span
					id="jdShip-span-tip" class="m-txt">快递公司<i
						class='qmark-icon qmark-tip'
						data-tips='由淘淘公司负责配送，速度很快，还接受上门刷卡付款服务'></i></span><b></b></li>
			</ul>
		</div>
	</div>
</div>
<!--dis-modes 结束-->
<div class="clr"></div>
<div class="freight-cont">
	<strong class="ftx-01" style="color: #666"
			freightByVenderId="0" popJdShipment="false">免运费</strong>
</div>
</div>	
				
</div>
</div>  
</div>
</div>			
<!--  /widget/invoice-step/invoice-step.tpl -->
<div class="step-tit">
	<h3>发票信息</h3>
</div>
<div class="step-content">
	<div id="part-inv" class="invoice-cont">
		<span class="mr10"> 普通发票（电子） &nbsp; </span><span class="mr10">
			个人 &nbsp; </span><span class="mr10"> &nbsp; </span>
	</div>
</div>
		<div class="order-summary">
			<!--  预售 计算支付展现方式 begin -->
			<div class="statistic fr">
				<div class="list">
					<span>
						总商品金额：
					</span> 
					<em class="price" id="warePriceId">¥<fmt:formatNumber value="${totalPrice}" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/></em>
				</div>
				<div class="list">
					<span>运费：</span> <em class="price" id="freightPriceId">
						￥0.00</em>
				</div>
				<div class="list">
					<span>应付总额：</span> <em class="price" id="sumPayPriceId">
						￥<fmt:formatNumber value="${totalPrice}" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/></em>
				</div>
			</div>
			<div class="clr"></div>
		</div>
	</div>
</div>
<!--/ /widget/order-summary/order-summary.tpl -->
					
<!--  /widget/checkout-floatbar/checkout-floatbar.tpl -->
<div class="trade-foot">
  <div id="checkout-floatbar" class="group">
    <div class="ui-ceilinglamp checkout-buttons">
      <div class="sticky-placeholder hide" style="display: none;">
      </div>
      <div class="sticky-wrap">
      	<div class="inner">
          <button type="submit" class="checkout-submit btn-1" 
          		  id="order-submit"	onclick="$('#orders_form').submit()">
          	提交订单
          </button>

                    <span class="total">应付总额：<strong id="payPriceId">￥<fmt:formatNumber value="${totalPrice}" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/></strong>
          </span>
                    <span id="checkCodeDiv"></span>
          <div class="checkout-submit-tip" id="changeAreaAndPrice" style="display: none;">
            由于价格可能发生变化，请核对后再提交订单
          </div>
          <div style="display:none" id="factoryShipCodShowDivBottom" class="dispatching">
            部分商品货到付款方式：先由淘淘配送“提货单”并收款，然后厂商发货。
          </div>
        </div>
        <span id="submit_message" style="display:none" class="submit-error" ></span>
		  	<div class="submit-check-info" id="submit_check_info_message" style="display:none"></div>
    	</div>
    </div>
  </div>
  
        </div>
      </div>
    </div>

  </div>
</div>

<!-- /main -->
	<%--<jsp:include page="commons/footer.jsp" />--%>
	</body>
</html>