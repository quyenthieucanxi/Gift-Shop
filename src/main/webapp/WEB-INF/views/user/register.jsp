<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="registration-form">
	<div class="container">
		<div class="dreamcrub">
			<ul class="breadcrumbs">
				<li class="home"><a href="<c:url value='/trang-chu'/> "
					title="Go to Home Page">Home</a>&nbsp; <span>&gt;</span></li>
				<c:if test="${error != null}" >
					<li class="home"><div><h1 style="color: red ">${error}</h1></div>
			</a>&nbsp; <span>&gt;</span></li>
				</c:if>
				<li class="women">Đăng ký</li>
			</ul>
			<ul class="previous">
				<!-- <li><a href="index.html">Back to Previous Page</a></li> -->
				<li><button onclick="backButton()">Back to Previous
						Page</button></li>
				<script>
					function backButton() {
						window.history.back();
					}
				</script>
			</ul>
			<div class="clearfix"></div>
		</div>
			<c:if test="${error != null}" >
							<div><h1 style="color: red ">${error}</h1></div>
			</c:if>
		<div class="registration-grids">
			<h3 class="head text-center" style="margin-bottom: 30px;">Đăng ký</h3>
			<p class="text-center">Đăng nhập để có thể mua sắm tại MeowMeowShop</p>
			<p class="text-center">
				Nếu bạn đã có tài khoản, bạn có thể <a href="<c:url value='/login'/>"> đăng nhập </a> tại</a>
			</p>
			
			<div class="reg">
				<form:form action="register" method="POST" modelAttribute="user">
					<div class="reg-form">
						<ul>
							<li class="text-info">Họ tên khách hàng:</li>
							<li><form:input type="text" path="full_name" /></li>

						</ul>
						<ul>
							<li class="text-info">Giới tính:</li>
							<li><form:radiobutton path="id_gender" value="1" label="nam" />
								<form:radiobutton path="id_gender" value="2" label="nữ" /></li>
						</ul>

						<ul>
							<li class="text-info">Ngày tháng năm sinh:</li>
							<li><form:input type="date" path="birthdate" /></li>

						</ul>

						<ul>
							<li class="text-info">Tên đăng nhập:</li>
							<li><form:input type="text" path="login_name" /></li>
						</ul>
						<ul>
							<li class="text-info">Mật khảu:</li>
							<li><form:input type="password" path="hashed_passwd" /></li>
						</ul>


					</div>
					<div class="reg-right">
						<%-- <ul>
							<li class="text-info">Địa chỉ:</li>
							<li><form:input type="text" path="id_address" /></li>
						</ul> --%>
						<ul>
							<li class="text-info">Email:</li>
							<li><form:input type="text" path="email" /></li>
						</ul>
						<ul>
							<li class="text-info">Số điện thoại:</li>
							<li><form:input type="text" path="phone" /></li>
						</ul>
					</div>
					<div class="col-sm-12">
						<input type="submit" value="Đăng ký">
						<p class="click">
							Bằng cách nhấn vào nút đăng ký, bạ đồng ý với điều khoản của
							chúng tôi</a>
						</p>
						
					</div>
				</form:form>

			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- registration-form -->
