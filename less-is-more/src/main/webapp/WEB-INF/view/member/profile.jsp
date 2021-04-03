<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resource/css/join_style.css">

<form:form name="profileForm" id="join" modelAttribute="memberVO" action="profile" method="post">

		<label class="join_list" for="id-form" style="float: left;">아이디*</label>
		<input type="text" name="id" class="in inputs" id="id-form" value="${member.id}" readonly>

		<label class="join_list" for="password-form" style="float: left;">비밀번호*&nbsp&nbsp</label>
		<p id="password-hint" class="col-form-label" style="color: red; font-size: 50%;"><form:errors path="password" /></p>
		<input type="password" name="password" class="in inputs" id="password-form" aria-describedby="password-hint">

		<label class="join_list" for="passwordCheck-form" style="float: left;">비밀번호 확인*&nbsp&nbsp</label>
		<p id="passwordCheck-hint" class="col-form-label" style="color: red; font-size: 50%;"><form:errors path="passwordCheck" /></p>
		<input type="password" name="passwordCheck" class="in inputs" id="passwordCheck-form" aria-describedby="passwordCheck-hint">

		<label class="join_list" for="name-form" style="float: left;">이름*&nbsp&nbsp</label>
		<p id="name-hint" class="col-form-label" style="color: red; font-size: 50%;"><form:errors path="name" /></p>
		<input type="text" name="name" class="in inputs" id="name-form" aria-describedby="name-hint" value="${member.name}">

		<input type="button" class="create_btn" id="deleteBtn" value="탈퇴하기" style="float: left;"> 
		<input type="submit" class="create_btn" id="modityBtn" value="수정하기" style="float: right;">
	
</form:form>

<script>
	/*$("#password-form").change(function() {

		var form = document.profileForm;
		var password = form.password.value;
		var action = './joinPassword';

		$.post(action, {
			password : password
		}, function(data) {
			$("#password-hint").text(data.msg);
		}, 'json');
	});

	$("#passwordCheck-form").on('change', function() {

		var form = document.profileForm;
		var password = form.password.value;
		var passwordCheck = form.passwordCheck.value;
		var action = './joinPasswordCheck';

		$.post(action, {
			password : password,
			passwordCheck : passwordCheck
		}, function(data) {
			$("#passwordCheck-hint").text(data.msg);
		}, 'json');
	});

	$("#name-form").change(function() {

		var form = document.profileForm;
		var name = form.name.value;
		var action = './joinName';

		$.post(action, {
			name : name
		}, function(data) {
			$("#name-hint").text(data.msg);
		}, 'json');
	});*/

	/*
	 $("#modifyBtn").click(function() {
	 if (confirm("정말 수정하시겠습니까?") == true) {
	 $("#profileForm").attr("action", "profile");
	 document.profileForm.submit();
	 }
	 });
	 */

	$("#deleteBtn").click(function() {
		if (confirm("정말 탈퇴하시겠습니까?") == true) {
			$("#profileForm").attr("action", "delete");
			document.profileForm.submit();
		}
	});
</script>
</body>
</html>