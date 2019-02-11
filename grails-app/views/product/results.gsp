<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="layout" content="userpanel" />
<title>Shakya</title>
	<asset:stylesheet href="categories.css" />
	<asset:stylesheet href="categories_responsive.css.css" />
	<asset:javascript src="categories.js" />
</head>
<body>

<!-- Home -->
%{--
	<div class="home">
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

<!-- Products -->

<div class="products">
	<div class="container">
		<div class="row">
			<div class="col">

				<!-- Product Sorting -->
				<div class="sorting_bar d-flex flex-md-row flex-column align-items-md-center justify-content-md-start">
					<div class="results">Showing <span>12</span> results</div>
					<div class="sorting_container ml-md-auto">
						<div class="sorting">
							<ul class="item_sorting">
								<li>
									<span class="sorting_text">Sort by</span>
									<i class="fa fa-chevron-down" aria-hidden="true"></i>
									<ul>
										<li class="product_sorting_btn" data-isotope-option='{ "sortBy": "original-order" }'><span>Default</span></li>
										<li class="product_sorting_btn" data-isotope-option='{ "sortBy": "price" }'><span>Price</span></li>
										<li class="product_sorting_btn" data-isotope-option='{ "sortBy": "stars" }'><span>Name</span></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">

				<div class="product_grid">

					<g:each in="${productList}" var="product">
						<!-- Product -->
						<div class="product">
							<div class="product_image"><img src="${resource(file:"/product/images/"+product.image,absolute: true)}" alt=""></div>
							<div class="product_extra product_new"><a href="results.gsp">New</a></div>
							<div class="product_content">
								<div class="product_title"><g:link action="unit" controller="product" params="[productId:product.id]">${product.name}</g:link></div>
								<div class="product_price">${product.price}</div>
							</div>
						</div>
					</g:each>


				</div>
				<div class="product_pagination">
					<ul>
						<li class="active"><a href="#">01.</a></li>
						<li><a href="#">02.</a></li>
						<li><a href="#">03.</a></li>
					</ul>
				</div>

			</div>
		</div>
	</div>
</div>

	<!-- Icon Boxes -->

	%{--<div class="icon_boxes">
		<div class="container">
			<div class="row icon_box_row">
				
				<!-- Icon Box -->
				<div class="col-lg-4 icon_box_col">
					<div class="icon_box">
						<div class="icon_box_image"><img src="../../../web-app/images/icon_1.svg" alt=""></div>
						<div class="icon_box_title">Free Shipping Worldwide</div>
						<div class="icon_box_text">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie.</p>
						</div>
					</div>
				</div>

				<!-- Icon Box -->
				<div class="col-lg-4 icon_box_col">
					<div class="icon_box">
						<div class="icon_box_image"><img src="../../../web-app/images/icon_2.svg" alt=""></div>
						<div class="icon_box_title">Free Returns</div>
						<div class="icon_box_text">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie.</p>
						</div>
					</div>
				</div>

				<!-- Icon Box -->
				<div class="col-lg-4 icon_box_col">
					<div class="icon_box">
						<div class="icon_box_image"><img src="../../../web-app/images/icon_3.svg" alt=""></div>
						<div class="icon_box_title">24h Fast Support</div>
						<div class="icon_box_text">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie.</p>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>--}%

	<!-- Newsletter -->

</body>
</html>