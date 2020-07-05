<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("password");
	
	
	/* admin login */
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstat = null;
		ResultSet rs 	= null;
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/buycheck?"+
							"useSSl=false&serverTimezone=UTC";
		
		String dbUser = "root";
		String dbPass = "1234";
		
		
		//2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		
		//3. 쿼리를 위한 Statement 생성
		String sql = "SELECT * FROM user WHERE id =? and pw =?";
		pstat = conn.prepareStatement(sql);
		pstat.setString(1, id);
		pstat.setString(2, pw);
		
		//4. 쿼리 실행.
		rs = pstat.executeQuery();
		
		int stuCheck = 0;
		
		if(rs.next()){
			session.setAttribute("id",id);
			response.sendRedirect("buycheck.jsp");
			
		}else{
			%>
			<script type="text/javascript">
				alert("ID와 비밀번호를 확인하세요.");
				history.go(-1);
			</script>
			<%
		}
		pstat.close();
		conn.close();
	%>

</body>
</html>