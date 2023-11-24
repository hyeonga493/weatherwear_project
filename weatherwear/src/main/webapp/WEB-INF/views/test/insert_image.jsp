<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<!-- 파일 업로드시 필요합니다. -->
	<script src="https://sdk.amazonaws.com/js/aws-sdk-2.809.0.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
	<script src="resources/product/js/file_insert.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	
</head>
<body>
	<form method="post" action="insertImage.do" enctype="multipart/form-data">
        <input type="file" id="fileUpload" name="upload[]" multiple>
        
        <!-- 여기에 파일 목록 태그 추가 -->
        <ul id="fileList"></ul>
        <ul id="imageList"></ul>
        <input type="hidden" name="fileList" value="${ fileList }">
        <input type="submit" value="send">
    </form>
    
	<br><br><br>
	<hr>
	<br><br><br>
</body>
</html>