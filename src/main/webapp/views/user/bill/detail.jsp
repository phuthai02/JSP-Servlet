<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="row">
	<div class="col-xl-2"></div>
	<div class="col-xl-8 fs-4">
		<!-- Error Alert -->
		<c:if test="${ !empty sessionScope.error }">
			<div class="alert alert-danger fs-4 text-center">${ sessionScope.error }</div>
			<c:remove var="error" scope="session" />
		</c:if>
		<hr>
		<div class="text-center fw-bold mb-3 fs-2">
			----------------------Thông tin đơn hàng----------------------</div>
		<form>
			<div class="row fw-bold mb-3">
				<div class="col-xl-6">
					<label for="hoten">Họ và tên: ${bill.hoten }</label>
				</div>
				<div class="col-xl-6">
					<label for="hoten">Số điện thoại: ${bill.sdt }</label>
				</div>
			</div>
			<div class="row fw-bold mb-3">
				<div class="col-xl-6">
					<label for="hoten">Địa chỉ nhận hàng: ${bill.diachi }</label>
				</div>
				<div class="col-xl-6">
					<label for="hoten">Phương thức thanh toán:
						${bill.thanhtoan=='atm'?'ATM/Ví':'Tiền mặt' }</label>
				</div>
			</div>
			<div class="row fw-bold mb-3">
				<label>Trạng thái: <c:choose>
						<c:when test="${bill.trangthai==0 }">Chờ xác nhận</c:when>
						<c:when test="${bill.trangthai==-1 }">Đã từ chối</c:when>
						<c:otherwise>Đã xác nhận</c:otherwise>
					</c:choose></label>
			</div>

			<div class="text-center fw-bold mt-3">
				----------------------****----------------------</div>
			<hr>
			<table class="table fw-bold mb-5" id="tableCart">
				<thead>
					<tr class="fs-3">
						<td class="col-xl-2">Sản phẩm</td>
						<td class="col-xl-2  text-center">Đơn giá($)</td>
						<td class="col-xl-3  text-center">Số lượng</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="p" items="${bill.detailBills}">
						<tr class="fw-bold">
							<td class="col-xl-2">${p.product.name }</td>
							<td class="col-xl-2  text-center">${p.price }</td>
							<td class="col-xl-3  text-center">${p.amount }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr>
			<label class="fs-2 fw-bold">Tổng tiền(bao gồm VAT):
				${tongtien }$</label>
			<hr>
			<c:if test="${bill.trangthai==0 }">
				<button type="button" class="btn btn-primary fs-4"
					data-bs-toggle="modal" data-bs-target="#Modal${bill.mavd }">Huỷ
					đặt hàng</button>
			</c:if>
			<c:if test="${bill.trangthai!=0 }">
				<button type="button" class="btn btn-primary fs-4">Liên hệ</button>
			</c:if>
			<button type="button" class="btn btn-secondary fs-4">Huỷ</button>
			<div class="modal fade" id="Modal${bill.mavd }" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h2 class="modal-title fw-bold" id="exampleModalLabel">PT
								Coffee</h2>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							Do you want to delete this bill? <b>${bill.mavd}</b> will be
							removed from bill list
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary fs-5"
								data-bs-dismiss="modal">No</button>
							<a href="/Assignment/bill/delete?mavd=${bill.mavd }"><button
									type="button" class="btn btn-primary fs-5">Yes</button></a>
						</div>
					</div>
				</div>
		</form>
	</div>
	<div class="col-xl-2"></div>
</div>