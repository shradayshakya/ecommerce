<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="layout" content="userpanel">
<title>Cart</title>

	<asset:stylesheet href="cart.css"/>
	<asset:stylesheet href="cart_responsive.css.css"/>
	<asset:javascript src="cart.js" />
<script>


	$(document).ready(function(){
		$("[type='number']").keypress(function (evt) {
			evt.preventDefault();
		});

		$(".quantity_input").focusout(function (event) {
			$(".quantity_input").attr("disabled","disabled");
			var productId = event.target.id;
            var productValue = event.target.value;

			$.ajax({
				url: "/DwitPhase3/product/updateCart",
                type: "POST",
				success: function (data, status, jqXHR) {
					$(".quantity_input").removeAttr("disabled");
					location.reload();
				},
				data:{
					id: productId,
					value: productValue
				},
			})
		})
	})
</script>

</head>
<body>
	<!-- Cart Info -->

	<div class="cart_info">
		<div class="container">
			<div class="row">
				<div class="col">
					<!-- Column Titles -->
					<div class="cart_info_columns clearfix">
						<div class="cart_info_col cart_info_col_product">Product</div>
						<div class="cart_info_col cart_info_col_price">Price</div>
						<div class="cart_info_col cart_info_col_quantity">Quantity</div>
						<div class="cart_info_col cart_info_col_total">Total</div>
					</div>
				</div>
			</div>
			<div class="row cart_items_row">
				<div class="col">

					<g:set var = "total" value="${0}" />
					<g:each in="${session.cart.keySet()}"  var="key">
                    <g:set var="product" value="${dwitphase3.Product.get(key)}" />
					<!-- Cart Item -->
					<div class="cart_item d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">
						<!-- Name -->
						<div class="cart_item_product d-flex flex-row align-items-center justify-content-start">
							<div class="cart_item_image">
								<div><img src="${resource(file: 'product/images/'+product.image  ,absolute: true)}" width="150" height="150" alt=""></div>
							</div>
							<div class="cart_item_name_container">
								<div class="cart_item_name"><g:link action="unit" controller="product" params="[productId: product.id]">${product.name}</g:link></div>
							</div>
						</div>
						<!-- Price -->
						<div class="cart_item_price">$${product.price}</div>
						<!-- Quantity -->
						<div class="cart_item_quantity">
							<div class="product_quantity_container">
								<div class="product_quantity clearfix">
									<span>Qty</span>
									<input type="number" class="quantity_input" id ="${product.id}" value="${session.cart[key]}" min="0" max="${product.stock}">
								</div>
							</div>
						</div>
						<!-- Total -->
						<div class="cart_item_total">${session.cart[key]*product.price}</div>
						<g:set var = "total" value="${total + (session.cart[key]*product.price)}" />
					</div>
                    </g:each>
				</div>
			</div>

			<div class="row row_cart_buttons">
				<div class="col">
					<div class="cart_buttons d-flex flex-lg-row flex-column align-items-start justify-content-start">
						<div class="button continue_shopping_button"><g:link action="land" controller="product">Continue shopping</g:link></div>
						<div class="cart_buttons_right ml-lg-auto">
							<div class="button clear_cart_button"><g:link  action="clearCart" controller="product">Clear cart</g:link></div>
							%{--<div class="button update_cart_button"><g:link action="updateCart" controller="product">Update cart</g:link></div>--}%
						</div>
					</div>
				</div>
			</div>
			<div class="row row_extra">
				%{--
            <div class="col-lg-4">
                <!-- Delivery -->
                    <div class="delivery">
                        <div class="section_title">Shipping method</div>
                        <div class="section_subtitle">Select the one you want</div>
                        <div class="delivery_options">
                            <label class="delivery_option clearfix">Next day delivery
                                <input type="radio" name="radio">
                                <span class="checkmark"></span>
                                <span class="delivery_price">$4.99</span>
                            </label>
                            <label class="delivery_option clearfix">Standard delivery
                                <input type="radio" name="radio">
                                <span class="checkmark"></span>
                                <span class="delivery_price">$1.99</span>
                            </label>
                            <label class="delivery_option clearfix">Personal pickup
                                <input type="radio" checked="checked" name="radio">
                                <span class="checkmark"></span>
                                <span class="delivery_price">Free</span>
                            </label>
                        </div>
                    </div>

                    <!-- Coupon Code -->
                    <div class="coupon">
                        <div class="section_title">Coupon code</div>
                        <div class="section_subtitle">Enter your coupon code</div>
                        <div class="coupon_form_container">
                            <form action="#" id="coupon_form" class="coupon_form">
                                <input type="text" class="coupon_input" required="required">
                                <button class="button coupon_button"><span>Apply</span></button>
                            </form>
                        </div>
                    </div>
                </div>
    --}%
				<div class="col-lg-6 offset-lg-3">
					<div class="cart_total">
						<div class="section_title">Cart total</div>
						<div class="section_subtitle">Final info</div>
						<div class="cart_total_container">
							<ul>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="cart_total_title">Subtotal</div>
									<div class="cart_total_value ml-auto">$${total}</div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="cart_total_title">Shipping</div>
									<div class="cart_total_value ml-auto">Free</div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="cart_total_title">Total</div>
									<div class="cart_total_value ml-auto">$${total}</div>
								</li>
							</ul>
						</div>
						<div class="button checkout_button"><g:link action="checkout" controller="product">Check out</g:link></div>
					</div>
				</div>

			</div>
		</div>		
	</div>


</body>
</html>

%{--
Mindmap
Structure site
Wire frame
Schema
--}%
