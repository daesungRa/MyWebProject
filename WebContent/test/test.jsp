<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- style -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" />
<style>
	.my-col2 {
		border-right: 1px solid #bbb;
	}
	#profile-image {
		width: 88px;
		height: 92px;
		border-radius: 40px;
	}
	.my-tabs li {
		margin-right: 3px;
		padding: 0 5px 0 5px;
		border: 1px solid #bbb;
		border-bottom: none;
		border-radius: 5px;
	}
	#navtab-profile-tag {
		border: none;
	}
	#info-tag {
		display: block;
	}
	.my-tabs li:hover {
		background-color: #bcbcbc;
	}
	.my-tabs li a {
		color: #676767;
	}
	.my-tabs li a:hover {
		color: #38b3ef;
		text-decoration: none;
	}
</style>

<!-- script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script><!-- 제이쿼리 Core -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 제이쿼리 UI -->
<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class='container' style='margin: 50px auto;'>
		<h2>탭 메뉴 테스트</h2>
		<p>현재 페이지는 부트스트랩 탭 메뉴를 테스트하기 위해 만들어졌습니다</p>
		
		<hr/>
		
		<div class='row'>
			<div class='col-sm-2 my-col2'>
				<img src='/images/damuni.jpg' id='profile-image'alt='profile image'/><br/><br/>
				웹페이지<br/><br/>
				활동
			</div>
			<hr/>
			<div class='col-sm-10'>
				<ul class='nav nav-tabs my-tabs'>
					<li class='active' id='navtab-info-tag'><a data-toggle='tab' href='#info-tag'>회원정보</a></li>
					<li id='navtab-profile-tag'><a data-toggle='tab' href='#profile-tag'>프로필</a></li>
				</ul>
				<hr/>
				
				<div class='tab-content my-tab-pane'>
					<div id='info-tag' class='tab-pane fade in active'>
						<h4>회원정보</h4>
						<p>회원정보 페이지입니다</p>
					</div>
					<div id='profile-tag' class='tab-pane fade'>
						<h4>프로필</h4>
						<p>프로필 페이지입니다</p>
					</div>
				</div>
			</div>
		</div>
		
		<hr/>
	</div>
	
	<script type="text/javascript">
		$(window).ready(function () {
			$('#navtab-profile-tag').click(function () {
				$('#navtab-info-tag').css({'border':'none'});
				$('#navtab-profile-tag').css({'border':'1px solid #bbb', 'border-bottom':'none'});
			});
			$('#navtab-info-tag').click(function () {
				$('#navtab-profile-tag').css({'border':'none'});
				$('#navtab-info-tag').css({'border':'1px solid #bbb', 'border-bottom':'none'});
			});
		});
	</script>

</body>
</html>