package com.uniquedeveloper.C_registration;

import java.io.IOException;
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


@WebServlet("/R_loginServlet")
public class R_loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String rmail=request.getParameter("EId");
		String rpass=request.getParameter("password");
		HttpSession session=request.getSession();
		RequestDispatcher dispatcher=null;
		if(rmail==null || rmail.equals(""))
		{
			request.setAttribute("status","invalidREmail");
			dispatcher=request.getRequestDispatcher("R_login.jsp");
			dispatcher.forward(request,response);
		}
		if(rpass==null || rpass.equals(""))
		{
			request.setAttribute("status","invalidRpwd");
			dispatcher=request.getRequestDispatcher("R_login.jsp");
			dispatcher.forward(request,response);
		}
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			//String url="jdbc:mysql://localhost:3306/foodiebay?autoReconnect=true&useSSL=false";
			//String username="root";
			//String password="root";
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
			PreparedStatement pstmt=con.prepareStatement("SELECT * FROM Restaurants WHERE email=? AND password=?");
			pstmt.setString(1,rmail);
			pstmt.setString(2,rpass);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				session.setAttribute("name",rs.getString("name"));
				dispatcher=request.getRequestDispatcher("R_home.jsp");
			}
			else
			{
				request.setAttribute("status","Failed");
				dispatcher=request.getRequestDispatcher("R_login.jsp");
			}
			dispatcher.forward(request,response);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
