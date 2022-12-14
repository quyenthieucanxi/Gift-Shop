<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	color: #1a202c;
	text-align: left;
	background-color: #e2e8f0;
}

.main-body {
	padding: 20px;
}

.card {
	box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0
		rgba(0, 0, 0, .06);
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
}

.card-body {
	flex: 1 1 auto;
	min-height: 1px;
	padding: 1rem;
}

.gutters-sm {
	margin-right: -8px;
	margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
	padding-right: 8px;
	padding-left: 8px;
}

.mb-3, .my-3 {
	margin-bottom: 1rem !important;
}

.bg-gray-300 {
	background-color: #e2e8f0;
}

.h-100 {
	height: 100% !important;
}

.shadow-none {
	box-shadow: none !important;
}
</style>
</head>
<body>
	<div class="container">
		<div class="main-body">

			<!-- Breadcrumb -->
			<nav aria-label="breadcrumb" class="main-breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">checkout
					</li>
				</ol>
			</nav>
			<!-- /Breadcrumb -->

			<%-- <div class="row gutters-sm">
				<div class="col-md-4 mb-3">
					<div class="card">
						<div class="card-body" style="height: 445px">
							<div class="d-flex flex-column align-items-center text-center" style="padding-top: 80px;">
								<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
									alt="Admin" class="rounded-circle" width="150">
								<div class="mt-3">
									<h4>${UserInfo.getFull_name()}</h4>
									<button class="btn btn-primary">${user.getId()}</button>
									<button class="btn btn-outline-primary">Message</button>
								</div>
							</div>
						</div>
					</div>
				</div> --%>
			<form:form action="${pageContext.request.contextPath}/checkout"
				method="POST" modelAttribute="bills">
				<div class="col-md-8">
					<div class="card mb-3">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">T??n ????ng Nh???p</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<form:input type="text" path="login_name" readonly="true" />
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">H??? T??n</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<form:input type="text" path="full_name" readonly="true" />
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">S??? ??i???n Tho???i</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<form:input type="text" path="phone" />

								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Email</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<form:input type="text" path="email" />
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Ghi ch??</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<form:input type="text" path="note" />
								</div>
							</div>
							<hr>

							<div class="row">
								<div class="col-sm-12">
									<input onclick="display()" type="submit" class="btn btn-primary px-4" 
										value="Save Changes">
								</div>
							</div>
						</div>
					</div>
				</div>
			</form:form>
			
		</div>
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
				<h3>??a?? thanh to??n th??nh c??ng!</h3>
			</div>
		</div>
	</div>

<!-- 
	<script type="text/javascript">
		window.onload = display();
	</script> -->

</body>
</html>