<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="layout" content="userpanel">
<title>Shakya</title>
	<asset:stylesheet href="product.css" />
	<asset:stylesheet href="product_responsive.css" />
	<asset:javascript src="product.js" />
	<script>
	$(document).ready(function() {
		$("[type='number']").keypress(function (evt) {
			evt.preventDefault();
		});
	});
	</script>

</head>
<body>

	<!-- Home -->

	%{--<div class="home">
		<div class="home_container">
			<div class="home_background" style="background-image:url(../../../web-app/images/categories.jpg)"></div>
			<div class="home_content_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="home_content">
								<div class="home_title">Smart Phones<span>.</span></div>
								<div class="home_text"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie eros. Sed viverra velit venenatis fermentum luctus.</p></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>--}%

	<!-- Product Details -->

	<div class="product_details">
		<div class="container">
			<div class="row details_row">

				<!-- Product Image -->
				<div class="col-lg-6">
					<div class="details_image">
						<div class="details_image_large"><img src="${resource(file: 'product/images/'+product.image, absolute: true)}" alt="" width="300" height="320"></div>
						<div class="details_image_thumbnails d-flex flex-row align-items-start justify-content-between">
						</div>
					</div>
				</div>

				<!-- Product Content -->
				<div class="col-lg-6">
					<div class="details_content">
						<div class="details_name">${product.name}</div>
						<div class="details_discount">$${product.price }</div>
						<div class="details_price">$${product.price - product.discount}</div>

						<!-- In Stock -->
						<div class="in_stock_container">
							<div class="availability">Availability:</div>
							<span>${(product.price>0?'In Stock':'Out of Stock')} </span>
						</div>
						<div class="details_text">
							<p>${product.description}</p>
						</div>

						<!-- Product Quantity -->
						<div class="product_quantity_container">
							<div class="product_quantity clearfix">
								<g:form controller="product" action="addToCart">
								<span>Qty</span>
									<input type="hidden" name="productId" value="${product.id}">
								<input id="quantity_input" name="quantity" type="number" min="1" max="${product.stock}" pattern="[0-9]*" value="1">
							</div>
							<div class="button cart_button"><button type="submit">Add to cart</button></div>
								</g:form>
						</div>

						<!-- Share -->
						<div class="details_share">
							<span>Share:</span>
							<ul>
								<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>