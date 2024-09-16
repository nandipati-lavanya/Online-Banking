<%@page import="BankManagementSystem.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet" href="navbar.css">
	 <link rel="stylesheet" href="PaymentDone.css">
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
		<div id="text1">
		 <h1>Payment Done Successfully...</h1>
		</div>
		<div id="main"> 
		 <div id="imageContainer">
			<img src="donePayment.gif" alt="" id="image">
		</div>
			<br><br><br><br>
	        <audio id="audioo" src="PhonePeSound.mp3" autoplay controls></audio>
         </div>
         	
    </form>
</body>
</html>