<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resource/css/board_style.css">

	<table>
		<thead>
			<tr style="border-top:2px solid black;">
				<td class="id" style="height:100px;font-family:'Spartan',sans-serif;font-weight:900;font-size:14px;text-align:center;">작성자</th>
				<td style="width:400px;">${board.m_id}</td>
				<td class="id" style="height:50px;font-family:'Spartan',sans-serif;font-weight:900;font-size:14px;text-align:center;">작성일</td>
				<td>${board.reg_date}</td>
			</tr>
		</thead>
		<thead>
			<tr>
				<td style="height:100px;font-family:'Spartan',sans-serif;font-weight:900;font-size:14px;text-align:center;">제목</td>
				<td colspan="3" style="text-align:left;width:1000px;">${board.title}</td>
			</tr>
		</thead>
		<thead>
			<tr>
				<td style="font-family:'Spartan',sans-serif;font-weight:900;font-size:14px;text-align:center;">내용</td>
				<td colspan="3" style="text-align:left;padding:50px;">${board.content}</td>
			</tr>
		</thead>
	</table>
	<div style="width:1200px;margin:0 auto">
		<c:if test="${sessionScope.member.id == board.m_id}">
			<input type="button" class="write_btn" id="deleteBtn" style="float: left; margin-right: 10px;" value="삭제하기"> 
			<input type="button" class="write_btn" id="modifyBtn" style="float: left;" value="수정하기"> 
		</c:if>
		<input type="button" class="write_btn" id="boardListBtn" style="float: right;" value="목록">
	</div>


<!-- 댓글 -->
<div style="width:1200px; margin:0 auto; margin-top:100px; padding-top:50px; padding-bottom:50px; background-color:#ECECEC;">
<ul>

<c:forEach items="${reply}" var="reply">
	<li>
		<p>${reply.m_id} / ${reply.reg_date}</p>
		<p>${reply.content}</p>
	</li>
</c:forEach>
   
</ul>

		<form action="replyWrite" method="post" style="margin-left:50px;">
		        <!-- <label style="display:block">${sessionScope.member.id}</label>  -->
		        
		        <div>
			        <textarea rows="7" style="width:950px;margin-right:50px" name="content"></textarea>
			    	<input type="hidden" name="board_no" value="${reply.board_no}">
			        <button type="submit" 
			        style="width: 100px;
					    height: 100px;
					    background-color: white;
					    border: 1px solid gray;
					    outline: none;
					    font-size: 12px;
					    position: absolute;">댓글 작성</button>
			    </div>
		</form>
	
</div>

<script>
	$('#deleteBtn').click(function() {
		var result = confirm('정말 삭제 하시겠습니까?');
		if (result) {
			document.location.href="boardDelete?board_no=${board.board_no}";
		}
	});

	$('#modifyBtn').click(function() {
		document.location.href="boardModify?board_no=${board.board_no}";
	});

	$('#boardListBtn').click(function() {
		document.location.href="boardList?num=1";
	});
</script>

</body>
</html>