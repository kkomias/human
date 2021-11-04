<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<main class="list">
	<div class="container">
		<c:set var="endCount" value="${page.cri.amount - (page.cri.amount - 1) % 3 + 2}" />
		<c:forEach begin="1" end="${endCount}" varStatus="stat">
			<c:set var="board" value="${list[stat.index - 1]}" />
			<c:if test="${stat.index % 3 == 1}">
				<div class="row justify-content-center">
			</c:if>
			<div class="col m-4">
				<c:if test="${not empty board}">
					<div><img src="${pageContext.request.contextPath}/display?filename=${board.attaches[0].path}/s_${board.attaches[0].uuid}" class=" border border-secondary w-100"></div>
					<div class="text-nowrap text-truncate text-center" style="width: 250px">
						<a href="detail?bno=${board.bno}">${board.title}<span class="text-muted small">[${board.replyCnt}]</span></a>
					</div>
				</c:if>
			</div>
			<c:if test="${stat.index % 3 == 0}">
	</div>
			</c:if> 
		</c:forEach>
		<hr>
	
	<ul class="pagination justify-content-center">
		<li class="page-item ${page.prev ? '' : 'disabled'}"><a
			class="page-link"
			href="list?pageNum=${page.startPage-1}&amount=${page.cri.amount}">Previous</a>
		</li>

		<c:forEach begin="${page.startPage}" end="${page.endPage}" var="p">
			<li class="page-item ${p == page.cri.pageNum ? 'active' : ''}">
				<a class="page-link"
				href="list?pageNum=${p}&amount=${page.cri.amount}">${p}</a>
			</li>
		</c:forEach>

		<li class="page-item ${page.next ? '' : 'disabled'}"><a
			class="page-link"
			href="list?pageNum=${page.endPage+1}&amount=${page.cri.amount}">Next</a>
		</li>
	</ul>
	<c:if test="${not empty member}">
		<tr>
			<td colspan="4"><a href="write"><button class="btn btn-primary float-right">글쓰기</button></a></td>
		</tr>
	</c:if> <%-- <h3>${fn:length("abcde")}</h3>
<h3>${fn:contains("abcde","ab")}</h3>
<h3>${"abcde".length()}</h3>
<h3>${"abcde".contains("ab")}</h3>
<h3>${fn:escapeXml("<script>alert()</script>")}</h3> --%> </main>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>