<%@ page language="java" session="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>


<div class="fs-4">
	<c:if test="${ empty list }">
		<p class="alert alert-warning">No Data</p>
	</c:if>
	<c:if test="${ !empty list }">
		<!-- Message -->
		<c:if test="${ !empty sessionScope.message }">
			<div class="alert alert-success fs-4 text-center">${ sessionScope.message }</div>
			<c:remove var="message" scope="session"/>
		</c:if>
		<table class="table fw-bold">
			<thead>
				<tr class="fs-3">
					<td>Product's Name</td>
					<td>Category</td>
					<td>Amount</td>
					<td>Price</td>
					<td>Description</td>
					<td>Size</td>
					<td>Image</td>
					<td colspan="2">
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${list }">
					<tr>
						<td>${p.name }</td>
						<td>${p.category.id==1?"Machine Coffee":"Filter Coffee"}</td>
						<td>${p.count }</td>
						<td>${p.price }$</td>
						<td>${p.color }</td>
						<td><c:choose>
								<c:when test="${p.size==1 }">Small</c:when>
								<c:when test="${p.size==2 }">Medium</c:when>
								<c:otherwise>Large</c:otherwise>
							</c:choose></td>
						<td>${p.img }</td>
						<td><a class="btn btn-warning fs-5"
							href="/Assignment/products/edit?id=${p.id }">Edit</a></td>
						<td><a class="btn btn-danger fs-5" data-bs-toggle="modal"
							data-bs-target="#Modal${p.id }">Remove</a></td>
					</tr>
					<div class="modal fade" id="Modal${p.id }" tabindex="-1"
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
									Do you want to delete this product? <b>${p.name}</b> will be
									removed from product list
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary fs-5"
										data-bs-dismiss="modal">No</button>
									<a href="/Assignment/products/delete?id=${p.id }"><button
											type="button" class="btn btn-primary fs-5">Yes</button></a>
								</div>
							</div>
						</div>
				</c:forEach>
			</tbody>
		</table>
	</c:if>

</div>