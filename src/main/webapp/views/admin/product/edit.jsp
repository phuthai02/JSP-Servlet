<%@ page language="java" contentType="text/html; charset=UTF-8"
	session="true" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="row">
	<div class="col-xl-3"></div>
	<div class="col-xl-6">
		<div class="fs-4 h-100">
			<!-- Error -->
			<c:if test="${ !empty sessionScope.error }">
				<div class="alert alert-danger fs-4 text-center">${ sessionScope.error }</div>
				<c:remove var="error" scope="session" />
			</c:if>
			<div class="fs-1 fw-bold text-center">Edit Product</div>
			<hr>
			<form action="/Assignment/products/update?id=${p.id}"
				class=" align-self-center" method="post">
				<div>
					<label class="fw-bold">Product's Name</label> <input name="name" required="required"
						type="text" value="${p.name }" name="name"
						class="form-control fs-5" autocomplete="off">
				</div>
				<div class="mt-2">
					<label class="fw-bold">Category</label> <select
						class="form-select fs-5" name="categoryID">
						<c:forEach var="c" items="${listCategory }">
							<option ${p.category.id==c.id?'selected':''} value="${c.id}">${c.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="mt-2">
					<label class="fw-bold">Amount</label> <input name="count" required="required"
						type="number" value="${p.count }" class="form-control fs-5"
						autocomplete="off">
				</div>
				<div class="mt-2">
					<label class="fw-bold">Price</label> <input name="price" required="required"
						type="number" value="${p.price }" class="form-control fs-5">
				</div>
				<div class="mt-2">
					<label class="fw-bold">Description</label> <input name="color" required="required"
						type="text" value="${p.color }" class="form-control fs-5"
						autocomplete="off">
				</div>
				<div class="mt-2">
					<label class="fw-bold">Size</label> <select
						class="form-select fs-5" name="size">
						<option value="1" ${p.size==1?'selected':''}>Small</option>
						<option value="2" ${p.size==2?'selected':''}>Medium</option>
						<option value="3" ${p.size==3?'selected':''}>Large</option>
					</select>
				</div>
				<div class="mt-2">
					<label class="fw-bold">Images</label> <input name="img" required="required"
						value="${p.img }" type="file" class="form-control fs-5">
				</div>
				<hr>
				<div class="mt-2">
					<button class="btn btn-primary fs-4">Edit now</button>
					<button type="reset" class="btn btn-secondary ms-2 fs-4">Clear</button>
				</div>
			</form>
		</div>
	</div>
	<div class="col-xl-3"></div>
</div>