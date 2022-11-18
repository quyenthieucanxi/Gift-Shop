<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">Danh sách hóa đơn</h4>
		</div>
	</div>
</div>
<div class="container-fluid">
	<!-- Start Page Content -->
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Danh mục</h5>
					<div class="table-responsive">
						<table id="zero_config" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Id</th>
									<th>Tên đăng nhập</th>
									<th>Họ tên</th>
									<th>Số điện thoại</th>
									<th>Email</th>
									<th>Tổng tiền</th>
									<th>Số lượng</th>
									<!-- <th>Is Delete</th> -->
								</tr>
							</thead>
							<c:forEach var="item" items="${Bill}">
							<tbody>
								<tr>
									<td>${item.id}</td>
									<td>${item.login_name}</td>
									<td>${item.full_name}</td>
									<td>${item.phone}</td>
									<td>${item.email}</td>
									<td>${item.total}</td>
									<td>${item.quantity}</td>
									<%-- <td>${item.is_delete }</td> --%>
									<%-- <td><a href="<c:url value="/admin/EditAccount/${item.id}"/>">Update</a></td> --%>
								</tr>
							</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>