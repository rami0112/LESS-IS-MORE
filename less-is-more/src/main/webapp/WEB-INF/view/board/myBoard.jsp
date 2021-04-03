<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div id="board">
	<table class="table table-hover center-blcok">
	  <thead>
	    <tr>
	      <th scope="col">NO</th>
	      <th scope="col">TITLE</th>
	      <th scope="col">NAME</th>
	      <th scope="col">DATE</th>
	    </tr>
	  </thead>
	  
	  <tbody>
	  <c:forEach var="board" items="${board}">
	  	<tr class="table-light">
	      <td>${board.board_no}</td>
		  <td style="text-align:left;width:500px"><a href='<c:url value="/board/boardDetail?board_no=${board.board_no}"/>'>${board.title}</a></td>
		  <td>${board.m_id}</td>
		  <td>${board.reg_date}</td>
	  	</tr>
	  </c:forEach>
	  </tbody>
	</table>
	

<!-- 페이징 -->
	<div>
	
	  <ul class="pagination pagination-sm">
	  
		  <c:if test="${pagination.prev}">
		    <li class="page-item">
		      <a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">&laquo;</a>
		    </li>
		  </c:if>
		    
		  <c:forEach var="idx" begin="${pagination.startPage}" end="${pagination.endPage}">
		    <li class="page-item ${pagination.page == idx ? 'active' : ''}">
		      <a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">${idx}</a>
		    </li>
		  </c:forEach>
		  
		  <c:if test="${pagination.next}">
		    <li class="page-item">
		      <a class="page-link" href="#" onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">&raquo;</a>
		    </li>
		  </c:if>
	  
	  </ul>
	  
	  <input type="hidden" name="page" value="">
	  <input type="hidden" name="range" value="">
	</div>
	
</div>

<script>

//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
	var page = parseInt(((range - 2) * rangeSize)) + 1;
	var range = parseInt(range) - 1;
	var url = "${path}/board/myBoard";

	document.getElementsByName("page")[0].value=page;
	document.getElementsByName("range")[0].value=range;
	
	location.href = url;
}

//페이지 번호 클릭
function fn_pagination(page, range, rangeSize) {
	var url = "${path}/board/myBoard";

	document.getElementsByName("page")[0].value=page;
	document.getElementsByName("range")[0].value=range;

	location.href = url;	
}

//다음 버튼 이벤트
function fn_next(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	var url = "${path}/board/myBoard";

	document.getElementsByName("page")[0].value=page;
	document.getElementsByName("range")[0].value=range;

	location.href = url;
}

</script>

</body>
</html>