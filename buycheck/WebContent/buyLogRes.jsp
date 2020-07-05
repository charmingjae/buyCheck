<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<!-- Datatable -->

	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>

<!-- End -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
 -->

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"></script>

<script>
function inputJu(obj){
	var number = obj.value.replace(/[^0-9]/g,"");
	var jumin = "";
	var chkDate = new Date();
	
	if(chkDate.getDay().toString() == '0' || chkDate.getDay().toString() == '6'){ // 일요일 또는 토요일
		if(number.length<7){
			return number;
		}
		else if(number.length <14){
			jumin += number.substr(0,6);
			jumin += "-";
			jumin += number.substr(6,7);
		}
		else{
			jumin += number.substr(0,6);
			jumin += "-";
			jumin += number.substr(7,8);
			jumin += number.substr(15);
		}
		obj.value=jumin;
	}
	else{ // 일반 평일일 때
		if(number.length == 0){
		}
		else if(number.length == 1){
			return number;
		}
		else if(number.length<7){
				return number;
		}
		else if(number.length <14){
			jumin += number.substr(0,6);
			jumin += "-";
			jumin += number.substr(6,7);
		}
		else{
			jumin += number.substr(0,6);
			jumin += "-";
			jumin += number.substr(7,8);
			jumin += number.substr(15);
		}
		obj.value=jumin;
	}
}

function press(f){
	if(f.keyCode == 13){
		formname.submit();
	}
}

</script>




<link rel="stylesheet" type="text/css" href="css/buyLogRes.css" />

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="navBuyLogRes.jsp" />
	<%
		String juminSearch = request.getParameter("juminSearch");
		System.out.println(juminSearch);
	%>

	<div class="container">
		<span id="alertBuyer"> <%=juminSearch %> 님의 구매내역 입니다.</span>
		<form action="buyLogRes.jsp" method="post" name="sellForm">
			<input id="juminSearch" name="juminSearch" type="text" placeholder="주민등록번호를 입력하세요." onKeyup="inputJu(this);" maxlength="14" onkeyPress="JavaScript:press(this.form)"></input>
		</form>
	</div>


<div id="fortable" class="container">
	
	
	<!-- START -->
	<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>			
				<th style="text-align:center;">#</th>
				<th style="text-align:center;">구매처</th>
				<th style="text-align:center;">판매자</th>
				<th style="text-align:center;">판매자 ID</th>
				<th style="text-align:center;">구매 시간</th>
			</tr>
        </thead>
       <tbody>
		<!-- SQL Driver Loading -->
		
		<%
			/* SQL Driver Loading */
			
			Class.forName("com.mysql.jdbc.Driver");
		
			Connection conn = null;
			/* PreparedStatement pstmt = null; */
			Statement stmt = null;
			ResultSet rs = null;
			
			try
			{
				String jdbcDriver = "jdbc:mysql://localhost:3306/buycheck?"+
						"useSSl=false&serverTimezone=UTC";
				
				String dbUser = "root";
				String dbPass = "1234";
				
				
				//2. 데이터베이스 커넥션 생성
				conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
				
				//3. 쿼리를 위한 Statement 생성
				String sql = "SELECT * FROM sell WHERE buyer='"+ juminSearch + "' ORDER BY SEQ DESC"; // Where문 나중에 수정
				stmt = conn.prepareStatement(sql);
				/* pstat.setString(2, pw); */
				rs = stmt.executeQuery(sql);
				
				/* 쿼리 결과 출력 */
				int seq = 1;
				
					while(rs.next())
					{
			%>			
						<tr>
							<td><%=seq%></td>
							<%
								seq++;
							%>
							<td><%=rs.getString("pharmacy")%></td>
							<td><%=rs.getString("sellerName")%></td>
							<td><%=rs.getString("sellerID")%></td>
							<td><%=rs.getString("bought_time")%></td>
						</tr>
			<%
					}
			}catch(SQLException ex){
				System.out.println(ex.getMessage());
				ex.printStackTrace();
			}
			finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){};
				if(stmt!=null)try{stmt.close();}catch(SQLException ex){};
				if(conn!=null)try{conn.close();}catch(SQLException ex){};
			}
		%>
		</tbody>
    </table>
	
	<!-- END -->
	
	</div>
</body>
<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>

</html>