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

@WebServlet("/BankManagementSystem/login")
public class Login extends HttpServlet{
	public static String mobileno="";
	public static String password;
	public static double amount;
	public static String name;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out=resp.getWriter();
		resp.setContentType("text/html");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect= DriverManager.getConnection("jdbc:mysql://localhost:3306/bankmanagementsystem?user=root&password=12345");
			PreparedStatement ps=connect.prepareStatement("select * from bankuserdetails where phonenumber=? and password=?");
			mobileno=req.getParameter("mobile");
			password=req.getParameter("password");
			System.out.println(mobileno);
			System.out.println(password);
			ps.setString(1, mobileno);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				name=rs.getString("username");
				amount=rs.getDouble("amount");
//				System.out.println(amount);
				
				RequestDispatcher dispatcher=req.getRequestDispatcher("welcomepage.jsp");
				dispatcher.include(req, resp);

				
			}
			else {
				
				RequestDispatcher dispatcher=req.getRequestDispatcher("login.html");
				dispatcher.include(req, resp);
				
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
