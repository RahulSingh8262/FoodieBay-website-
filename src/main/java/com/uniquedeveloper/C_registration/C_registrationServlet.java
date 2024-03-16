package com.uniquedeveloper.C_registration;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.*;
import java.io.*;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class C_registrationServlet
 */
@WebServlet("/C_registrationServlet")
public class C_registrationServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String cname=request.getParameter("name");
		String cmail=request.getParameter("EId");
		String cpass=request.getParameter("password");
		String repass=request.getParameter("repassword");
		String cphone=request.getParameter("contact");
		RequestDispatcher dispatcher=null;
		
		if(cname==null || cname.equals(""))
		{
			request.setAttribute("status","invalidCname");
			dispatcher=request.getRequestDispatcher("C_registration.jsp");
			dispatcher.forward(request,response);
		}
		if(cmail==null || cmail.equals(""))
		{
			request.setAttribute("status","invalidCEmail");
			dispatcher=request.getRequestDispatcher("C_registration.jsp");
			dispatcher.forward(request,response);
		}
		if(cpass==null || cpass.equals(""))
		{
			request.setAttribute("status","invalidCpwd");
			dispatcher=request.getRequestDispatcher("C_registration.jsp");
			dispatcher.forward(request,response);
		}
		else if(!cpass.equals(repass))
		{
			request.setAttribute("status","invalidCrepwd");
			dispatcher=request.getRequestDispatcher("C_registration.jsp");
			dispatcher.forward(request,response);
		}
		if(cphone==null || cphone.equals(""))
		{
			request.setAttribute("status","invalidCph");
			dispatcher=request.getRequestDispatcher("C_registration.jsp");
			dispatcher.forward(request,response);
		}
		else if(cphone.length() > 10)
		{
			request.setAttribute("status","invalidCphlen");
			dispatcher=request.getRequestDispatcher("C_registration.jsp");
			dispatcher.forward(request,response);
		}
		
		Connection con=null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			//String url="jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false";
			//String username="root";
			//String password="root";
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
			PreparedStatement pstmt=con.prepareStatement("INSERT INTO Customers(name,email,password,contact)VALUES(?,?,?,?)");
			pstmt.setString(1, cname);
			pstmt.setString(2, cmail);
			pstmt.setString(3, cpass);
			pstmt.setString(4, cphone);
			
			int rowCount=pstmt.executeUpdate();
			if(rowCount>0)
			{
				 request.setAttribute("status","Success");
				 dispatcher=request.getRequestDispatcher("C_registration.jsp");
			}
			else
			{
				request.setAttribute("status","Failed");
			}
			dispatcher.forward(request,response);
	
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
