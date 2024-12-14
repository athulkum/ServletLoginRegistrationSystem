package com.codewithathul;

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
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class Login  extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	resp.setContentType("text/html");
	String email =	req.getParameter("email");
	String password =	req.getParameter("password");
	PrintWriter out = resp.getWriter();
	HttpSession session =req.getSession();
	         
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/myservletjdbc", "root", "root");
		 
		 System.out.println("Connection login");
		 
		 PreparedStatement ps = con.prepareStatement("select * from codeewithathul where email=? and password=?");
		 ps.setString(1, email);
		 ps.setString(2, password);
		 
		 System.out.println("Emailid :"+email);
		 System.out.println("Password :"+password);
		 
		 ResultSet rs = ps.executeQuery();
		 System.out.println(" Executing query..login");
		 
		 if(rs.next()) {
			 session.setAttribute("username", rs.getString("username"));
			RequestDispatcher rd = req.getRequestDispatcher("welcome.jsp");
			rd.include(req, resp);
		 }else {
		  session.setAttribute("error","Invalid email or password. Please try again."); 
	      RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
	      rd.include(req, resp);
		}
		 
		 
	}catch (Exception e) {
		// TODO: handle exception
	 out.println("error occur :"+e.getMessage());
	 RequestDispatcher rd =	req.getRequestDispatcher("login.jsp");
	 rd.include(req, resp);
	 
	}
	
   }
}
