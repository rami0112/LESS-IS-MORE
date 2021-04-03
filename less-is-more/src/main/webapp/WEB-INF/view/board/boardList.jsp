<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="${path}/resource/css/board_style.css">

	<table>
	  <thead>
	    <tr>
	      <th class="no">NO</th>
	      <th class="title">TITLE</th>
	      <th class="id">NAME</th>
	      <th class="date">DATE</th>
	    </tr>
	  </thead>
	  
	  <tbody>
	  <c:forEach var="board" items="${board}">
	  	<tr class="table-light">
	      <td class="no">${board.board_no}</td>
		  <td class="title"><a href='<c:url value="/board/boardDetail?board_no=${board.board_no}"/>'>${board.title}</a></td>
		  <td class="id">${board.m_id}</td>
		  <td class="date">${board.reg_date}</td>
	  	</tr>
	  </c:forEach>
	  </tbody>
	</table>

	<div style="width:1200px; margin:0 auto">
	<c:if test="${not empty member}">
			<input type="button" class="write_btn" onClick="location.href='${path}/board/boardWrite'" value="글쓰기" style="float:right;"/>
	</c:if>
	</div>
	
	<!-- 페이징 -->
	<div>
	  <ul class="page">
		  <c:if test="${pagination.prev}">
		    <li class="page-item">
		      <a class="page-link" href='<c:url value="/board/boardList?num=${pagination.startPageNum - 1}${pagination.searchTypeKeyword}" />'>◀</a>
		    </li>
		  </c:if>
		    
		  <c:forEach begin="${pagination.startPageNum}" end="${pagination.endPageNum}" var="num">
		    <li class="${select == num ? 'active' : ''}">
		      <a class="page-link" href='<c:url value="/board/boardList?num=${num}${pagination.searchTypeKeyword}" />'>${num}</a>
		    </li>
		  </c:forEach>
		  
		  <c:if test="${pagination.next}">
		    <li class="page-item">
		      <a class="page-link" href='<c:url value="/board/boardList?num=${pagination.endPageNum + 1}${pagination.searchTypeKeyword}" />'>▶</a>
		    </li>
		  </c:if>
	  </ul>
	</div>
	
	<!-- 검색기능 -->
	<div class="searchDiv">
	  <select name="searchType">
	      <option value="title" <c:if test="${pagination.searchType eq 'title'}">selected</c:if>>제목</option>
	      <option value="content" <c:if test="${pagination.searchType eq 'content'}">selected</c:if>>내용</option>
	      <option value="title_content" <c:if test="${pagination.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
	      <option value="m_id" <c:if test="${pagination.searchType eq 'm_id'}">selected</c:if>>작성자</option>
	  </select>
      <input type="text" class="search_in inputs" placeholder="Search" name="keyword" value="${pagination.keyword}">
      <button type="button" class="search_btn" id="searchBtn" onClick="fn_search()" style="float:left;">Search</button>
	</div>
    <footer>

    </footer>

<script>

//검색 버튼
function fn_search() {

	var url = "${path}/board/boardList?num=1";
	
	let searchType = document.getElementsByName("searchType")[0].value;
	let keyword = document.getElementsByName("keyword")[0].value;

	url = url + "&searchType=" + searchType;
	url = url + "&keyword=" + keyword;
	
	location.href = url;
}


</script>

</body>
</html>