<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
			String id = request.getParameter("id");
			String pw = request.getParameter("password");
			String pharmacy = request.getParameter("pharmacy");
			String name = request.getParameter("name");
			
			
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
			
			
			String sql =  "INSERT INTO user(id,pw,pharmacy,name) VALUES(?,?,?,?)";
			
			/* Id 중복 체크 */
			String sqlchkId = "SELECT * FROM user WHERE id = ?";
			pstat = conn.prepareStatement(sqlchkId);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			int userCheck = 0; // 중복 회원 검사용
			int result = 0; // insert문 flag
			
			if(rs.next()){
				// 테이블에 ID가 등록되어 있는 경우.
				userCheck = 1; // id 중복
			}
			else{
				// 테이블에 ID가 등록되어 있지 않은 경우.
				pstat = conn.prepareStatement(sql);
				pstat.setString(1, id);
				pstat.setString(2, pw);
				pstat.setString(3, pharmacy);
				pstat.setString(4, name);
				
				result = pstat.executeUpdate();
			}
			
			request.setAttribute("id", id);
			request.setAttribute("name", name);
			request.setAttribute("userCheck", userCheck);
			
			pstat.close();
			conn.close();
	%>
	
	<jsp:forward page="registerResult.jsp">
		<jsp:param name="name" value="<%=name %>"/>
	</jsp:forward>
</body>
</html>