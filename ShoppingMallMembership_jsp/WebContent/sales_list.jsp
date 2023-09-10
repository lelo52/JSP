<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="layout/db_connect.jsp" %>
<% 
String sql="select a.custno 회원번호, custname 회원성명,"
		   +"case when grade='A' then 'VIP' "
	       +     " when grade='B' then '일반' "
	       +     " when grade='C' then '직원' "
	       +"    end 고객등급, sum(price) 매출"
		   +" from member_tbl_02 a, money_tbl_02 b"
	       +" where a.custno = b.custno"
	       +"   group by a.custno , custname ,grade"
	       +"   order by sum(price) desc";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>header</title>
		<link rel="stylesheet" type="text/css" href="css/style.css?ver1.1">
	</head>
	<body>
		<header>
			<jsp:include page="layout/header.jsp"></jsp:include>
		</header>
		<nav>
			<jsp:include page="layout/nav.jsp"></jsp:include>
		</nav>		
		<main id="section">
			<h3	class="title">회원매출조회</h3>
			<div class="scroll">
			<table class="table_line">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>고객등급</th>
					<th>매출</th>
				</tr>
			<%
				while(rs.next()){
			%>
				<tr align="center">
					<td><%= rs.getString("회원번호") %></td>
					<td><%= rs.getString("회원성명") %></td>
					<td><%= rs.getString("고객등급") %></td>
					<td><%= rs.getString("매출") %></td>
				</tr>
			<% 
				}
			%>
			</table>
			</div>
		</main>
		<footer>
			<jsp:include page="layout/footer.jsp"></jsp:include>
		</footer>
	</body>
</html>