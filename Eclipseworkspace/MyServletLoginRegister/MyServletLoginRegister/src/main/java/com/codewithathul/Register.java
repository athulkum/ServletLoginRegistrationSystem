package com.codewithathul;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class Register extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	String username = req.getParameter("username");
	String email = req.getParameter("email");
	String password = req.getParameter("password");
	PrintWriter out =resp.getWriter();
	resp.setContentType("text/html");
	HttpSession session =req.getSession();
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myservletjdbc", "root", "root");
		System.out.println("Connection register");
		
		PreparedStatement ps = con.prepareStatement("insert into codeewithathul (username, email, password) Values(?,?,?)");


		ps.setString(1, username);
		ps.setString(2, email);
		ps.setString(3, password);
		
		System.out.println("Username :"+username);
		System.out.print("Email :"+email);
		System.out.println("Password ::"+password);
		
		int count = ps.executeUpdate();
		System.out.println("Executing query..register");
		
		if(count > 0) {
			
			session.setAttribute("success", "Register Successfully");
			RequestDispatcher rd = req.getRequestDispatcher("resgister.jsp");
			rd.include(req, resp);
		}else {
			session.setAttribute("error", "Registration failed. Please try again");
			RequestDispatcher rd = req.getRequestDispatcher("register.jsp?error=1");
			rd.include(req, resp);
		}
		
		
	}catch (Exception e) {
		// TODO: handle exception
		out.println("error occur..."+e.getMessage());
		RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
		rd.include(req, resp);
	}
	
		
	}
	
}
