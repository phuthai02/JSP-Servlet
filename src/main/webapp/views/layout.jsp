<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PT Coffee</title>
<script src="https://kit.fontawesome.com/860c02336a.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/Assignment/css/bootstrap.min.css">
<link rel="stylesheet" href="/Assignment/css/all.min.css">
<link rel="stylesheet" href="/Assignment/css/index.css">
<link rel="stylesheet"
	href="/Assignment/sweetalert/dist/sweetalert2.min.css">
</head>

<body>
	<div hidden="true"
		class="loading position-fixed top-0 left-0 w-100 h-100 opacity-100">
		<div class="load-item position-fixed text-center top-10 w-100 h-100">
			<img alt="" src="/Assignment/images/load.gif" width="65%">
		</div>
	</div>
	<div class="container-fluid">
		<header class="header">
			<nav class="navbar fixed-top">
				<div class="container navbar-expand-xl">
					<ul class="navbar-brand p-xl-2 p-sm-1 m-0">
						<a href="/Assignment/products/show"> <img
							src="/Assignment/images/logo.jpg" height="80px" alt=""></a>
					</ul>
					<div class="icons d-xl-none">
						<div class="fas fa-search" id="search-btn"></div>
						<a
							href="/Assignment/cart/index?username=${sessionScope.user.username }"
							class="p-0 m-0">
							<div class="fas fa-shopping-cart"
								${sessionScope.user!=null? '': 'hidden'} id="shopping-btn"></div>
						</a>
						<div class="fas fa-user-shield" id="setting-user-btn"
							type="button" data-bs-toggle="dropdown"
							${sessionScope.user.role==1? '': 'hidden'}></div>
						<div class="fas fa-user" id="user-btn1" type="button"
							data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
							aria-controls="offcanvasNavbar"></div>
						<ul class="dropdown-menu user-cog fs-4 p-2"
							aria-labelledby="setting-user-btn">
							<a href="/Assignment/products/create" class="p-0 m-0">
								<li class="dropdown-item"><i
									class="fas fa-plus-circle p-0 m-0"></i>&ensp;Add product...</li>
							</a>
							<a href="/Assignment/products/index" class="p-0 m-0">
								<li class="dropdown-item"><i
									class="fas fa-clipboard-list p-0 m-0"></i>&ensp;List of
									products</li>
							</a>
							<a href="#history" class="p-0 m-0">
								<li class="dropdown-item"><i class="fas fa-history p-0 m-0"></i>&ensp;History</li>
							</a>
							<a href="#analysis" class="p-0 m-0">
								<li class="dropdown-item"><i
									class="fas fa-balance-scale p-0 m-0"></i>&ensp;Analysis</li>
							</a>
							<li>
								<div class="dropdown-divider"></div>
							</li>
							<a href="/Assignment/users/create" class="p-0 m-0">
								<li class="dropdown-item"><i
									class="fas fa-user-plus p-0 m-0"></i>&ensp;Add user...</li>
							</a>
							<a href="/Assignment/users/index" class="p-0 m-0">
								<li class="dropdown-item"><i
									class="fas fa-address-book p-0 m-0"></i>&ensp;List of users</li>
							</a>
							<li>
								<div class="dropdown-divider"></div>
							</li>
							<a href="#report" class="p-0 m-0">
								<li class="dropdown-item"><i
									class="fas fa-exclamation-circle p-0 m-0"></i>&ensp;Report</li>
							</a>
							<a href="#support" class="p-0 m-0">
								<li class="dropdown-item"><i
									class="fas fa-info-circle p-0 m-0"></i>&ensp;Support</li>
							</a>
						</ul>
						<button class="navbar-toggler border-0" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<div class="fas fa-bars" id="menu-btn"></div>
						</button>

					</div>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
							<li><a href="#home" class="fs-3 fw-bold">Home</a></li>
							<li><a href="#about" class="fs-3 fw-bold">About</a></li>
							<li><a href="#menu" class="fs-3 fw-bold">Menu</a></li>
							<li><a href="/Assignment/products/show" class="fs-2 fw-bold">Products</a></li>
							<li><a href="#review" class="fs-3 fw-bold">Review</a></li>
							<li><a href="#contact" class="fs-3 fw-bold">Contact</a></li>
							<li><a href="#blogs" class="fs-3 fw-bold">Blogs</a></li>
						</ul>
						<ul
							class="navbar-nav ms-auto text-white d-none d-xl-block dropdown">
							<div class="fas fa-search" id="search-btn"></div>
							<a
								href="/Assignment/cart/index?username=${sessionScope.user.username }"
								" class="p-0 m-0"><div class="fas fa-shopping-cart"
									${sessionScope.user!=null?'':'hidden'} id="shopping-btn"></div></a>
									
									
							<div class="fas fa-user-shield" id="setting-user-btn"
								type="button" data-bs-toggle="dropdown"
								${sessionScope.user.role==1?'':'hidden'}></div>
								
								
							<div class="fas fa-user" id="user-btn2" type="button"
								data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
								aria-controls="offcanvasNavbar"></div>


							<ul class="dropdown-menu user-cog fs-4 p-2"
								aria-labelledby="setting-user-btn">
								<a href="/Assignment/products/create" class="p-0 m-0"><li
									class="dropdown-item"><i
										class="fas fa-plus-circle p-0 m-0"></i>&ensp;Add product...</li></a>
								<a href="/Assignment/products/index" class="p-0 m-0"><li
									class="dropdown-item"><i
										class="fas fa-clipboard-list p-0 m-0"></i>&ensp;List of
										products</li></a>
								<a href="#history" class="p-0 m-0"><li class="dropdown-item"><i
										class="fas fa-history p-0 m-0"></i>&ensp;History</li></a>
								<a href="/Assignment/order/index" class="p-0 m-0"><li
									class="dropdown-item"><i
										class="fas fa-balance-scale p-0 m-0"></i>&ensp;Order</li></a>
								<li><div class="dropdown-divider"></div></li>
								<a href="/Assignment/users/create" class="p-0 m-0"><li
									class="dropdown-item"><i class="fas fa-user-plus p-0 m-0"></i>&ensp;Add
										user...</li></a>
								<a href="/Assignment/users/index" class="p-0 m-0"><li
									class="dropdown-item"><i
										class="fas fa-address-book p-0 m-0"></i>&ensp;List of users</li></a>
								<li><div class="dropdown-divider"></div></li>
								<a href="#report" class="p-0 m-0"><li class="dropdown-item"><i
										class="fas fa-exclamation-circle p-0 m-0"></i>&ensp;Report</li></a>
								<a href="#support" class="p-0 m-0"><li class="dropdown-item"><i
										class="fas fa-info-circle p-0 m-0"></i>&ensp;Support</li></a>
							</ul>
						</ul>
					</div>
				</div>
				<!-- Login -->
				<div class="bg-light offcanvas offcanvas-end shadow" tabindex="-1"
					id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
					<div class="offcanvas-body userNav">
						<div class="close">
							<button type="button" class="btn-close text-reset"
								data-bs-dismiss="offcanvas" aria-label="Close"></button>
						</div>
						<div class="login" ${sessionScope.user==null?'':'hidden'}>
							<div class="mb-2">
								<h1 class="fw-bold text-center">LOGIN</h1>
								<hr>
							</div>
							<form action="/Assignment/login" method="post">
								<div class="mb-2">
									<label for="username" class="fw-bold fs-4">Username</label> <input
										type="text" class="form-control border-3 p-2 fs-5"
										name="username" id="username" autocomplete="off">
								</div>
								<div class="mb-2">
									<label for="password" class="fw-bold fs-4">Password</label> <input
										type="password" class="form-control border-3 p-2 fs-5"
										name="password" id="password" autocomplete="off">
								</div>
								<div class="mb-2 form-check">
									<input type="checkbox" class="form-check-input p-2"
										id="remember"> <label
										class="form-check-labe fs-5 fw-bold" for="remember">Remember
										me?</label>
								</div>
								<hr>
								<button class="btn btn-primary w-100 fs-5 fw-bold p-2 mb-2">
									Login now&emsp;<i class="fa-solid fa-right-to-bracket"></i>
								</button>
							</form>
							<div class="support">
								<div class="row">
									<div class="col-xl-6">
										<button class="btn btn-success w-100 fs-5 fw-bold p-2 mb-2">
											<a href="/Assignment/users/create">Register&ensp;<i
												class="fa-solid fa-id-card"></i></a>
										</button>
									</div>
									<div class="col-xl-6">
										<button class="btn btn-danger w-100 fs-5 fw-bold p-2 mb-2">
											Forgot password&ensp;<i class="fa-solid fa-unlock-keyhole"></i>
										</button>
									</div>
								</div>
							</div>
							<hr>
							<div class="orther">
								<div class="row">
									<div class="col-xl-4 mb-2">
										<div class="border-2 fs-1 border border-primary text-center">
											<i class="fab fa-facebook text-primary fw-bold"></i>
										</div>
									</div>
									<div class="col-xl-4 mb-2">
										<div class="border-2 fs-1 border border-danger text-center">
											<i class="fab fa-google-plus-g text-danger fw-bold"></i>
										</div>
									</div>
									<div class="col-xl-4 mb-2">
										<div class="border-2 fs-1 border border-dark text-center">
											<i class="fab fa-github text-dark fw-bold"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="info" ${sessionScope.user!=null?'':'hidden'}>
							<div class="mb-2">
								<h1 class="fw-bold text-center">INFOMATION</h1>
								<hr>
							</div>
							<div class="text-center mb-5">
								<img src="/Assignment/images/vip.png" width="150px" alt="">
							</div>
							<form
								action="/Assignment/update?username=${sessionScope.user.username }"
								method="post">
								<div class="row fs-4 fw-bold">
									<div class="col-sm-6 mb-2">
										<label for="username">Username</label> <input type="text"
											value="${sessionScope.user.username}"
											class="fs-5 fw-bold border border-2 form-control"
											name="username" disabled>
									</div>
									<div class="col-sm-6 mb-2">
										<label for="password">Password</label> <input type="password"
											value="${sessionScope.user.password}"
											class="fs-5 fw-bold border border-2 form-control"
											name="password" autocomplete="off">
									</div>
								</div>
								<div class="row fs-4 fw-bold">
									<div class="col-sm-12 mb-2">
										<label for="email">Email</label>
											<input type="email"
											value="${sessionScope.user.email}"
											class="fs-5 fw-bold border border-2 form-control"
											name="email" autocomplete="off">
									</div>
								</div>
								<hr>
								<div class="row m-1">
									<button class="btn btn-success w-100 fs-5 fw-bold p-2 mb-2">
										<a>Update&emsp;<i class="fa-solid fa-pen-to-square"></i>
										</a>
									</button>
								</div>
							</form>
							<div class="row m-1">
								<button class="btn btn-primary w-100 fs-5 fw-bold p-2 mb-2">
									<a
										href="/Assignment/bill/index?username=${sessionScope.user.username }">My
										orders&emsp;<i class="fa-solid fa-mug-hot"></i>
									</a>
								</button>
							</div>
							<div class="row m-1">
								<a href="/Assignment/logout" class="m-0 p-0 w-100">
									<button class="btn btn-danger w-100 fs-5 fw-bold p-2 mb-2" name="btn-logout">
										Logout&emsp;<i class="fa-solid fa-right-from-bracket"></i>
									</button>
								</a>
							</div>

						</div>
					</div>
				</div>
			</nav>
		</header>
		<!--Block header-->
		<header class="header">
			<nav class="navbar navbar-expand-xl">
				<div class="container">
					<ul class="navbar-brand p-xl-2 p-sm-1 m-0">
						<img src="/Assignment/images/logo.jpg" height="80px" alt="">
					</ul>
					<div class="icons d-xl-none">
						<div class="fas fa-search" id="search-btn"></div>
						<div class="fas fa-shopping-cart" id="shopping-btn"></div>
						<button class="navbar-toggler border-0" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<div class="fas fa-bars" id="menu-btn"></div>
						</button>
					</div>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
							<li><a href="#home" class="fs-3 fw-bold">Home</a></li>
							<li><a href="#about" class="fs-3 fw-bold">About</a></li>
							<li><a href="#menu" class="fs-3 fw-bold">Menu</a></li>
							<li><a href="#products" class="fs-2 fw-bold">Products</a></li>
							<li><a href="review" class="fs-3 fw-bold">Review</a></li>
							<li><a href="#contact" class="fs-3 fw-bold">Contact</a></li>
							<li><a href="#blogs" class="fs-3 fw-bold">Blogs</a></li>
						</ul>
						<ul class="navbar-nav ms-auto text-white d-none d-xl-block">
							<div class="fas fa-search" id="search-btn"></div>
							<div class="fas fa-shopping-cart" id="shopping-btn"></div>
							<div class="fas fa-sliders-h-square" id="setting-user-btn"></div>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<article class="article">
			<div class="row">
				<div class="row">
					<div class="col-xl-2"></div>
					<div class="col-xl-8 p-3">
						<jsp:include page="${view}"></jsp:include>
					</div>
					<div class="col-xl-2"></div>
				</div>
			</div>
		</article>
		<footer class="footer">
			<div class="box-container">
				<div class="box">
					<h3>Locations</h3>
					<a href="#"><i class="fas fa-map-marked-alt"></i>Hà Nội</a> <a
						href="#"><i class="fas fa-map-marked-alt"></i>Đà Nẵng</a> <a
						href="#"><i class="fas fa-map-marked-alt"></i>Nha Trang</a> <a
						href="#"><i class="fas fa-map-marked-alt"></i>Hồ Chí Minh</a> <a
						href="#"><i class="fas fa-map-marked-alt"></i>Cần thơ</a>
				</div>
				<div class="box">
					<h3>Quick links</h3>
					<a href="#"><i class="fas fa-arrow-right"></i>Home</a> <a href="#"><i
						class="fas fa-arrow-right"></i>About</a> <a href="#"><i
						class="fas fa-arrow-right"></i>Menu</a> <a href="#"><i
						class="fas fa-arrow-right"></i>Products</a> <a href="#"><i
						class="fas fa-arrow-right"></i>Review</a> <a href="#"><i
						class="fas fa-arrow-right"></i>Contact</a> <a href="#"><i
						class="fas fa-arrow-right"></i>Blogs</a>
				</div>
				<div class="box">
					<h3>Extra links</h3>
					<a href="#"> <i class="fas fa-arrow-right"></i> Account info
					</a> <a href="#"> <i class="fas fa-arrow-right"></i> Ordered items
					</a> <a href="#"> <i class="fas fa-arrow-right"></i> Privacy policy
					</a> <a href="#"> <i class="fas fa-arrow-right"></i> Payment method
					</a> <a href="#"> <i class="fas fa-arrow-right"></i> Our serivces
					</a>
				</div>
				<div class="box">
					<h3>contact info</h3>
					<a href="#"> <i class="fas fa-phone"></i> +84.865-110-502
					</a> <a href="#"> <i class="fas fa-phone"></i> +84.869-300-802
					</a> <a href="#"> <i class="fas fa-envelope"></i>
						thaiphudoan@gmail.com
					</a> <img src="/Assignment/images/luxury.jpg" alt="" class="map">
				</div>
			</div>
			<div class="share">
				<a href="#" class="fab fa-facebook-f"></a> <a href="#"
					class="fab fa-twitter"></a> <a href="#" class="fab fa-instagram"></a>
				<a href="#" class="fab fa-tiktok"></a> <a href="#"
					class="fab fa-youtube"></a>
			</div>
			<div class="credit">
				Created by <span>Thai Meo</span> | all rights reserved!
			</div>
		</footer>

	</div>

	<!--script-->
	<script src="/Assignment/js/jquery.min.js"></script>
	<script src="/Assignment/js/popper.min.js"></script>
	<script src="/Assignment/js/bootstrap.min.js"></script>
	<script src="/Assignment/sweetalert/dist/sweetalert2.all.min.js"></script>
	<script src="/Assignment/js/index.js"></script>
</body>

</html>