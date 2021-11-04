<%@page import="vo.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="head.jsp" />
</head>
<body>
	<jsp:include page="header.jsp" />
	<main class="index">
	<section>
		<article>
			<div class="slider">
				<img alt="daisies" src="${pageContext.request.contextPath}/images/daisies.jpg">
				<img alt="plant" src="${pageContext.request.contextPath}/images/plant.jpg">
				<img alt="succulents" src="${pageContext.request.contextPath}/images/succulents.jpg">
			</div>
		</article>

		<h4 class="display-6">자유게시판</h3>
		<ul class="row justify-content-center">
			<c:forEach items="${freeList}" var="f">
				<li class="col-5 m-2">
					<a href="board/detail?bno=${f.bno}">
					<div>
						<h4 class="text-truncate small"><c:out value="${f.title}[${f.replyCnt}]" escapeXml="true" /></h4>
						<p class="text-truncate text-muted small"><c:out value="${f.content}" escapeXml="true" /></p>
					</div>
					</a>
				</li>
			</c:forEach>
		</ul>
	</section>
	<aside>
		<c:choose>
			<c:when test="${not empty member}">
				<p>${member.name}님환영합니다.</p>
				<p>
					<a href="#">정보수정</a><a href="logout">로그아웃</a>
				</p>
			</c:when>
			<c:otherwise>
				<p>
					<a href="login">로그인</a>
				</p>
				<form action="login">
					<input class="btn btn-danger" type="submit" value="로그인">
				</form>
				<p>
					<a href="join">회원가입</a><a href="#">ID/PW찾기</a>
				</p>
			</c:otherwise>
		</c:choose>
	</aside>
	</main>
	<script>
	$(function() {
		$(".slider").bxSlider({
			mode : 'fade',
			pager : false,
			controls : false,
			auto : true,
			pause : 2000
			
		});
	});
	</script>
	<jsp:include page="footer.jsp" />
</body>
</html>