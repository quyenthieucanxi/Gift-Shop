<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- header-section-starts -->
<div class="header">
	<div class="header-top-strip">
		<div class="container">
			<div class="header-top-left">
				<ul>
					<c:if test="${empty UserInfo}">
						<c:if test="${empty UserGooGle}">
							<li><a href="<c:url value='/login'/> "><span
									class="glyphicon glyphicon-user"> </span>Login</a></li>
							<li><a href="<c:url value='/register'/> "><span
									class="glyphicon glyphicon-lock"> </span>Create an Account</a></li>

						</c:if>
					</c:if>
					<li><form:form
							action="${pageContext.request.contextPath}/search" method="POST">
							<input class="header-search-bar" type="text" name="keyword"
								id="keyword" value="${keyword}" style="width: 408px" />
							<input class="header-search-bar-button" type="submit"
								value="Tìm kiếm" />
						</form:form></li>
					<!-- <li>
				<div class="input-group">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="button">Go!</button>
		      </span>
		      <input type="text" class="form-control" placeholder="Search for...">
		    </div>
					</li> -->


				</ul>
			</div>
			<div class="header-right">

				<div class="cart box_1">
					<p >
						<a href="<c:url value='/cart'/> " class="simpleCart_empty">GIỎ HÀNG</a> <img 
							src="<c:url value='/template/user/images/bag.png'/> " alt="">
					</p>
					<br> <a href="<c:url value='/cart'/> ">
						<h3>
							<span class=""> ${TotalPrice} đ</span> (<span id="" class="">
								${TotalQuantity} </span>)
						</h3>
					</a>
					<div class="clearfix"></div>
				</div>


				<%-- <a href="<c:url value='/cart'/> ">
							<h3>
								<span class="simpleCart_total"> 0 </span> (<span
									id="simpleCart_quantity" class="simpleCart_quantity"> 0 </span>)<img src="<c:url value='/template/user/images/bag.png'/> " alt="">
							</h3>
						</a> --%>
				<c:if test="${not empty UserInfo}">
						<p class="simpleCart_empty">
						<a href="<c:url value='/profile/${UserInfo.getLogin_name() }' />">${UserInfo.getFull_name()}</a>
						<span><a href="<c:url value='/logout'/>">Logout</a></span>
					</p>
					<%-- <p>${pageContext.request.userPrincipal.name}</p> --%>
				</c:if>
				<c:if test="${not empty UserGooGle}">
						<p class="simpleCart_empty">
						<a href="<c:url value='/profile/${UserInfo.getLogin_name() }' />">${UserGooGle.getEmail()}</a>
						<span><a href="<c:url value='/logout'/>">Logout</a></span>
					</p>
					<p>${pageContext.request.userPrincipal.name}</p>
				</c:if>

			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- header-section-ends -->
<div class="banner-top">
	<div class="container">
		<nav class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="logo">
					<a href="<c:url value='/trang-chu'/> "><img width="150px"
						height="auto"
						src="<c:url value='/template/user/images/logo.png'/> " alt=""></a>
				</div>
			</div>
			<!--/.navbar-header-->

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="<c:url value='/trang-chu'/> ">Home</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">SẢN PHẨM <b class="caret"></b></a>
						<ul class="dropdown-menu multi-column columns-3">
							<div class="row" >
								<div class="col-sm-4">
									<ul class="multi-column-dropdown">
										<c:forEach var="item" items="${Category }">
											<li><a href="<c:url value='/product/${item.id}'/>"><span class="">${ item.cate_name }</span></a></li>
										</c:forEach>		
									</ul>
								</div>
							</div>
						</ul>
					</li>
					<li><a href="#">CONTACT</a></li>
				</ul>
			</div>
			<!--/.navbar-collapse-->
		</nav>
		<!--/.navbar-->
	</div>
</div>