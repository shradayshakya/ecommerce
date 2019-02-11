<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="layout" content="userpanel">
<title>Shakya</title>
	<asset:stylesheet href="main_styles.css" />
	<asset:stylesheet href="responsive.css" />
	<asset:javascript src="custom.js" />
</head>
<body>
	<!-- Products -->

	<div class="products">
		<div class="container">
			<div class="row">
				<div class="col">
					
					<div class="product_grid">

						<g:each in="${productList}" var="product" >

						<!-- Product -->
						<div class="product">
							<div class="product_image"><img src="${resource(file: 'product/images/'+product.image, absolute: true)}" width="200" height="220"  alt=""></div>
							<div class="product_content">
								<div class="product_title"><g:link action="unit" controller="product" params="[productId:product.id]">${product.name}</g:link></div>
								<div class="product_price">${product.price}</div>
							</div>
						</div>
						</g:each>
					</div>
						
				</div>
			</div>
		</div>
	</div>

	<!-- Ad -->

	<div class="avds_xl">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="avds_xl_container clearfix">
						<div class="avds_xl_background" style="background-image:url(${resource(file:'images/avds_xl.jpg', absolute: true)})"></div>
						<div class="avds_xl_content">
							<div class="avds_title">Amazing Devices</div>
							<div class="avds_text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus.</div>
							<div class="avds_link avds_xl_link"><a href="results.gsp">See More</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Icon Boxes -->

	<div class="icon_boxes">
		<div class="container">
			<div class="row icon_box_row">
				
				<!-- Icon Box -->
				<div class="col-lg-4 icon_box_col">
					<div class="icon_box">
						<div class="icon_box_image"><img src="${resource(file:'images/icon_1.svg', absolute: true)}" alt=""></div>
						<div class="icon_box_title">Free Shipping Worldwide</div>
						<div class="icon_box_text">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie.</p>
						</div>
					</div>
				</div>

				<!-- Icon Box -->
				<div class="col-lg-4 icon_box_col">
					<div class="icon_box">
						<div class="icon_box_image"><img src="${resource(file:'images/icon_2.svg', absolute: true)}" alt=""></div>
						<div class="icon_box_title">Free Returns</div>
						<div class="icon_box_text">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie.</p>
						</div>
					</div>
				</div>

				<!-- Icon Box -->
				<div class="col-lg-4 icon_box_col">
					<div class="icon_box">
						<div class="icon_box_image"><img src="${resource(file:'images/icon_3.svg', absolute: true)}" alt=""></div>
						<div class="icon_box_title">24h Fast Support</div>
						<div class="icon_box_text">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie.</p>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>