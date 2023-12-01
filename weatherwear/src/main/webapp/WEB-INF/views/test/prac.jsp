<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>prac</title>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="resources/client/js/client_join.js"></script>
</head>
<body>

	<h3>stringList</h3>
	<%
		String cone = "c1-1";
		String ctwo = "c2-1, c2-2";
		String cthree = "c3-1, c3-2, c3-3";
		
		List<String> list = new ArrayList<String>();
		list.add(cone);
		list.add(ctwo);
		list.add(cthree);
	%>
	<c:forEach var="c" items="<%= list %>">
		<h3>${ c }</h3>
		<c:choose>
			<c:when test="${fn:contains(c, ',')}">
				<c:set var="splitval" value="${fn:split(c, ',')}"/>
				<c:forEach var="i" items="${ splitval }">
					${ i }<br>
				</c:forEach>
				<h2>나 너보다 길어</h2>
			</c:when>
			<c:otherwise>
				<h2>나 하나</h2>
			</c:otherwise>
		</c:choose>
	</c:forEach>



	<div style="height:50px; font-size:20px;">${product.proName}</div>
		<div style="font-size:30px; text-align:right; border-bottom:solid 1px">${product.proPrice}원</div>
		<div style="margin-top: 10px">
			<label>색상</label><select name="opColor" id="opColor">
				<option value="SELECT">선택</option>
				<option value="c1">c1</option>
				<option value="c2">c2</option>
				<option value="c3">c3</option>
				<option value="c4">c4</option>
			</select>
		</div>
		<div>
			<label>사이즈</label><select name="opSize" id="opSize" onchange="select(this)">
				<option value="SELECT">선택</option>
				<option value="s1">s1</option>
				<option value="s2">s2</option>
				<option value="s3">s3</option>
				<option value="s4">s4</option>
			</select>
		</div>
		<section id="selectOption" style="border:3px solid blue; width:100%; height:300px;">
		
		</section>
		<script>
		function select(selectElement) {
			var color = document.getElementById("opColor").value;
			console.log(color);
			var size = document.getElementById("opSize").value;
			console.log(size);
			
			var select = "";
			var name= color+size;
			select += "<div name='" + color + size + "' style='border:1px dotted green; width: 85%; height:50px; padding:30px;'>"
					+ "${ product.proName }&nbsp;/&nbsp;" + color + "&nbsp;/&nbsp;" + size + "&nbsp;&nbsp;&nbsp;"
					+ "<button onclick='count('minus')'>-</button>"
					+ "<span id='cnt' style='padding:0 20px 0 20px'>1</span>"
					+ "<button onclick='count('plus')'>+</button>"
					+ "<input type='text' name='opId' value='${ produce.proName }" + name + "'>"
					+ "<span style='float:right;'>&nbsp;&nbsp;&nbsp;&nbsp;</span>"
					+ "<button id='id' name='name' onclick='deleteSelected(this)' style='float:right;'>X</button>"
					+ "</div>";
					
			$("#selectOption").html(select);
		}


		function deleteSelected(element){
			$(element).parent().remove();
		}
	</script>
	
	<h3>CheckBox</h3>
	<input type="text" name="list" value="${ cir }">
	<form action="getCheckbox.do" method="post">
	
		check : 
		<input type="checkbox" id="checkAllId" name="checkName" > 전체선택<br>
		<!-- label안에 <br> 작성해야 줄바꿈도 같이 사라집니다. -->
		<label for="checkboxId1"><input type="checkbox" name="checkName" class="checkClass" id="checkId1" value="c1">c1<br></label>
		<label for="checkboxId2"><input type="checkbox" name="checkName" class="checkClass" id="checkId2" value="c2">c2<br></label>
		<label for="checkboxId3"><input type="checkbox" name="checkName" class="checkClass" id="checkId3" value="c3">c3<br></label>
		<label for="checkboxId4"><input type="checkbox" name="checkName" class="checkClass" id="checkId4" value="c4">c4<br></label>
		<label for="checkboxId5"><input type="checkbox" name="checkName" class="checkClass" id="checkId5" value="c5">c5<br></label>
		<label for="checkboxId6"><input type="checkbox" name="checkName" class="checkClass" id="checkId6" value="c6">c6<br></label>
		<label for="checkboxId7"><input type="checkbox" name="checkName" class="checkClass" id="checkId7" value="c7">c7<br></label>
		<label for="checkboxId8"><input type="checkbox" name="checkName" class="checkClass" id="checkId8" value="c8">c8<br></label>
		<!-- Controller로 삭제할 값 넘김 -->
		<input type="hidden" name="deleteList" value="${ deleteList }">
		<input type="hidden" name="selectList" value="${ selectList }">
		<br>
		<input type="button" value="SUBMIT" onclick="submitFunction()">
		<input type="button" value="DELETE" onclick="deleteFunction()">
	</form>
	<script>
	// 전체 선택 기능
	$(function(){
		$("#checkAllId").click(function(){
			$(".checkClass").prop("checked", this.checked);
		});
	});
	
	// 삭제 기능
	function deleteFunction(){
		let deleteList = "";
		
		$(".checkClass:checked").each(function(num, item){
			$(item).parent().remove();
			
			if(num == 0){
				deleteList += item.value;
			} else {
				deleteList += "," + item.value;
			}
		});
		$("input[name='deleteList']").val(deleteList);
		console.log("삭제 리스트 : " + deleteList);
	}	

	// 값넘기기 기능
	function submitFunction(){
		let selectList = "";
		
		$(".checkClass:checked").each(function(num, item){
			$(item).parent().remove();
			
			if(num == 0){
				selectList += item.value;
			} else {
				selectList += "," + item.value;
			}
		});
		$("input[name='selectList']").val(selectList);
		console.log("선택 리스트 : " + selectList);
	}
	</script>
	
	
	<h3>이미지 호출하기</h3>
	<form action="getImage.do" method="post" enctype="multipart/form-data">
		<input type="text" name="cmId" id="cmId" value="client01_01"> 
		<input type="submit" value="getImage.do">
	</form>
	<div id="image">
		<img alt="image" src="${ image.cmDir }${ image.cmName }"><br>
	</div>

	<h3>이미지 업로드하기</h3>
	<!-- 파일 업로드에서는 enctype(인코딩타입)을 multipart/form-data로 반드시 설정 -->
	<form action="uploadImage1.do" method="post" enctype="multipart/form-data">
		파일 선택 : <input type="file" name="file">
		<input type="submit" value="uploadImage1.do">
	</form>
	
	<br><hr><br>
	
	<!-- 파일 두개이상 붙히는거 -->
	<form action="uploadImage2.do" method="post" enctype="multipart/form-data">
		파일 선택 : <input type="file" multiple="multiple" name="files"> 
		<input type="submit" value="uploadImage2.do">
	</form>
	
	<h3>checkId.do</h3>
	<form action="checkId.do" method="post">
		<input type="text" name="clientId" value="client01">client01<br>
		<input type="submit" value="checkId.do">
	</form>
	<br>
	<br>

	<h3>getClient.do</h3>
	<form action="getClient.do" method="post">
		<input type="text" name="clientId" value="client01">client01<br>
		<input type="submit" value="getClient.do">
	</form>
	<br>
	<br>

	<h3>clientLogin.do</h3>
	<form action="clientLogin.do" method="post">
		<input type="text" name="clientId" value="client01">client01<br>
		<input type="text" name="clientPwd" value="123456789">123456789<br>
		<input type="submit" value="clientLogin.do">
	</form>
	<br>
	<br>

	<h3>passwordCheck.do</h3>
	<form action="passwordCheck.do" method="post">
		<input type="hidden" name="clientId" value="${ client.clientId }">client01<br>
		<input type="text" name="clientPwd" value="123456789">123456789<br>
		<input type="submit" value="passwordCheck.do">
	</form>
	<br>
	<br>

	<h3>clientUpdate.do</h3>
	<form name="client_join" action="clientUpdate.do" method="POST"	onsubmit="madecNum()">
		아이디 : <input type="text" name="clientId" id="clientId" required="required"	value="${ client.clientId }"> <br>
		이름 :${ client.clientName } <br>
		닉네임 :${ client.clientNickName } <br>
		전화번호 :
		<input type="text" name="cNum_1" id="cNum_1" required="required" maxlength="3" size="3"	onkeyup="checkL('cNum_1', 'cNum_2')" value="${ client.clientNum.substring(0,3) }"> - 
		<input type="text" name="cNum_2" id="cNum_2" required="required" maxlength="4" size="4" onkeyup="checkL('cNum_2', 'cNum_3')" value="${ client.clientNum.substring(3,7) }"> - 
		<input type="text" name="cNum_3" id="cNum_3" required="required" maxlength="4" size="4" value="${ client.clientNum.substring(7) }">
		<br>
		<input type="hidden" name="clientNum" id="clientNum" required="required"></td>
		이메일 :<input type="text" name="clientEmail" placeholder="weatherwear@naver.com" required="required" value="${ client.clientEmail }">  <br>
		생년월일 :${ client.clientBirth } <br>	
		"마케팅 수신 동의"  <br>
		<input type="radio" id="cEmailCheck_Y" name="clientEmailCheck" value="Y">
		<label for="cEmailCheck_Y">이메일 수신을 동의합니다.</label><br> 
		<input type="radio" id="cEmailCheck_N" name="clientEmailCheck" value="N">
		<label for="cEmailCheck_N">이메일 수신을 동의하지 않습니다.</label><br>
		<input type="submit" value="수정하기">
	</form>
	
	<h3>clientWithdraw.do</h3>
	<form action="clientWithdraw.do" method="post">
		<input type="hidden" name="clientId" value="${ client.clientId }">client01<br>
		<input type="text" name="clientPwd" value="123456789">123456789<br>
		<input type="submit" value="clientWithdraw.do">
	</form>
	<br>
	<br>
</body>
</html>