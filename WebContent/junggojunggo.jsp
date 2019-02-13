<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<style>
		.my-nav {
			color: #343434;
		}
		#navLogo {
			width: 58px;
			height: 48px;
		}
		#headerContainer {
			height: 480px;
			background-image: url('/images/upLoad/ripped.png');
			background-size: cover;
			background-position: 10% -100px;
			/* border: 1px solid black; */
		}
		#headerContent {
			height: 500px;
			padding-top: 140px;
			text-align: center;
		}
		.my-btn {
			width: 110px;
			height: 60px;
			margin: 160px 40px 0 40px;
			padding: 16px;
			border-radius: 15px;
			/* border: 1px solid black; */
		}
	</style>
</head>
<body>

	<div class='navbar navbar-expand-md bg-light navbar-light sticky-top my-nav'>
		<div class='container'>
			<a class='navbar-brand' href='#'>
				<img src='/images/deer.jpg' id='navLogo' />
				&nbsp;&nbsp;중고천국
			</a>
			<button class='navbar-toggler collapsed' type='button' data-toggle='collapse' data-target='#navbarResponsive'
				aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class='navbar-toggler-icon'></span>
			</button>
			<div class='collapse navbar-collapse' id='navbarResponsive'>
				<ul class='navbar-nav' style='color: #343434'>
					<li class='nav-item'>
						<a class='nav-link' href='#'>Home</a>
					</li>
					<li class='nav-item'>
						<a class='nav-link' href='#'>삽니다</a>
					</li>
					<li class='nav-item'>
						<a class='nav-link' href='#'>팝니다</a>
					</li>
				</ul>
			</div>
			<div class='navbar navbar-nav navbar-right'>
				<div class='dropdown'>
					<a class='dropdown-toggle' data-toggle='dropdown' role='button' href='#' style='color: #343434;'>
						sign in<span class='caret'></span>
					</a>
					<ul class='dropdown-menu dropdown-menu-right animate slideIn'>
						<li><a class='dropdown-item' href='#'>로그인</a></li>
						<li><a class='dropdown-item' href='#'>회원가입</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<header>
		<div class='container align-items-center' id='headerContainer'>
			<div id='headerContent'>
				<h1>중 고 천 국</h1>
				<div class='btn btn-primary my-btn'>삽니다</div>
				<div class='btn btn-primary my-btn'>팝니다</div>
			</div>
		</div>
	</header>



	<br/>
	<div class='py-5'>
		<div class='container'>
			<p>
				Lorem Ipsum is simply dummy text of the printing and typesetting industry.
				Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
				when an unknown printer took a galley of type and scrambled it to make a type specimen book.
				It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
				It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
				and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
			</p>
			<br/>
			<p>
				Lorem Ipsum is simply dummy text of the printing and typesetting industry.
				Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
				when an unknown printer took a galley of type and scrambled it to make a type specimen book.
				It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
				It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
				and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
			</p>
			<br/>
			<p>
				Lorem Ipsum is simply dummy text of the printing and typesetting industry.
				Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
				when an unknown printer took a galley of type and scrambled it to make a type specimen book.
				It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
				It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
				and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
			</p>
			<br/>
			<p>
				Lorem Ipsum is simply dummy text of the printing and typesetting industry.
				Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
				when an unknown printer took a galley of type and scrambled it to make a type specimen book.
				It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
				It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
				and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
			</p>
			<br/>
			<p>
				Lorem Ipsum is simply dummy text of the printing and typesetting industry.
				Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
				when an unknown printer took a galley of type and scrambled it to make a type specimen book.
				It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
				It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
				and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
			</p>
			<br/>
			<p>
				Lorem Ipsum is simply dummy text of the printing and typesetting industry.
				Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
				when an unknown printer took a galley of type and scrambled it to make a type specimen book.
				It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
				It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,
				and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
			</p>
		</div>
	</div>
	
	<div class='d-flex flex-column'>
		<footer id='sticky-footer' class='page-footer py-4 bg-dark text-white-50 my-footer'>
			<div class='container text-center'>
				<small>Copyright &copy; My Webpage</small><br/>
				<small>Copyright &copy; My Webpage</small><br/>
				<small>Copyright &copy; My Webpage</small><br/>
				<small>Copyright &copy; My Webpage</small><br/>
			</div>
		</footer>
	</div>

</body>
</html>