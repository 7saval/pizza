<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	
<div class="container">
	<%@ include file="../header.jsp" %>
	<h2>공지사항</h2>
	<%-- <form action="${path}/notice/list">
		<select name="findkey">
			<option value="subject" <c:out value="${page.findkey=='subject'?'selected':''}"/>>제목</option>
			<option value="content" <c:out value="${page.findkey=='content'?'selected':''}"/>>내용</option>
			<option value="subcon" <c:out value="${page.findkey=='subcon'?'selected':''}"/>>제목+내용</option>
		</select>
		<input type="text" name="findvalue" value="${page.findvalue}">
		<button>조회</button>
	</form> --%>
	<table border="1">
		<tr>
		    <th>공지번호</th>
			<th>공지제목</th>
			<th>공지조회수</th>
			<th>공지등록일</th>
			<th>공지수정일</th>
		</tr>
		<c:forEach var="notice" items="${nlist}">
			<tr>
				<td>${notice.n_num}</td>
				<td><a href="${path}/notice/detail?n_num=${notice.n_num}">${notice.n_subject}</a></td>
				<td>${notice.n_readcnt}</td>
				<td><fmt:formatDate value="${notice.n_regidate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
				<td><fmt:formatDate value="${notice.n_modidate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
			</tr>
		</c:forEach>
	
	</table>
	<%-- ${page} --%>
	<button onclick="location.href='${path}/notice/add'">공지쓰기</button>
	<hr>

	<!-- 컨텍스트path뒤에 board가 notice로 바뀌어야하지 않나싶음. -->
	<c:if test="${page.startPage != 1}">
		<a href="${path}/notice/list?curPage=${page.startPage-1}">이전</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		<a href="${path}/notice/list?curPage=${i}">${i}</a> 
	</c:forEach>

	<c:if test="${page.endPage<page.totPage}">
		<a href="${path}/notice/list?curPage=${page.endPage+1}">다음</a>
	</c:if>
</div>
	<%@ include file="../footer.jsp" %>
</body>
</html>