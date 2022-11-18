<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- content-section-starts -->
<div class="container">
	<div class="products-page">
		<div class="products">
			<div class="product-listy">
				<h2>our Products</h2>
				<ul class="product-list">
					<c:forEach var="item" items="${Category }">
						<li><a href="<c:url value='/product/${item.id}'/>"><span
								class="">${ item.cate_name }</span></a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="latest-bis">
				<img src="<c:url value='/template/user/images/${Product.image}'/>"
					class="img-responsive" alt="" />
				
			</div>


		</div>
		<div class="new-product">
			<div class="col-md-5 zoom-grid">
				<div class="flexslider">
					<ul class="slides">
						<li data-thumb="<c:url value='/template/user/images/${Product.image}'/>">
							<div class="thumb-image">
								<img
									src="<c:url value='/template/user/images/${Product.image}'/>"
									data-imagezoom="true" class="img-responsive" alt="" />
							</div>
						</li>
						<c:forEach var="item" items="${Image_Product }">
							<li
								data-thumb="<c:url value='/template/user/images/${item.image}'/>">
								<div class="thumb-image">
									<img src="<c:url value='/template/user/images/${item.image}'/>"
										data-imagezoom="true" class="img-responsive" alt="" />
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<form method="get" action="<c:url value='/AddCart/${Product.id}'/>">
				<div class="col-md-7 dress-info">
					<div class="dress-name">
						<h3>${Product.name_product }</h3>
						<span>${Product.purchase_price}</span>
						<div class="clearfix"></div>
						<p>${Product.desc_product}</p>
					</div>
					
					<div class="span span3">
						<p class="left">COLOR</p>
						<p class="right">${Product.color}</p>
						<div class="clearfix"></div>
					</div>
					<div class="span span4">
						<p class="left">Size</p>
						<p class="right">${Product.size }</p>
						<!-- <p class="right">
							<span class="selection-box"><select class="domains valid"
								name="domains">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
							</select></span>
						</p> -->
						<div class="clearfix"></div>
					</div>
					<input onclick="display()" class="cbp-vm-icon cbp-vm-add item_add" type="submit"
						value="Thêm vào giỏ hàng">
					<div class="purchase">
						<a href="<c:url value='/cart'/>">Purchase Now</a>
						<div class="social-icons">
							<ul>
								<li><a class="facebook1" href="#"></a></li>
								<li><a class="twitter1" href="#"></a></li>
								<li><a class="googleplus1" href="#"></a></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
					<script src="<c:url value='/template/user/js/imagezoom.js'/>"></script>
					<!-- FlexSlider -->
					<script defer
						src="<c:url value='/template/user/js/jquery.flexslider.js'/>"></script>
					<script>
						// Can also be used with $(document).ready()
						$(window).load(function() {
							$('.flexslider').flexslider({
								animation : "slide",
								controlNav : "thumbnails"
							});
						});
					</script>
				</div>
			</form>

			<div class="clearfix"></div>
			<div class="reviews-tabs">
				<!-- Main component for a primary marketing message or call to action -->
				<ul class="nav nav-tabs responsive hidden-xs hidden-sm" id="myTab">
					<li class="test-class active"><a class="deco-none misc-class"
						href="#how-to"> More Information</a></li>
					
				</ul>

				<div class="tab-content responsive hidden-xs hidden-sm">
					<div class="tab-pane active" id="how-to">
					<p class="tab-text">${Product.desc_product }</p>
						
					</div>
					
					
				</div>
			</div>

		</div>
		<div class="clearfix"></div>
	</div>
</div>

<div class="other-products products-grid">
	<div class="container">
		<header>
			<h3 class="like text-center">Sản Phẩm Liên Quan</h3>
		</header>
		<c:forEach var="item" items="${ProductCategory }" varStatus="loop">
			<div class="col-md-4 product simpleCart_shelfItem text-center">
				<a href="single.html"><img
					src="<c:url value='/template/user/images/${item.image }'/>" alt="" /></a>
				<div class="mask">
					<a href="single.html">Quick View</a>
				</div>
				<a class="product_name" href="single.html">${item.name_product }</a>
				<p>
					<a class="item_add" href="#"><i></i> <span class="item_price">${item.purchase_price }</span></a>
				</p>
			</div>
		</c:forEach>

		<div class="clearfix"></div>
	</div>
</div>


<script type="text/javascript">
				function display() {
					document.getElementById("success").style.display = "block";
				}
			</script>
<div class="popup" id="success">
	<div class="popup-content">
		<div class="imgbox">
			<img src=<c:url value='/template/user/images/iconSS.png'/> alt=""
				class="img-popup">
		</div>
		<div class="popup-title">
			<h3>Đã thêm sản phẩm vào giỏ hàng!</h3>
		</div>
	</div>
</div>
<!-- <script type="text/javascript">
				window.onload = display();
			</script> -->


<!-- content-section-ends -->