<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resource/css/board_style.css">

<form action="boardModify" method="post">
		<table>
		  <thead>
		  	<tr><input type="hidden" name="board_no" value="${board.board_no}"></tr>
		    <tr>
		      <th class="id">제목</th>
		      <th>
			  	<input type="text" name="title" class="in" id="title-form" value="${board.title}">
			  </th>
		    </tr>
		  </thead>
		  <thead>
		    <tr>
		      <td style="height:50px;font-family:'Spartan',sans-serif;font-weight:900;font-size:14px;text-align:center;">내용</td>
		      <td>
			  	 <textarea name="content" class="textarea" rows="20">${board.content}</textarea>
			  </td>
		    </tr>
		  </thead>
		</table>
		<div  style="width:1200px;margin:0 auto;">
			<input type="button" class="write_btn" id="boardListBtn" value="목록" style="float:left;">
	    	<input type="submit" class="write_btn" value="수정하기" style="float:right;">
		</div>
	</div>
</form>

<script>
	$('#boardListBtn').click(function() {
		document.location.href="boardList?num=1";
	}); 
</script>

</body>
</html>