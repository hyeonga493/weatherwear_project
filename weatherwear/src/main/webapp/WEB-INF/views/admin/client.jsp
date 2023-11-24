<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>회원관리 페이지</title>

<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />

<!-- 슬릭그리드 기본 CSS -->
<link rel="stylesheet" href="resources/admin/css/slickGrid/slick.grid.css" type="text/css" />
<!-- jquery-ui가 없으면 안예쁘게 나옴 -->
<link rel="stylesheet" href="resources/admin/css/jquery/jquery-ui.css" type="text/css" />
<!-- 필수 jquery library -->
<script src="resources/admin/js/jquery/jquery-3.7.1.min.js"></script>
<!-- 필수 슬릭그리드 library -->
<script src="resources/admin/js/slickGrid/slick.core.js"></script>
<!-- 필수 jquery library -->
<script src="resources/admin/js/slickGrid/jquery.event.drag-2.3.0.js"></script>
<script src="resources/admin/js/slickGrid/slick.interactions.js"></script>
<!-- 필수 슬릭그리드 library -->
<script src="resources/admin/js/slickGrid/slick.grid.js"></script>
<script src="resources/admin/js/slickGrid/slick.checkboxselectcolumn.js"></script>
<script src="resources/admin/js/slickGrid/slick.rowselectionmodel.js"></script>

<script type="text/javascript" charset="UTF-8">
$(document).ready(function() {
	// 컬럼
	var columns = [{
		id : "name",			//내부 접근 아이디
		name : "이름",		//Grid에 표시될 컬럼명
		field : "name"},	//연동할 데이터상의 변수명
		{id : "id", name : "아이디", field : "id", width : 300}, 
		{id : "grade", name : "등급", field : "grade", width : 150, sortable: true}, 
		{id : "birth", name : "생년월일", field : "birth"}, 
		{id : "phone", name : "휴대전화", field : "phone", width : 150}, 
		{id : "email", name : "이메일", field : "email", width : 150}, 
		{id : "receive_sms", name : "SMS수신", field : "receive_sms", width : 150, sortable: true}, 
		{id : "receive_email", name : "Email수신", field : "receive_email", width : 150, sortable: true}, 
		{id : "receive_dm", name : "DM수신", field : "receive_dm", width : 150, sortable: true}, 
		{id : "button", name : "삭제", field : "delete", width : 150, formatter: buttonFormatter}];

	
	var checkboxSelector = new Slick.CheckboxSelectColumn({
           cssClass: "slick-cell-checkboxsel"
    });
	columns.splice(0, 0, checkboxSelector.getColumnDefinition())
	
	// 옵션
	var options = {
		enableColumnReorder : false
	};
	
	function buttonFormatter(row, cell, value, columnDef, dataContext) {
          return "<button>삭제</button>";
    }
	
	// 데이터(json)
	var data = [ {
		name : "1",
		id : "아이디1",
		grade : "등급1",
		birth : "121212",
		phone : "01011112222",
		email :	"id1@naver.com",
		receive_sms : "Y",
		receive_email : "Y",
		receive_dm : "Y",
	}, {
		name : "2",
		id : "아이디2",
		grade : "등급2",
		birth : "111111",
		phone : "01033332222",
		email :	"id2@naver.com",
		receive_sms : "Y",
		receive_email : "N",
		receive_dm : "Y",
	}, {
		name : "3",
		id : "아이디3",
		grade : "등급3",
		birth : "441212",
		phone : "01033334444",
		email :	"id3@naver.com",
		receive_sms : "Y",
		receive_email : "Y",
		receive_dm : "N",
	} ];

	// SlickGrid 생성
	var grid = new Slick.Grid("#myGrid", data, columns, options);
	grid.setSelectionModel(new Slick.RowSelectionModel({selectActiveRow: false}));
    grid.registerPlugin(checkboxSelector);
    
});

function getSelectedRow(){
      var selectedIndexes = grid.getSelectedRows();
      alert(selectedIndexes);
}
</script>

</head>
<body class="sb-nav-fixed">
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

	<!-- 전체화면 버튼 -->
	<button class="btn btn-link btn-sm order-1 order-lg-0"
		id="sidebarToggle" href="#">
		<i class="fas fa-bars"></i>
	</button>

	<!-- Navbar-->
	<!-- <ul> -->
	<ul class="navbar-nav ml-auto ml-md-0">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false">
				</div></li>
	</ul>
		<main>
		<div class="container-fluid">
			<h1 class="mt-4"></h1>
		</div>
		</main>
		<script
			src="<c:url value='https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js'/>"
			crossorigin="anonymous"></script>
		<hr><hr><hr><br>
		<form action="#" method="post">
		<div style="margin-bottom: 30px;">
			<h3>회원관리 페이지</h3>
		</div>
		<div style="font-size: 15px; padding: 10px 0 10px 0">
			<table style="margin-bottom: 10px">
				<tr>
					<td><select class="box" name="searchCondition">
							<option value="select">선택</option>
							<option value="name">회원이름</option>
							<option value="grade">회원등급</option>
					</select></td>
					<td><input type="text" name="searchKeyword" /></td>
					<td><input type="submit" value="검색" /></td>
				</tr>
			</table>
			총 회원 수
		</div>
		<div id="myGrid" style="width:100%; height:300px;"></div>
	</form>
<br/>
		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>