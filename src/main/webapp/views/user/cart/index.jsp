<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="fs-4">
	<c:if test="${ empty list }">
		<p class="alert alert-warning">No Product</p>
	</c:if>
	<c:if test="${ !empty list }">
		<hr>
		<div class="text-center fw-bold mb-3 fs-2">
			----------------------Thông tin nhận hàng----------------------</div>
		<form
			action="/Assignment/cart/update?username=${sessionScope.user.username }"
			method="post">
			<div class="row fw-bold mb-3">
				<div class="col-xl-6">
					<label for="hoten">Họ và tên: </label> <input type="text"
						class="form-control fs-5" autocomplete="off" required="required" name="hoten">
				</div>
				<div class="col-xl-6">
					<label for="hoten">Số điện thoại: </label> <input type="text"
						class="form-control fs-5" autocomplete="off" required="required" name="sdt">
				</div>
			</div>
			<div class="row fw-bold mb-3">
				<div class="col-xl-6">
					<label for="hoten">Địa chỉ nhận hàng: </label> <input type="text"
						class="form-control fs-5" autocomplete="off" required="required" name="diachi">
				</div>
				<div class="col-xl-6">
					<label for="hoten">Phương thức thanh toán: </label> <select name="thanhtoan"
						class="form-select fs-5" id="">
						<option value="tt">Thanh toán trực tiếp</option>
						<option value="atm">Thanh toán ATM/Ví điện tử</option>
					</select>
				</div>
			</div>

			<div class="text-center fw-bold mt-3">
				----------------------****----------------------</div>
			<hr>
			<table class="table fw-bold mb-5" id="tableCart">
				<thead>
					<tr class="fs-3">
						<td class="col-xl-1"></td>
						<td class="col-xl-2">Sản phẩm</td>
						<td class="col-xl-2  text-center">Đơn giá($)</td>
						<td class="col-xl-3  text-center">Số lượng</td>
						<td class="col-xl-2  text-center">Số tiền($)</td>
						<td class="col-xl-1"></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${list}">
						<tr>
							<td class="text-center"><input type="checkbox"
								name="check${p.product.id }" id="check${p.product.id }"
								onclick="enableTr(${p.product.id},${p.product.count})"
								class="form-check-input p-3"></td>
							<td>${p.product.name }</td>
							<td class="text-center" id="price${p.product.id }">${p.price }</td>

							<td class="text-center">
								<div class="row">
									<div class="col-xl-4">
										<button disabled="true" type="button"
											onclick="cartChange(${p.product.id},'sub',${p.product.count})"
											id="sub${p.product.id}"
											class="btn btn-danger fw-bold fs-4 border-0 ps-4 pe-4 pt-1 pb-1 m-0">
											<i class="fa-solid fa-minus"></i>
										</button>
									</div>
									<div class="col-xl-4">
										<input type="text" disabled="true" id="amount${p.product.id }"
											value="${p.amount }" name="amount${p.product.id }"
											class="form-control fw-bold fs-4 text-center">
									</div>
									<div class="col-xl-4">
										<button disabled="true" type="button"
											onclick="cartChange(${p.product.id},'plus',${p.product.count})"
											id="plus${p.product.id}"
											class="btn btn-primary fw-bold fs-4 border-0 ps-4 pe-4 pt-1 pb-1 m-0">
											<i class="fa-solid fa-plus"></i>
										</button>
									</div>
								</div>
							</td>
							<td class="text-center" id="sumPrice${p.product.id }">${p.price * p.amount}</td>
							<td class="text-center"><a type="button"
								data-bs-toggle="modal" data-bs-target="#Modal${p.product.id }">Xoá</a></td>
						</tr>
						<div class="modal fade" id="Modal${p.product.id }" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h2 class="modal-title fw-bold" id="exampleModalLabel">PT
											Coffee</h2>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										Do you want to delete this product? <b>${p.product.name}</b>
										will be removed from cart
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary fs-5"
											data-bs-dismiss="modal">No</button>
										<a
											href="/Assignment/cart/delete?username=${sessionScope.user.username }&pid=${p.product.id}"><button
												type="button" class="btn btn-primary fs-5">Yes</button></a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<h3 class="fw-bold">
					Tiền sản phẩm: <b id="tien">0</b> $
				</h3>
				<h3 class="fw-bold">
					Phí Vat: <b id="vat">0</b>$
				</h3>
				<h1 class="fw-bold">
					Tổng cộng: <b id="tongcong">0</b>$ &emsp;
				</h1>
				<hr>
				<button type="submit" class="btn btn-success fs-4 fw-bold">Đặt
					hàng</button>
				<button type="button" class="btn btn-danger fs-4 fw-bold">Huỷ
					bỏ</button>
			</div>
		</form>
	</c:if>
</div>