<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
	<link rel="stylesheet" href="LoginPage.css">
	<link rel="stylesheet" href="icon.css">
	
</head>
<body>
	<form action="sendAmount" method="post">
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
		<div class="container">
				<div class="login-form">
				<%
		        String invalidMobile = (String) request.getAttribute("inValidMobile");
		        if(invalidMobile!=null){
		        	%>
		        	<center>
		            <p class="error-message">No user found.. Please try again.</p>
		            </center>
		        <%
		        }
		        %>
					<h2>Validate Mobile Number</h2>
						<label for="mobileNo">Mobile Number</label>
						<input type="text" id="mobileNo" name="mobileNo" placeholder="Enter mobile number to validate" required>
						
						<button type="submit">validate</button>
				</div>
			</div>
            	
    </form>
	 </form>
</body>
</html>