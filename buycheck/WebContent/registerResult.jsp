<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> -->
    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
    <link rel="stylesheet" href="./css/login.css">
</head>
<body>
	<c:choose>
		<c:when test="${userCheck == 1}">
			<script type="text/javascript">
				alert("이미 등록된 iD입니다.");
				history.go(-1);
			</script>
		</c:when>
		<c:when test="${userCheck == 0 }">
			<div class="login-dark">
			    <jsp:include page="LogNav.jsp"></jsp:include>
			        <form action="login.jsp" method="post">
			            <h2 class="sr-only">Login Form</h2>
			            <div class="illustration"><ion-icon name="checkmark-done-outline"></ion-icon></div>
			            <span style="display:table; margin-left:auto; margin-right:auto;"> <c:out value="${name}" /> 님 환영합니다!</span>
			            <% String name= request.getParameter("name"); %>
			            <input type="hidden" name="name" value="<%=name %>"/>
			            <div class="form-group"><button class="btn btn-primary btn-block" type="submit">로그인 하러가기</button></div>
			        </form>
			 </div>
		</c:when>
		<c:when test="${userCheck < 0 }">
			<script type="text/javascript">
				alert("회원 등록 실패");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</html>