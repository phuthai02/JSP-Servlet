<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="fs-4 row">
	<div class="col-xl-2"></div>
	<div class="col-xl-8">
		<c:if test="${ empty list }">
			<p class="alert alert-warning">No Order</p>
		</c:if>
		<c:if test="${!empty list }">
			<!-- Message Alert -->
			<c:if test="${ !empty sessionScope.message }">
				<div class="alert alert-success fs-4 text-center">${ sessionScope.message}</div>
				<c:remove var="message" scope="session" />
			</c:if>
			<table class="table">
				<thead>
					<tr class="fs-4 fw-bold">
						<td>Mã vận đơn</td>
						<td class="text-center">Họ tên</td>
						<td class="text-center">Địa chỉ nhận hàng</td>
						<td class="text-center">Liên hệ</td>
						<td class="text-center">Trạng thái</td>
						<td class="text-center"></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="b" items="${list}">
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
							<td class="text-center text-primary"><a
								href="/Assignment/bill/detail?mavd=${b.mavd }"> <i
									class="fas fa-edit text-dark"></i>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
	<div class="col-xl-2"></div>
</div>