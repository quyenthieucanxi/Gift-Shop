<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">Danh sách sản phẩm<br><br><a href="<c:url value='/admin/create-product'/>">Thêm mới</a></h4>
		</div>
	</div>
</div>
<div class="container-fluid">
	<!-- Start Page Content -->
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Sản phẩm</h5>
					<div class="table-responsive">
						<table id="zero_config" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Id</th>
									<th >Ảnh</th>
									<th>Thuộc danh mục</th>
									<th>Tên sản phẩm</th>
									<th>Giá sản phẩm</th>
									<!-- <th>Giá khuyến mãi</th> -->
									<th>Mô tả</th>
									<!-- <th>Sản phẩm mới</th> -->
									<!-- <th>Sản phẩm nổi bật</th> -->
									<th>Ngày tạo</th>
									<th>Ngày cập nhật</th>
									<th>Màu sắc</th>
									<th>kích thước</th>
									
								</tr>
							</thead>
							<c:forEach var="item" items="${Product }">
							<tbody>
								<tr>
									<td>${item.id}</td>
									<td ><img style="width:100%" src="<c:url value='/template/user/images/${item.image}'/> " class="img-responsive" alt="" /></td>
									<td>${item.id_category}</td>
									<td>${item.name_product}</td>
									<td>${item.purchase_price}</td>
									<%-- <td>${item.promotional_price}</td> --%>
									<td>${item.desc_product}</td>
									<%-- <td>${item.new_product}</td> --%>
									<%-- <td>${item.featured_product}</td> --%>
									<td>${item.create_at}</td>
									<td>${item.update_at}</td>
									<td>${item.color}</td>
									<td>${item.size}</td>
									<td><a href="<c:url value="/admin/DeleteProduct/${item.id}"/>">Remove</a></td>
									<td><a href="<c:url value="/admin/EditProduct/${item.id}"/>">Update</a></td>
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