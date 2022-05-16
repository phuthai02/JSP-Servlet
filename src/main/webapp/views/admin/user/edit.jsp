<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="row">
	<div class="col-xl-3"></div>
	<div class="col-xl-6">
		<div class="fs-4 h-100">

			<!-- Error Alert -->
			<c:if test="${ !empty sessionScope.error }">
				<div class="alert alert-danger fs-4 text-center">${ sessionScope.error }</div>
				<c:remove var="error" scope="session" />
			</c:if>

			<div class="fs-1 fw-bold text-center">Edit User</div>
			<hr>
			<form action="/Assignment/users/update?username=${u.username }"
				class=" align-self-center" method="post">
				<div>
					<label class="fw-bold">Username</label> <input name="username" required="required"
						type="text" value="${u.username }" disabled="true"
						class="form-control fs-5" autocomplete="off">
				</div>
				<div class="mt-2">
					<label class="fw-bold">Email</label> <input name="email" required="required"
						type="email" value="${u.email }" class="form-control fs-5"
						autocomplete="off">
				</div>
				<div class="mt-2">
					<label class="fw-bold">Password</label> <input name="password" required="required"
						type="password" value="${u.password }" class="form-control fs-5">
				</div>
				<div class="mt-2">
					<label class="fw-bold">Role</label> <select name="role" 
						class="form-select fs-5">
						<option value="1" ${u.role==1?'selected':''}>VIP</option>
						<option value="0" ${u.role==0?'selected':''}>Normal</option>
					</select>
				</div>
				<hr>
				<div class="mt-2">
					<button class="btn btn-primary fs-4">Edit now</button>
					<button type="reset" class="btn btn-secondary ms-2 fs-4">Clear</button>
				</div>
				<div class="text-center mt-5">
					<img height="300px" src="/Assignment/images/phuthai.png">
				</div>
			</form>
		</div>
	</div>
	<div class="col-xl-3"></div>
</div>