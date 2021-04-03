<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>LESS IS MORE</title>
		<!-- <link rel="stylesheet" href="${path}/resource/css/bootstrap.min.css">  -->
		<!-- <link rel="stylesheet" href="${path}/resource/css/bootstrap_cus.css"> -->
		<link rel="stylesheet" type="text/css" href="${path}/resource/css/all.min.css">
    	<link rel="stylesheet" type="text/css" href="${path}/resource/css/main_style.css?ver=2">
	</head>
	
	<body>
	<header>
		<!-- 로그인 전 -->
		<c:if test="${sessionScope.member == null}">
	       <nav>
	           <ul class="top_menu">
	               <li>
	               		<a href="<c:url value="/member/login" />">LOGIN</a>
	               </li>
	               
	               <li>
	               		<a href="<c:url value="/member/join" />">JOIN</a>
	               </li>
	               
	               <li>
	            	   <a href="<c:url value="/board/boardList?num=1" />">Q&A</a>
	               </li>
	               
	               <li>
	            	   <a href="#">CART</a>
	               </li>
	           </ul>
	       </nav>
        </c:if>
        
        <!-- 로그인 후 -->
        <c:if test="${sessionScope.member != null}">
	       <nav>
	           <ul class="top_menu">
	               <li>
	               		<a href="<c:url value="/member/logout" />">LOGOUT</a>
	               </li>
	               
	               <li>
	               		<a href="<c:url value="/member/profile" />">MY PAGE</a>
	               </li>
	               
	               <li>
	               		<a href="<c:url value="/board/boardList?num=1" />">Q&A</a>
	               </li>
	               
	               <li>
	               		<a href="#">CART</a>
	               </li>
	           </ul>
	       </nav>
        </c:if>

        <div id="logo">
        	<a href="<c:url value="/home" />">
        		<img src="${path}/resource/images/logo.png" width="250px">
        	</a>
        </div>
    </header>
	 
	<!-- Bootstrap core JavaScript -->
	<script src="${path}/resource/jquery/jquery.min.js"></script>
	<script src="${path}/resource/js/bootstrap.bundle.min.js"></script>
	<script src="${path}/resource/jquery/jquery-3.5.1.min.js"></script>
    <script src="${path}/resource/js/main_script.js"></script>
 
 