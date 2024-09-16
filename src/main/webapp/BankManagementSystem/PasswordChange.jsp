<%@page import="BankManagementSystem.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="navbar.css">
<link rel="stylesheet" href="LoginPage.css">
<link rel="stylesheet" href="icon.css">
</head>
<body>
	<form action="changePassword" method="post">
    	<div id="navbar">
			<div id="leftNav">
				<ul id="mainList">
					<li class="mli">
                        <a href="ValidateMobileNumber.jsp">Send Amount</a>
                    </li>
					<li class="mli">
                        <a href="TransactionHistory.jsp">Transaction History</a>
                    </li>
					<li class="mli">
                        <a href="viewBalance.jsp">View Balance</a>
                    </li>
					<li class="mli">
                        <a href="PasswordChange.jsp">Change Password</a>
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
        <div class="container">       
			<div class="login-form">
				<%
		        String error = (String) request.getAttribute("invalidPassword");
		        if(error!=null){
		        	%>
		        	<center>
		            <p class="error-message">Invalid password credentials... Please try again.</p>
		            </center>
		        <%
		        }
		        %>
				<h2>Change Password</h2>
				<label for="oldPassword">Old password</label>
				<input type="password" id="oldPassword" name="oldPassword" placeholder="Enter your old Password" required>
						
				<label for="newPassword">New Password</label>
				<input type="password" id="newPassword" name="newPassword" placeholder="Enter your new password" required>
						
				<button type="submit">Change</button>
			</div>
		</div>
    </form>
</body>
</html>
