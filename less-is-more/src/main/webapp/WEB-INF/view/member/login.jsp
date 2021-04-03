<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resource/css/login_style.css?ver=1">

<form:form id="loginForm" class="login" modelAttribute="memberVO" action="${path}/member/login" method="post">
	<div class="form-group">
		<input type="text" name="id" class="id inputs" placeholder="ID"/>
		<form:errors element="div" class="errors" path="id" />
		<input type="password" name="password" class="pw inputs" placeholder="PASSWORD" />
		<form:errors element="div" class="errors" path="password" />
		<form:errors element="div" class="errors" path="notFoundMember" />
	</div>

	<input type="submit" id="signin_btn" value="SIGN IN">
	<button type="button" id="create_btn" onClick="location.href='${path}/member/join'">CREATE ACCOUNT</button>
	
	<div id="forgot">
		<span>
			<a href="#">FORGOT ID</a>
		</span> 
		<span>&nbsp;|&nbsp;</span>
		<span>
			<a href="#">FORGOT PASSWORD</a>
		</span>
	</div>
</form:form>

<footer> </footer>

</body>
</html>