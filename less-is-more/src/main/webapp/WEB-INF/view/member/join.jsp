<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resource/css/join_style.css">

<form:form name="joinForm" id="join" modelAttribute="memberVO" action="join" method="post">
			
			<label class="join_list" for="id-form" style="float:left;">아이디*&nbsp&nbsp</label>
			<p id="id-hint" class="col-form-label" style="color:red; font-size:50%;"><form:errors path="id" /></p> 
			<input type="text" name="id" class="in inputs" id="id-form" aria-describedby="id-hint" value="${memberVO.id}">

			<label class="join_list" for="password-form" style="float:left;">비밀번호*&nbsp&nbsp</label>
			<p id="password-hint" class="col-form-label" style="color:red; font-size:50%;"><form:errors path="password" /></p> 
			<input type="password" name="password" class="in inputs" id="password-form" aria-describedby="password-hint">

			<label class="join_list" for="passwordCheck-form" style="float:left;">비밀번호 확인*&nbsp&nbsp</label> 
			<p id="passwordCheck-hint" class="col-form-label" style="color:red; font-size:50%;"><form:errors path="passwordCheck" /></p> 
			<input type="password" name="passwordCheck" class="in inputs" id="passwordCheck-form" aria-describedby="passwordCheck-hint">

			<label class="join_list" for="name-form" style="float:left;">이름*&nbsp&nbsp</label>
			<p id="name-hint" class="col-form-label" style="color:red; font-size:50%;"><form:errors path="name" /></p> 
			<input type="text" name="name" class="in inputs" id="name-form" aria-describedby="name-hint" value="${memberVO.name}">

		<input type="submit" class="create_btn" value="JOIN">
		
</form:form>

<footer> </footer>

<script>
	$("#id-form").change(function() {
	
		var form = document.joinForm;
		var id = form.id.value;
		var action = './joinId';

		$.post(
			action,
			{
				id : id
			},
			function(data) {
				$("#id-hint").text(data.msg);
			},
			'json'
		);
	});

	$("#password-form").change(function() {
		
		var form = document.joinForm;
		var password = form.password.value;
		var action = './joinPassword';

		$.post(
			action,
			{
				password : password
			},
			function(data) {
				$("#password-hint").text(data.msg);
			},
			'json'
		);
	});

	$("#passwordCheck-form").on('change',function() {
		
		var form = document.joinForm;
		var password = form.password.value;
		var passwordCheck = form.passwordCheck.value;
		var action = './joinPasswordCheck';

		$.post(
			action,
			{
				password : password,
				passwordCheck : passwordCheck
			},
			function(data) {
				$("#passwordCheck-hint").text(data.msg);
			},
			'json'
		);
	});

	$("#name-form").change(function() {
		
		var form = document.joinForm;
		var name = form.name.value;
		var action = './joinName';

		$.post(
			action,
			{
				name : name
			},
			function(data) {
				$("#name-hint").text(data.msg);
			},
			'json'
		);
	});
</script>
</body>
</html>