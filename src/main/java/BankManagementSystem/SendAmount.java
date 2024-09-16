package BankManagementSystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/BankManagementSystem/sendAmount")
public class SendAmount extends HttpServlet{
	public static String receiverMobileNo;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out=resp.getWriter();
		String mobilenoUser = Login.mobileno;
		receiverMobileNo=req.getParameter("mobileNo");
		resp.setContentType("text/html");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect= DriverManager.getConnection("jdbc:mysql://localhost:3306/bankmanagementsystem?user=root&password=12345");
			PreparedStatement ps=connect.prepareStatement("select * from bankuserdetails where phonenumber=? and phonenumber!=?");
			ps.setString(1, receiverMobileNo);
			ps.setString(2, mobilenoUser);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				RequestDispatcher dispatcher=req.getRequestDispatcher("AmountSend.jsp");
				dispatcher.include(req, resp);
				

			}
			else {
				req.setAttribute("inValidMobile", "Invalid mobile number");
				RequestDispatcher dispatcher=req.getRequestDispatcher("ValidateMobileNumber.jsp");
				dispatcher.include(req, resp);
				
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
