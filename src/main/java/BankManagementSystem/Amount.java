package BankManagementSystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BankManagementSystem/Amount")
public class Amount extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LocalDate date=LocalDate.now();
	    LocalTime time=LocalTime.now();
		
		PrintWriter out=resp.getWriter();
		String mobileno = Login.mobileno;
		double originalAmount = Login.amount;
		String receiverMobileNo = SendAmount.receiverMobileNo;
		resp.setContentType("text/html");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connect= DriverManager.getConnection("jdbc:mysql://localhost:3306/bankmanagementsystem?user=root&password=12345");
			PreparedStatement ps=connect.prepareStatement("update bankuserdetails set amount=? where phonenumber=?");
			double debitedAmount = Double.parseDouble(req.getParameter("amount"));
			double newAmount=originalAmount-debitedAmount;
			ps.setDouble(1, newAmount);
			ps.setString(2, mobileno);
			if(newAmount>=0 && debitedAmount>0) {  
				int result = ps.executeUpdate();
				if(result!=0) {
					System.out.println("User amount updated successfully....");
					PreparedStatement ps1=connect.prepareStatement("select * from bankuserdetails where phonenumber=?");
					ps1.setString(1, receiverMobileNo);
					ResultSet rs1 = ps1.executeQuery();
					if(rs1.isBeforeFirst()) {
						System.out.println("Receiver mobile number:"+receiverMobileNo);
						if(rs1.next()) {
							double receAmo=rs1.getDouble("amount");
							String receiverName = rs1.getString("username");
//							System.out.println("receiver amount before transaction:"+receAmo);
//							System.out.println("Total amount of receiver is :"+receAmo+debitedAmount);
							ps.setDouble(1, receAmo+debitedAmount);
							ps.setString(2, receiverMobileNo);
							int receiverUpdate = ps.executeUpdate();
							if(receiverUpdate!=0) {
								Random r=new Random();
								int transactionid = r.nextInt(10000, 99999);
								Date d = Date.valueOf(date);
								Time t = Time.valueOf(time);
//								System.out.println("Receiver amount updated successfully");
								for(int i=1;i<=2;i++) {
									ps=connect.prepareStatement("insert into transactiondetails(transactionid, name, mobileno, date, time, amount, transaction) values(?,?,?,?,?,?,?)");
									ps.setInt(1, transactionid);//same
									
									ps.setDate(4, d);//same
									ps.setTime(5, t);//same
									ps.setDouble(6, debitedAmount);//same
									if(i==1) {
										ps.setString(2, receiverName);
										ps.setString(3, mobileno);
										ps.setString(7, "debited");
									}
									else {
										//receiver-->credited
										ps.setString(2, Login.name);
										ps.setString(3, receiverMobileNo);
										ps.setString(7, "credited");
									}
									int update = ps.executeUpdate();
									if(update!=0) {
										System.out.println("transaction details added successfully");
									}
								}
								
							}
						}
					}
					
//					System.out.println("updated Result amount"+result);
					RequestDispatcher dispatcher=req.getRequestDispatcher("PaymentDone.jsp");
					dispatcher.include(req, resp);
				}
			}
			else {
				req.setAttribute("inValidAmount", "Invalid balance..!");

				RequestDispatcher dispatcher=req.getRequestDispatcher("AmountSend.jsp");
				dispatcher.include(req, resp);
				
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
