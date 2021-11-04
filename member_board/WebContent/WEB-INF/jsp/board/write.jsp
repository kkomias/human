<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp" />
<style>
.detail table {width: 80%; margin: 40px auto; border-collapse: collapse;}
.detail td {padding: 8px; border-top: 3px solid #bbb; border-bottom: 3px solid #bbb;}
.detail textarea {width: 100%; height: 300px}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<main class="detail">
<form method="post" enctype="multipart/form-data">
	<table> 
		<tr>
			<td><input type="text" name="title" id="title"></td>
		</tr>
		<tr>
			<td><input type="file" name="file1"></td>
		</tr>
		<tr>
			<td><input type="file" name="file2"></td>
		</tr>
		<tr>
			<td><input type="file" name="file3"></td>
		</tr>
		<tr>
			<td><textarea name="content" id="content"></textarea></td>
		</tr>
		<tr>
			<td><button class="btn btn-primary float-right disabled" disabled="disabled" id="boardWrite">작성</button></td>
		</tr>
	</table>
</form>
</main>
<script>
$(function() {
	$("#title, #content").keyup(function() {
		var titleLen = $("#title").val().trim().length;
		var contentLen = $("#content").val().trim().length;
		
		if (titleLen && contentLen) {
			$("#boardWrite")
			.removeClass("disabled")
			.attr("disabled", false);
		}
		else {
			$("#boardWrite")
			.addClass("disabled")
			.attr("disabled", true);
		}
	});
});
</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>