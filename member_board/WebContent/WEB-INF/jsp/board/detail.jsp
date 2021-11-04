<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp" />
<style>
.detail table {width: 80%; margin: 40px auto; border-collapse: collapse;}
.detail td {padding: 8px; border-top: 3px solid #bbb; border-bottom: 3px solid #bbb;}
.detail td + td {width: 20%}
.detail tr:nth-child(3) td {height: 300px; vertical-align: top}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<main class="detail">
	<table>
		<tr>
			<td>${board.title}</td>
			<td>${board.regDate}</td>
		</tr>
		<tr>
			<td>
				<c:forEach items="${board.attaches}" var="attach">
					<p><a href="${pageContext.request.contextPath}/download?filename=${attach.path}/${attach.uuid}">${attach.origin}</a></p>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td colspan="2">${board.content}</td>
		</tr>
		<c:if test="${member.id == board.id}">
		<tr>
			<td colspan="4">
				<div class="btn-group float-right">
					<a href="modify?bno=${board.bno}"><button class="btn btn-primary">수정</button></a>
					<a href="modify?bno=${board.bno}"><button class="btn btn-primary ">삭제</button></a>
				</div>
			</td>
		</tr>
		</c:if>
	</table>
<c:if test="${not empty member}">	
<div class="col-10 mx-auto">
	<div class="form-group clearfix">
		<p>${member.name}</p>
		<form id="frmReplyWrite">
			<input type="text" class="form-control" placeholder="댓글 제목을 입력하세요" name="title" id="title">
			<textarea class="form-control my-1" placeholder="댓글을 입력하세요" name="content" id="content"></textarea>
			<input type="hidden" name="bno" value="${board.bno}">
			<input type="hidden" name="id" value="${member.id}">
			<button class="btn btn-primary float-right disabled" disabled="disabled" id="btnReplyWrite">등록</button>
		</form>
	</div>
</div>
</c:if>
<div class="container col-10 mx-auto reply-wrapper">
</div>
</main>
<script>
var cp = "${pageContext.request.contextPath}";
var bno = "${param.bno}";
$(function() {
	showList();
	function showList() {
		var url = cp + "/reply/list?bno=" + bno;
		console.log(url);
		$.getJSON(url).done(function(data) {
			console.log(data);
			
			var str = "";
			for(var i in data) {
				str += '<div class="card mt-3" data-rno="' + data[i].rno + '">';
				str += '	<div class="card-header bg-dark text-light">' + data[i].title + '</div>';
				str += '	<div class="card-body">' + data[i].content + '</div>';
				str += '</div>';
			}
			$(".reply-wrapper").html(str);
		});
	}
	// 이벤트 위임 댓글 상세 이벤트
	$(".reply-wrapper").on("click", ".card", function() {
		var url = cp + "/reply?rno=" + $(this).data("rno");
		$.getJSON(url).done(function(data) {
			$("#myModal")
				.data("rno", data.rno)
				.data("id", data.id)
				.find(".modal-title").text(data.title)
				.end().find(".modal-body").text(data.content)
				.end().modal("show");
		});
	});
	
	$("#btnRm").click(function() {
		if(($(this).closest(".modal").data("id")) === '${member.id}') {
			var rno = $(this).closest(".modal").data("rno");
			var url = cp + "/reply?rno=" + rno;
			$.ajax(url, {
				method : "delete",
				success : function(data) {
					// 성공적 종료 시에
					showList();
					$("#myModal").modal("hide");
				}
			});
		}
		else {
			alert('본인 댓글이 아니면 삭제할 수 없습니다.');
		}
	});
	
	$("#title, #content").keyup(function() {
		var titleLen = $("#title").val().trim().length;
		var contentLen = $("#content").val().trim().length;
		
		if (titleLen && contentLen) {
			$("#btnReplyWrite")
			.removeClass("disabled")
			.attr("disabled", false);
		}
		else {
			$("#btnReplyWrite")
			.addClass("disabled")
			.attr("disabled", true);
		}
	});
	
	$("#frmReplyWrite").submit(function() {
		event.preventDefault();
		if($("#btnReplyWrite").is(".disabled")) return;
		var reply = {};
		reply.title = $(this.title).val();
		reply.content = $(this.content).val();
		reply.id = $(this.id).val();
		reply.bno = $(this.bno).val();
		
		var data = JSON.stringify(reply);
		
		var frm = this;
		var url = cp + "/reply";
		$.ajax(url, {
			method : "post",
			data : {"jsonData" : data},
			success : function(data) {
				showList();
				frm.reset();
				$("#btnReplyWrite").addClass("disabled");
			}
		});
	});
});

</script>
<!-- The Modal -->
<div class="modal" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Modal Heading</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	
	        <!-- Modal body -->
	        <div class="modal-body">
	        	Modal body..
	        </div>
	
	        <!-- Modal footer -->
	        <div class="modal-footer">
		        <button type="button" class="btn btn-danger" id="btnRm">삭제</button>
	        </div>
    	</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>