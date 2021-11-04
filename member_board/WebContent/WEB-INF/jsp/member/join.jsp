<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp" />
<style>
.msg {height: 20px;}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<main class="login p-5">
	<form method="post" class="form-group">
		<fieldset>
			<legend>회원가입</legend>
			<label for="id">아이디</label>
			<input type="text" name="id" id="id" class="form-control">
			<p class="msg text-danger"></p>
			
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd" id="pwd" class="form-control">
			<p class="msg text-danger"></p>
			
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwdCk" id="pwdCk" class="form-control">
			<p class="msg text-danger"></p>
			
			<label for="email">이메일</label>
			<input type="email" name="email" id="email" class="form-control">
			<p class="msg text-danger"></p>
			
			<label for="name">이름</label>
			<input type="text" name="name" id="name" class="form-control">
			<p class="msg text-danger"></p>
			
			
			<p><button class="btn btn-primary" id="btnJoin">회원가입</button></p>
		</fieldset>
	</form>
	</main>
	<script>
		$(function() {
			$("#btnJoin").click(function() {
				event.preventDefault();
				var id = $("#id").val();
				if(id){
					$.ajax("idValid?id=" + id, {
						success : function(data) {
							if(data/1) { // 가능
								$("#id").next().text("")
							}
							else { // 불가능
								$("#id").next().text("이미 가입된 아이디입니다")
							}
						}
					});
				}
			});
		});
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>