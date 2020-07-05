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
    <link rel="stylesheet" href="./css/register.css">
</head>

<body>
    <div class="login-dark">
    <jsp:include page="RegNav.jsp"></jsp:include>
        <form action="registerProc.jsp" method="post">
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><ion-icon name="color-wand-outline"></ion-icon></div>
            <div class="form-group"><input class="form-control" name="id" placeholder="iD"></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password"></div>
            <div class="form-group"><input class="form-control" name="name" placeholder="이름"></div>
            <div class="form-group"><input class="form-control" type="text" name="pharmacy" placeholder="약국 명"></div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="submit">회원가입</button></div>
            <a href="login.jsp" class="forgot">이미 계정이 있으십니까?</a>
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
</body>

</html>