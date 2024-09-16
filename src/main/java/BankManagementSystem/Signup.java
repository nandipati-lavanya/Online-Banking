package BankManagementSystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BankManagementSystem/signup")
public class Signup extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out=resp.getWriter();
		resp.setContentType("text/html");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect= DriverManager.getConnection("jdbc:mysql://localhost:3306/bankmanagementsystem?user=root&password=12345");
			PreparedStatement ps=connect.prepareStatement("insert into bankuserdetails(username, password, phonenumber, emailid, address, gender, amount, accountno) values(?,?,?,?,?,?,?,?)");
			Random r=new Random();
			int accountNo=r.nextInt(10000000, 99999999);
			ps.setString(1, req.getParameter("username"));
			ps.setString(2, req.getParameter("pass"));
			ps.setString(3, req.getParameter("mobileno"));
			ps.setString(4, req.getParameter("emailid"));
			ps.setString(5, req.getParameter("address"));	
			ps.setString(6, req.getParameter("gender"));
			ps.setDouble(7, 10000);
			ps.setInt(8, accountNo);
			int result = ps.executeUpdate();
			if(result!=0) {
				
				RequestDispatcher dispatcher=req.getRequestDispatcher("login.html");
				dispatcher.forward(req, resp);
			

			}
			else {
				RequestDispatcher dispatcher=req.getRequestDispatcher("signup.html");
				dispatcher.forward(req, resp);

			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
