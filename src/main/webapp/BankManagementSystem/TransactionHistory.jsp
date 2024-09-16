<%@page import="BankManagementSystem.Login"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet" href="navbar.css">
	<link rel="stylesheet" href="TransactionHistory.css">
	<link rel="stylesheet" href="icon.css">
</head>
<body>
	<form>
        <div id="navbar">
			<div id="leftNav">
				<ul id="mainList">
					<li class="mli" >
                        <a href="ValidateMobileNumber.jsp">Send Amount</a>
                    </li>
					<li class="mli" >
                        <a href="TransactionHistory.jsp">Transaction History</a>
                    </li>
					<li class="mli" >
                        <a href="viewBalance.jsp">View Balance</a>
                    </li>
					<li class="mli" >
                        <a href="PasswordChange.jsp">Change Password</a>
                    </li>
                    <li class="mli" >
                    <img src="humanicon.png" alt="Icon" class="icon">
                       <h3 style="color: black;">
                       <%
                       String name=Login.name;
                       name=name.toUpperCase();
                       %>
                       <a href="login.html"><%= name %></a>
                       
                       </h3>
                       
                    </li>
				</ul>
			</div>
		</div>
		<br><br><br>
		<center>
		
		<h1>Transaction History</h1>
		<table>
			<tr>
				<th>TRANSACTION ID</th>
				<th>Name</th>
				<th>Date</th>
				<th>Time</th>
				<th>Amount</th>
				<th>Transaction</th>
			</tr>
			<%
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankmanagementsystem?user=root&password=12345");
			PreparedStatement ps=connect.prepareStatement("select * from transactiondetails where mobileno=?");
			ps.setString(1, Login.mobileno);
			ResultSet rs=ps.executeQuery();
			if(rs.isBeforeFirst()){
				while(rs.next()){
					String transaction=rs.getString("transaction");
					if(transaction.equalsIgnoreCase("debited")){
					%>
					<tr id="red">
						<td><%=rs.getInt("transactionid") %></td>
						<td><%=rs.getString("name") %></td>
						<td><%=rs.getDate("date") %></td>
						<td><%=rs.getTime("time") %></td>
						<td><%=rs.getString("amount") %></td>
						<td><%=transaction %></td>
						</tr>
						<%
					}
					else{
						%>
						<tr id="green">
						<td><%=rs.getInt("transactionid") %></td>
						<td><%=rs.getString("name") %></td>
						<td><%=rs.getDate("date") %></td>
						<td><%=rs.getTime("time") %></td>
						<td><%=rs.getString("amount") %></td>
						<td><%=transaction %></td>
						</tr>
						<%
					}
				}
			}

			%>
			
		</table>
		<br>
		</center>
    </form>
</body>
</html>