<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>물류관리 페이지</title>

<script src="resources/admin/js/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="resources/admin/css/bootstrap/bootstrap.min.css" />

</head>
<body class="sb-nav-fixed">
	<%@ include file="/WEB-INF/views/admin/base/header.jsp"%>

		<h2>물류관리 페이지</h2>
		${ client.clientName }
		<%@ include file="/WEB-INF/views/admin/base/footer.jsp"%>
</body>
</html>