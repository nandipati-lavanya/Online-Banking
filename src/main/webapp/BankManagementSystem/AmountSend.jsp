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
	<form action="Amount" method="post">
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
		        String invalidAmount = (String) request.getAttribute("inValidAmount");
		        if(invalidAmount!=null){
		        	%>
		            <p class="error-message">Invalid sufficient balance.Please check your balance.</p>
		        <%
		        }
		        %>
					<h2>Amount</h2>
						<label for="amount">Amount </label>
						<input type="text" id="amount" name="amount" placeholder="Enter amount" required>
						
						
						<button type="submit">send</button>
				</div>
			</div>
    </form>
</body>
</html>