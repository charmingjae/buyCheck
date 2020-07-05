<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Calendar" %>

<%@ page import="buyChain.buyChain" %>
<%@ page import="buyChain.buyChain.*" %>
<%@ page import="buyChain.Block" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
			request.setCharacterEncoding("utf-8");
	
			Calendar cal = Calendar.getInstance();
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
			System.out.println(dayOfWeek);
		
			/* 구매자 주민번호 */
			String juminSearch = request.getParameter("juminSearch");
			String birth = juminSearch.toString().substring(1,2);
			
			String getId = (String)session.getAttribute("id");
			
			
			
			buyChain chain = new buyChain();
			
			
			
			if(dayOfWeek == 1 || dayOfWeek == 7){ // 일요일 , 토요일이면 구매 이력만 검사.
				System.out.println("juminSearch : " + juminSearch);
				
				/* Session 가져오기 */
				String id = (String)session.getAttribute("id");
				
				/* 약국 이름 */
				String pName = "";
				
				/* 판매자 이름 */
				String sellerName = "";
				
				/* 판매자 아이디 */
				String sellerID = "";

				
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection conn = null;
				PreparedStatement pstat = null;
				PreparedStatement pstat2 = null;
				ResultSet rs 	= null;
				ResultSet rs2 	= null;
				
				String jdbcDriver = "jdbc:mysql://localhost:3306/buycheck?"+
							"useSSl=false&serverTimezone=UTC";
				
				String dbUser = "root";
				String dbPass = "1234";
				
				
				
				//2. 데이터베이스 커넥션 생성
				conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
				
				
				/* 구매내역 테이블에 넣을 insert문 */
				String sql =  "INSERT INTO sell(buyer,pharmacy,sellerName, sellerID) VALUES(?,?,?,?)";
				
				/* 약국 이름 가져올 select문 */
				String pharName = "SELECT pharmacy,id,name FROM USER WHERE id = ?";
				pstat = conn.prepareStatement(pharName);
				pstat.setString(1, id);
				
				rs = pstat.executeQuery();
				if(rs.next()){
					pName = rs.getString("pharmacy");
					sellerID = rs.getString("id");
					sellerName = rs.getString("name");
				}
				
				/* 구매자 중복 체크 */
				String sqlchkId = "SELECT * FROM sell WHERE buyer = ?";
				pstat2 = conn.prepareStatement(sqlchkId);
				pstat2.setString(1, juminSearch);
				
				
				rs2 = pstat2.executeQuery();
				
				int sellCheck = 0; // 중복 회원 검사용
				int result = 0; // insert문 flag
				
				if(rs2.next()){
					// 테이블에 구매이력이 등록되어 있는 경우.
					sellCheck = 1; // id 중복
				}
				else{
					// 테이블에 사원 정보가 등록되어 있지 않은 경우.
					
					chain.id = id;
					chain.buyer = juminSearch;
					chain.pName = pName;
					
					chain.addObject(chain.sellTime, chain.id, chain.buyer, chain.pName);
					
					pstat = conn.prepareStatement(sql);
					pstat.setString(1, juminSearch);
					pstat.setString(2, pName);
					pstat.setString(3, sellerName);
					pstat.setString(4, sellerID);
					
					result = pstat.executeUpdate();
				}
				
				request.setAttribute("sellCheck", sellCheck);
				
				pstat.close();
				pstat2.close();
				conn.close();
				%>
				<jsp:forward page="sellResult.jsp"></jsp:forward>
				<%
			}
			else{ // 토요일, 일요일이 아니면 주민등록번호 검사.
				System.out.println("토요일 일요일 아닐때 FLAG1, JUMINSEARCH : "+juminSearch);
				System.out.println("토요일 일요일 아닐때 FLAG1, JUMINSEARCH.SUBSTRING : "+ juminSearch.toString().substring(1,2));
				System.out.println("day of week : "+ Integer.toString(dayOfWeek-1));
				/* System.out.println("day of week for ju : "+ (Integer.toString(Integer.parseInt(juminSearch.toString().substring(1,2))+5).substring(1,2))); */
				
				
				/* 생년월일이 날에 부합하면. */
				
				/* 1. 마지막 자리가 요일과 같을 때 .*/
				if(juminSearch.toString().substring(1,2).equals(Integer.toString(dayOfWeek-1))){
					System.out.println("juminSearch : " + juminSearch);
					
					/* Session 가져오기 */
					String id = (String)session.getAttribute("id");
					
					/* 약국 이름 */
					String pName = "";
					
					/* 판매자 이름 */
					String sellerName = "";
					
					/* 판매자 아이디 */
					String sellerID = "";

					
					Class.forName("com.mysql.jdbc.Driver");
					
					Connection conn = null;
					PreparedStatement pstat = null;
					PreparedStatement pstat2 = null;
					ResultSet rs 	= null;
					ResultSet rs2 	= null;
					
					String jdbcDriver = "jdbc:mysql://localhost:3306/buycheck?"+
								"useSSl=false&serverTimezone=UTC";
					
					String dbUser = "root";
					String dbPass = "1234";
					
					
					
					//2. 데이터베이스 커넥션 생성
					conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
					
					
					/* 구매내역 테이블에 넣을 insert문 */
					String sql =  "INSERT INTO sell(buyer,pharmacy,sellerName, sellerID) VALUES(?,?,?,?)";
					
					/* 약국 이름 가져올 select문 */
					String pharName = "SELECT pharmacy, id, name FROM USER WHERE id = ?";
					pstat = conn.prepareStatement(pharName);
					pstat.setString(1, id);
					
					rs = pstat.executeQuery();
					if(rs.next()){
						pName = rs.getString("pharmacy");
						sellerName = rs.getString("name");
						sellerID = rs.getString("id");
					}
					
					/* 구매자 중복 체크 */
					String sqlchkId = "SELECT * FROM sell WHERE buyer = ?";
					pstat2 = conn.prepareStatement(sqlchkId);
					pstat2.setString(1, juminSearch);
					
					
					rs2 = pstat2.executeQuery();
					
					int sellCheck = 0; // 중복 회원 검사용
					int result = 0; // insert문 flag
					
					if(rs2.next()){
						// 테이블에 구매이력이 등록되어 있는 경우.
						sellCheck = 1; // id 중복
					}
					else{
						// 테이블에 사원 정보가 등록되어 있지 않은 경우.
						
						chain.id = id;
						chain.buyer = juminSearch;
						chain.pName = pName;
						
						chain.addObject(chain.sellTime, chain.id, chain.buyer, chain.pName);
						
						pstat = conn.prepareStatement(sql);
						pstat.setString(1, juminSearch);
						pstat.setString(2, pName);
						pstat.setString(3, sellerName);
						pstat.setString(4, sellerID);
						
						result = pstat.executeUpdate();
					}
					
					request.setAttribute("sellCheck", sellCheck);
					
					pstat.close();
					pstat2.close();
					conn.close();
					%>
					<jsp:forward page="sellResult.jsp"></jsp:forward>
				<%
				}
				
				/* 마지막 자리에서 5를 더한게 같을 때. 6~0
					마지막 자리에서 10을 더한게 같을 때. 1~5 */
				else if(Integer.toString(Integer.parseInt(juminSearch.toString().substring(1,2))+10).substring(1,2).equals(Integer.toString(dayOfWeek-1))
						|| Integer.toString(Integer.parseInt(juminSearch.toString().substring(1,2))+5).substring(1,2).equals(Integer.toString(dayOfWeek-1))){
					System.out.println("juminSearch : " + juminSearch);
					
					/* Session 가져오기 */
					String id = (String)session.getAttribute("id");
					
					/* 약국 이름 */
					String pName = "";
					
					/* 판매자 이름 */
					String sellerName = "";
					
					/* 판매자 아이디 */
					String sellerID = "";

					
					Class.forName("com.mysql.jdbc.Driver");
					
					Connection conn = null;
					PreparedStatement pstat = null;
					PreparedStatement pstat2 = null;
					ResultSet rs 	= null;
					ResultSet rs2 	= null;
					
					String jdbcDriver = "jdbc:mysql://localhost:3306/buycheck?"+
								"useSSl=false&serverTimezone=UTC";
					
					String dbUser = "root";
					String dbPass = "1234";
					
					
					
					//2. 데이터베이스 커넥션 생성
					conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
					
					
					/* 구매내역 테이블에 넣을 insert문 */
					String sql =  "INSERT INTO sell(buyer,pharmacy,sellerName, sellerID) VALUES(?,?,?,?)";
					
					/* 약국 이름 가져올 select문 */
					String pharName = "SELECT pharmacy, id, name FROM USER WHERE id = ?";
					pstat = conn.prepareStatement(pharName);
					pstat.setString(1, id);
					
					rs = pstat.executeQuery();
					if(rs.next()){
						pName = rs.getString("pharmacy");
						sellerName = rs.getString("name");
						sellerID = rs.getString("id");
					}
					
					/* 구매자 중복 체크 */
					String sqlchkId = "SELECT * FROM sell WHERE buyer = ?";
					pstat2 = conn.prepareStatement(sqlchkId);
					pstat2.setString(1, juminSearch);
					
					
					rs2 = pstat2.executeQuery();
					
					int sellCheck = 0; // 중복 회원 검사용
					int result = 0; // insert문 flag
					
					if(rs2.next()){
						// 테이블에 구매이력이 등록되어 있는 경우.
						sellCheck = 1; // id 중복
					}
					else{
						// 테이블에 사원 정보가 등록되어 있지 않은 경우.
						
						chain.id = id;
						chain.buyer = juminSearch;
						chain.pName = pName;
						
						chain.addObject(chain.sellTime, chain.id, chain.buyer, chain.pName);
						
						pstat = conn.prepareStatement(sql);
						pstat.setString(1, juminSearch);
						pstat.setString(2, pName);
						pstat.setString(3, sellerName);
						pstat.setString(4, sellerID);
						
						result = pstat.executeUpdate();
					}
					
					request.setAttribute("sellCheck", sellCheck);
					
					pstat.close();
					pstat2.close();
					conn.close();
					%>
					<jsp:forward page="sellResult.jsp"></jsp:forward>
					<%
				}
				else{
					int check = -1;
					request.setAttribute("sellCheck", check);
				%>
				<script>
					alert( '생년월일의 끝자리가 '+ <%= birth %> + ' 인 사람은 구매할 수 없습니다.');
					history.go(-1);
				</script>
					
				<%
				}
			}
			
			
			
	%>

	

</body>
</html>