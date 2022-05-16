<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<c:if test="${ empty list }">
	<p class="alert alert-warning">No Data</p>
</c:if>
<c:if test="${ !empty list }">
	<div class="row">
		<c:if test="${ !empty sessionScope.message }">
			<div class="alert alert-success fs-4 text-center">${ sessionScope.message }</div>
			<c:remove var="message" scope="session" />
		</c:if>
		<c:if test="${ !empty sessionScope.error }">
			<div class="alert alert-danger fs-4 text-center">${ sessionScope.error }</div>
			<c:remove var="error" scope="session" />
		</c:if>
		
		<form action="/Assignment/products/show" method="get" class="mb-3 mt-3">
			<div class="row">
				<div class="col-xl-5">
					<select class="form-select fs-4 fw-bold text-center" name="cate_id">
						<option value="null" disabled selected>---</option>
						<option value="1">Machine Coffee</option>
						<option value="2">Filter Coffee</option>
					</select>
				</div>
					<div class="col-xl-3">
					<select class="form-select fs-4 fw-bold text-center" name="star">
					<option value="null" disabled selected>---</option>
						<option value="5">5 sao</option>
						<option value="4.5">4.5 sao</option>
						<option value="4">4 sao</option>
					</select>
				</div>
					<div class="col-xl-3">
					<select class="form-select fs-4 fw-bold text-center" name="price">
					<option value="null" disabled selected>---</option>
						<option value="4">Nhỏ hơn 30$</option>
						<option value="4.5">30$ đến 50$</option>
						<option value="5">Lớn hơn 50$</option>
					</select>
				</div>
				<div class="col-xl-1">
					<button class="btn btn-primary fs-4 w-100">Lọc</button>
				</div>
			</div>
		</form>
		
		<c:forEach var="p" items="${list }">
			<div class="col-sm-3 mb-3">
				<div class="card">
					<img src="/Assignment/images/${p.img }" height="200px" alt=""
						class="card-img-top">
					<div class="card-body text-center">
						<div class="card-title">
							<h2>
								<b>${p.name }</b>
							</h2>
						</div>
						<div class="card-text">
							<h4>
								<b>${p.price }$</b>
							</h4>
						</div>
						<div class="card-star text-warning fs-4 mb-2">
							<c:choose>
								<c:when test="${p.price<=30 }">
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star text-dark"></i>
								</c:when>
								<c:when test="${p.price>=50 }">
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
								</c:when>
								<c:otherwise>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star-half-stroke"></i>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="action" ${sessionScope.user==null?'hidden':''}>
							<form id="form-add-cart${p.id }"
								action="/Assignment/cart/add?username=${sessionScope.user.username }&pid=${p.id }"
								method="post">
								<input type="number" name="amount" min="0" max="${p.count }"
									class="form-control mb-3 border-2 fs-5 text-center"
									placeholder="Please enter quantity" required>
								<button type="submit"
									class="btn btn-outline-danger fs-5 border-2 fw-bold">Add
									to card</button>
							</form>
						</div>
						<div class="more" ${sessionScope.user==null?'':'hidden'}>
							<button
								class="btn btn-outline-success fs-5 border-2 fw-bold mt-3"
								id="user-btn" type="button" data-bs-toggle="offcanvas"
								data-bs-target="#offcanvasNavbar"
								aria-controls="offcanvasNavbar">Order now</button>
							<button
								class="btn btn-outline-danger fs-5 border-2 fw-bold mt-3 ms-1">
								More&ensp;<i class="fa-solid fa-forward"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</c:if>