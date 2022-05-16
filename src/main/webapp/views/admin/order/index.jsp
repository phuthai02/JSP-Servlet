<%@ page language="java" session="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="row fs-3">


		<!-- Error Alert -->
		<c:if test="${ !empty sessionScope.error }">
			<div class="alert alert-danger fs-4 text-center">${ sessionScope.error }</div>
			<c:remove var="error" scope="session" />
		</c:if>
		<!-- Message Alert -->
		<c:if test="${ !empty sessionScope.message }">
			<div class="alert alert-success fs-4 text-center">${ sessionScope.message}</div>
			<c:remove var="message" scope="session" />
		</c:if>
		<form action="/Assignment/order/index">
			<div class="row">
				<div class="col-xl-10">
					<select class="form-select fs-4 fw-bold text-center" name="stt">
						<option value="null" disabled selected>---</option>
						<option value="0">Chờ xác nhận</option>
						<option value="1">Đã xác nhận</option>
						<option value="-1">Đã huỷ</option>
					</select>
				</div>
				<div class="col-xl-2">
					<button class="btn btn-primary fs-4 w-100">Lọc đơn</button>
				</div>
			</div>
		</form>
		<table class="table mt-3">
			<thead>
				<tr class="fs-3 fw-bold">
					<td>Mã vận đơn</td>
					<td class="text-center">Họ tên</td>
					<td class="text-center">Địa chỉ</td>
					<td class="text-center">Liên hệ</td>
					<td class="text-center">Trạng thái</td>
					<td class="text-center"></td>
					<td class="text-center"></td>
					<td class="text-center"></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${list }">
					<tr class="fw-bold">
						<td>${b.mavd }</td>
						<td class="text-center"">${b.hoten }</td>
						<td class="text-center">${b.diachi }</td>
						<td class="text-center">${b.sdt }</td>
						<td class="text-center"><c:choose>
								<c:when test="${b.trangthai==0 }">Chờ xác nhận</c:when>
								<c:when test="${b.trangthai==-1 }">Đã từ chối</c:when>
								<c:otherwise>Đã xác nhận</c:otherwise>
							</c:choose></td>
						<td class="text-center"><a
							href="/Assignment/bill/detail?mavd=${b.mavd }"> <i
								class="fas fa-edit text-dark"></i>
						</a></td>
						<c:if test="${b.trangthai==0 }">
							<td class="text-center"><a
								href="/Assignment/order/update?mavd=${b.mavd }&tt=1"> <i
									class="fas fa-check-square text-success"></i>
							</a></td>
						</c:if>
						<c:if test="${b.trangthai==0 }">
							<td class="text-center"><a
								href="/Assignment/order/update?mavd=${b.mavd }&tt=-1"> <i
									class="fas fa-times-circle text-danger"></i>
							</a></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>


</div>
