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

@WebServlet("/BankManagementSystem/changePassword")
public class ChangePassword extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out=resp.getWriter();
		String mobileno=Login.mobileno;
		String password = Login.password;
		resp.setContentType("text/html");
		String oldPassword=req.getParameter("newPassword");
		String newPassword= req.getParameter("oldPassword");
		if(!oldPassword.equals(newPassword)) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connect= DriverManager.getConnection("jdbc:mysql://localhost:3306/bankmanagementsystem?user=root&password=12345");
				PreparedStatement ps=connect.prepareStatement("UPDATE bankuserdetails SET password = ? WHERE password=? and phonenumber=?");
				
				System.out.println(oldPassword);
				System.out.println(newPassword);
				
				ps.setString(1, oldPassword);
				ps.setString(2,newPassword);
				ps.setString(3, mobileno);
				int result = ps.executeUpdate();
				if(result!=0) {
					RequestDispatcher dispatcher=req.getRequestDispatcher("login.html");
					dispatcher.include(req, resp);
				}
				else {
					req.setAttribute("invalidPassword", "Invlaid old Password");
					RequestDispatcher dispatcher=req.getRequestDispatcher("PasswordChange.jsp");
					dispatcher.include(req, resp);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			req.setAttribute("invalidPassword", "Invlaid old Password");
			RequestDispatcher dispatcher=req.getRequestDispatcher("PasswordChange.jsp");
			dispatcher.include(req, resp);
		}
	}

}

