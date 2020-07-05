<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Untitled</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"> -->
    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
    <link rel="stylesheet" href="./css/login.css">
</head>

<body>
    <div class="login-dark">
    <jsp:include page="LogNav.jsp"></jsp:include>
        <form action="loginChk.jsp" method="post">
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><ion-icon name="finger-print-outline"></ion-icon></div>
            <div class="form-group"><input class="form-control" name="id" placeholder="iD"></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password"></div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="submit">로 그 - 인</button></div>
            <a href="register.jsp" class="forgot">회원이 아니십니까?</a>
            <a href="#" class="forgot">Forgot your iD or password?</a>
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>