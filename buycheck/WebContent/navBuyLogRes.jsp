<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String id = (String)session.getAttribute("id");

%>



<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#395927;">
  <a class="navbar-brand" href="buycheck.jsp"><strong>BUYCHECK</strong></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <%
  	if(id != null){
  %>
  		
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <%=id %> 님 환영합니다.
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="buycheck.jsp">판매 하기</a>
	          <a class="dropdown-item" href="#">Another action</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="logout.jsp">로그아웃</a>
	        </div>
	      </li>
	    </ul>
  	</div>
  <%
  
  	}else{
  %>
  	<div class="collapse navbar-collapse" id="navbarSupportedContent">

	    <form class="form-inline my-2 my-lg-0 ml-auto" action="login.jsp">
	      <button class="btn btn-outline-light my-2 my-sm-0" type="submit" style="padding:3% 50px 3% 50px;">로그인</button>
	    </form>
  </div>
  <%		
  	}
  %>


</nav>

</body>
</html>