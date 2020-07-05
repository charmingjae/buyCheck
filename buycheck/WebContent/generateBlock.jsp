<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="buyChain.buyChain" %>
<%@ page import="buyChain.buyChain.*" %>
<%@ page import="buyChain.Block" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	request.setCharacterEncoding("euc-kr");

	session.setAttribute("id","admin");
	buyChain chain = new buyChain();
	
	chain.test();
%>

<script language="javascript">
	
	
	self.window.alert("생성 완료..");	
	location.href="buycheck.jsp";
</script>
<body>

</body>
</html>