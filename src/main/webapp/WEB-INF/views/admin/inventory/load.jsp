<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">Sản phẩm có trong kho hàng <br><br><a href="<c:url value='/admin/create-inventory'/>">Thêm mới</a></h4>
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
									<th>Tên sản phẩm</th>
									<th>Giá bán</th>
									<th>Số lượng tồn kho</th>
									<th>Đã bán</th>
									<th>Ngày tạo</th>
									<th>Ngày cập nhật</th>
								</tr>
							</thead>
							<c:forEach var="item" items="${Inventory }">
							<tbody>
								<tr>
									<td>${item.id}</td>
									<c:forEach var="item1" items="${Product }">
									<c:if test="${item.id_product == item1.id}" >
									<td>${item1.name_product}</td>
									</c:if>
									</c:forEach>
									<td>${item.sale_price}</td>
									<td>${item.quantity}</td>
									<td>${item.sold}</td>
									<td>${item.create_at}</td>
									<td>${item.update_at}</td>
									<td><a href="<c:url value="/admin/DeleteInventory/${item.id}"/>">Remove</a></td>
									<td><a href="<c:url value="/admin/EditInventory/${item.id}"/>">Update</a></td>
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