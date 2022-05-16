<%@ page language="java" session="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="fs-4">
	<c:if test="${ empty list }">
		<p class="alert alert-warning">No Data</p>
	</c:if>
	<c:if test="${ !empty list }">
		<!-- Message Alert -->
		<c:if test="${ !empty sessionScope.message }">
			<div class="alert alert-success fs-4 text-center">${ sessionScope.message}</div>
			<c:remove var="message" scope="session" />
		</c:if>
		<table class="table fw-bold">
			<thead>
				<tr class="fs-3">
					<td>Username</td>
					<td>Password</td>
					<td>Email</td>
					<td>Role</td>
					<td colspan="2">
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${list}">
					<tr>
						<td>${user.username}</td>
						<c:choose>
							<c:when test="${user.password.length()>0 }">
								<td>******</td>
							</c:when>
							<c:when test="${user.password.length()==0}">
								<td>No Password</td>
							</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
						<td>${user.email}</td>
						<td>${user.role==1?'VIP':'Normal'}</td>
						<td><a class="btn btn-warning fs-5"
							href="/Assignment/users/edit?username=${user.username }">Edit</a></td>
						<td><a class="btn btn-danger fs-5" data-bs-toggle="modal"
							data-bs-target="#Modal${user.username }">Remove</a></td>
					</tr>
					<div class="modal fade" id="Modal${user.username }" tabindex="-1"
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
									Do you want to delete this account? <b>${user.username}</b>
									will be removed from user list
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary fs-5"
										data-bs-dismiss="modal">No</button>
									<a href="/Assignment/users/delete?username=${user.username }"><button
											type="button" class="btn btn-primary fs-5">Yes</button></a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</tbody>
		</table>
	</c:if>

</div>