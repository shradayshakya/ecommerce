<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="layout" content="userpanel">
<title>Checkout</title>
<asset:stylesheet href="checkout.css"/>
<asset:stylesheet href="checkout_responsive.css.css"/>
<asset:javascript src="checkout.js" />
</head>
<body>

	<!-- Checkout -->
	<g:form action="registerOrder" controller="userOrder" >
	<div class="checkout">
		<div class="container">
			<div class="row">

				<!-- Billing Info -->
				<div class="col-lg-6">
					<div class="billing checkout_section">
						<div class="section_title">Billing Address</div>
						<div class="section_subtitle">Enter your address info</div>
						<div class="checkout_form_container">
								<div class="row">
									<div class="col-xl-6">
										<!-- Name -->
										<label for="checkout_name">First Name</label>
										<input type="text" name = "fname" id="checkout_name" class="checkout_input" required>
									</div>
									<div class="col-xl-6 last_name_col">
										<!-- Last Name -->
										<label for="checkout_last_name">Last Name</label>
										<input type="text" name = "lname" id="checkout_last_name" class="checkout_input" required>
									</div>
								</div>
								<div>
									<!-- Country -->
									<label for="checkout_country">Country</label>
										<input type="text" name = "country" id="checkout_country" class="checkout_input" required>
								</div>
								<div>
									<!-- City / Town -->
									<label for="checkout_city">City/Town</label>
									<input type="text" name = "city" id="checkout_city" class="checkout_input" required>
								</div>
								<div>
									<!-- Province -->
									<label for="checkout_province">Province</label>
									<input type="text" name = "province" id="checkout_province" class="checkout_input" required>
								</div>
								<div>
									<!-- Zipcode -->
									<label for="checkout_zipcode">Zipcode</label>
									<input type="number" name="zipcode" id="checkout_zipcode" class="checkout_input" required="required">
								</div>
								<div>
									<!-- Phone no -->
									<label for="checkout_phone">Phone no</label>
									<input type="number" name="phone" maxlength="10" id="checkout_phone" class="checkout_input" required="required">
								</div>
								<div>
									<!-- Email -->
									<label for="checkout_email">Email Address*</label>
									<input type="email" name="email" id="checkout_email" class="checkout_input" required="required">
								</div>
								%{--<div class="checkout_extra">
									<div>
										<input type="checkbox" id="checkbox_terms" name="regular_checkbox" class="regular_checkbox" checked="checked">
										<label for="checkbox_terms"><img src="../../../web-app/images/check.png" alt=""></label>
										<span class="checkbox_title">Terms and conditions</span>
									</div>
									<div>
										<input type="checkbox" id="checkbox_account" name="regular_checkbox" class="regular_checkbox">
										<label for="checkbox_account"><img src="../../../web-app/images/check.png" alt=""></label>
										<span class="checkbox_title">Create an account</span>
									</div>
									<div>
										<input type="checkbox" id="checkbox_newsletter" name="regular_checkbox" class="regular_checkbox">
										<label for="checkbox_newsletter"><img src="../../../web-app/images/check.png" alt=""></label>
										<span class="checkbox_title">Subscribe to our newsletter</span>
									</div>
								</div>--}%
						</div>
					</div>
				</div>

				<!-- Order Info -->


				<div class="col-lg-6">
					<div class="order checkout_section">
						<div class="section_title">Your order</div>
						<div class="section_subtitle">Order details</div>

						<!-- Order details -->
						<div class="order_list_container">
							<div class="order_list_bar d-flex flex-row align-items-center justify-content-start">
								<div class="order_list_title"><strong>Product</strong></div>
								<div class="order_list_value ml-auto"><strong>Total</strong></div>
							</div>
							<ul class="order_list">
								<g:set var = "total" value="${0}" />
							<g:each in="${session.cart.keySet()}"  var="key">
								<g:set var="product" value="${dwitphase3.Product.get(key)}" />
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="order_list_title">${product.name}</div>
									<div class="order_list_value ml-auto">${session.cart[key]*product.price}</div>
									<g:set var = "total" value="${total + (session.cart[key]*product.price)}" />
								</li>
							</g:each>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="order_list_title"><strong>Subtotal</strong></div>
									<div class="order_list_value ml-auto"><strong>${total}</strong></div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="order_list_title">Shipping</div>
									<div class="order_list_value ml-auto">Free</div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="order_list_title"><strong>Total</strong></div>
									<div class="order_list_value ml-auto"><strong>${total}</strong></div>
								</li>
							</ul>
						</div>
%{--

						<!-- Payment Options -->
						<div class="payment">
							<div class="payment_options">
								<label class="payment_option clearfix">Paypal
									<input type="radio" name="radio">
									<span class="checkmark"></span>
								</label>
								<label class="payment_option clearfix">Cach on delivery
									<input type="radio" name="radio">
									<span class="checkmark"></span>
								</label>
								<label class="payment_option clearfix">Credit card
									<input type="radio" name="radio">
									<span class="checkmark"></span>
								</label>
								<label class="payment_option clearfix">Direct bank transfer
									<input type="radio" checked="checked" name="radio">
									<span class="checkmark"></span>
								</label>
							</div>
						</div>

--}%
						<!-- Order Text -->
						<div class="button order_button"><button class="btn" type="submit">Place Order</button></div>
					</div>
				</div>

			</div>
		</div>
	</div>
	</g:form>

</body>
</html>