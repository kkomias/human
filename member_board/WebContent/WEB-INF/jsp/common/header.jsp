<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
	<div>
    	<div>
            <a href="${pageContext.request.contextPath}/index.html"><div class="img-box">이미지 박스</div></a>
            <p>사이트 간략 소개</p>
        </div>
    </div>
    <nav>
        <ul>
            <li><a href="#">공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/board/list">자유게시판</a></li>
            <li><a href="${pageContext.request.contextPath}/gallery/list">갤러리</a></li>
        </ul>
    </nav>
</header>