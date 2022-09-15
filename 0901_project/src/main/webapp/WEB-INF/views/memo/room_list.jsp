<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> My Memo List </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> My Memo List </h3>
		<hr>

			<table class="table table-hover table-borderless table-bordered">
				<c:forEach var="dto" items="${room_list}">
					<tr>
						<td>
							<h3 class="text-center">
								<a href="${pageContext.request.contextPath}/memo/open_room?room_no=${dto.room_no}"
									style="text-decoration:none;" class="text-dark">
									ChatRoom : ${dto.mid_from} &lt;=&gt; ${dto.mid_to}
								</a>
							</h3>
						</td>
					</tr>
				</c:forEach>
			</table>

	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>












