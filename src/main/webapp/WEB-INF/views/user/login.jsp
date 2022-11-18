<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- content-section-starts -->
<div class="content">
	<div class="container">
		<div class="login-page">
			<div class="dreamcrub">
				<ul class="breadcrumbs">
					<li class="home"><a href="<c:url value='/trang-chu'/> "
						title="Go to Home Page">Home</a>&nbsp; <span>&gt;</span></li>
					<li class="women">Login</li>
				</ul>
				<ul class="previous">
					<!-- 	<li><a href="index.html">Back to Previous Page</a></li> -->
					<li><button onclick="backButton()">Back to Previous
							Page</button></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="account_grid">
				<div class="col-md-12 login-right wow fadeInRight"
					data-wow-delay="0.4s">
					<h3 class="head text-center" style="margin-bottom: 30px;">ĐĂNG NHẬP</h3>
					<p style="font-size: 26px" class="text-center">Nếu bạn chưa có tài khoản, hãy <a class="acount-btn"
							href="<c:url value='/register'/>">Đăng ký</a></p>
					<h3>ĐĂNG NHẬP</h3>

					<form:form action="login" method="POST" modelAttribute="user">
						<div>
							<span>Tài khoản<label>*</label></span>
							<form:input type="text" path="login_name" />
						</div>
						<div>
							<span>Mật khẩu<label>*</label></span>
							<form:input path="hashed_passwd" type="password" />
						</div>
						<input type="submit">
						<a class="forgot" href="#">Quên mật khẩu?</a>

						<%-- <div><form:input path="full_name" readonly="true" /><br/> <br/></div> --%>
						<a
							href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8000/DemoSpringMVC/login-google&response_type=code
   			 	&client_id=739512159260-4jce7u76l628k8i8rde3mkrm3bti05i1.apps.googleusercontent.com&approval_prompt=force">Đăng
							nhập với tài khoản Google</a>
						<h1>${message}</h1>
					</form:form>

				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<script>
			function backButton() {
				window.history.back();
			}
		</script>
	</div>

</div>
