<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../common/head.jsp" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<main class="login">
	<form method="post" action="">
		<fieldset>
			<legend>로그인</legend>
			<h4><label for="id">아이디</label></h4>
			<input type="text" name="id" id="id">
			<h4><label for="pwd">비밀번호</label></h4>
			<input type="password" name="pwd" id="pwd">
			<p><label><input type="checkbox" name="saveId" id="savedId"> 아이디 저장</label></p>
			<p><button class="btn btn-danger">로그인</button></p>
		</fieldset>
	</form>
	<h3>${param.msg}</h3>
	</main>
	<jsp:include page="../common/footer.jsp" />
	<script>
		$(function() {
			if($.cookie("savedId")) {
				$("#id").val($.cookie("savedId"));
				$("#savedId").prop("checked", true);
			}
		});
	</script>
</body>
</html>