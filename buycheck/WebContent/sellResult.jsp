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
		<c:when test="${sellCheck == 1}">
			<script type="text/javascript">
				alert("이미 구매한 이력이 있습니다.");
				history.go(-1);
			</script>
		</c:when>
		<c:when test="${sellCheck == 0 }">
			<script type="text/javascript">
				alert("판매 완료");
				location.href ="buycheck.jsp";
			</script>
		</c:when>
		<c:when test="${userCheck < 0 }">
			<script type="text/javascript">
				alert("구매할 수 없습니다.");
				history.go(-1);
			</script>
		</c:when>
	</c:choose>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</html>