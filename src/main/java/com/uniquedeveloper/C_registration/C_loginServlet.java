package com.uniquedeveloper.C_registration;

import java.io.IOException;
import java.sql.DriverManager;

import java.sql.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class C_loginServlet
 */
@WebServlet("/C_loginServlet")
public class C_loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	String cmail=request.getParameter("EId");
		String cpass=request.getParameter("password");
		HttpSession session=request.getSession();
		RequestDispatcher dispatcher=null;
		if(cmail==null || cmail.equals(""))
		{
			request.setAttribute("status","invalidCEmail");
			dispatcher=request.getRequestDispatcher("C_login.jsp");
			dispatcher.forward(request,response);
		}
		if(cpass==null || cpass.equals(""))
		{
			request.setAttribute("status","invalidCpwd");
			dispatcher=request.getRequestDispatcher("C_login.jsp");
			dispatcher.forward(request,response);
		}
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			//String url="jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false";
			//String username="root";
			//String password="root";
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
			PreparedStatement pstmt=con.prepareStatement("SELECT * FROM Customers WHERE email=? AND password=?");
			pstmt.setString(1,cmail);
			pstmt.setString(2,cpass);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				session.setAttribute("name",rs.getString("name"));
				dispatcher=request.getRequestDispatcher("C_home.jsp");
			}
			else
			{
				request.setAttribute("status","Failed");
				dispatcher=request.getRequestDispatcher("C_login.jsp");
			}
			dispatcher.forward(request,response);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
    
}