<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="BankManagementSystem.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet" href="navbar.css">
	<link rel="stylesheet" href="icon.css">
</head>
<body>
	<form action="viewbalance" method="post">
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
        <div id="transactionimage">
            <center>
            <img src="greenTick.gif" alt="">
            <h1>Bank account Balance fetched successfully</h1>
            <h2>Available balance is: Rs.
            <%
            String mobileno=Login.mobileno;
            System.out.println("User mobile number in view balance is :"+mobileno);
            Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankmanagementsystem?user=root&password=12345");
			PreparedStatement ps=connect.prepareStatement("select * from bankuserdetails where phonenumber=?");
			ps.setString(1,mobileno);
			ResultSet rs=ps.executeQuery();
			double amount=0;
			if(rs.next()){
				amount=rs.getDouble("amount");
				System.out.println("User amount"+amount);
			}
            %>
            	<%= amount %>
            </h2>
        </center>
        </div>
    </form>
</body>
</html>