package com.SpecialWorks;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/C_profileServlet")
public class C_profileServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String mail=request.getParameter("mail");
		String password=request.getParameter("password");
		String contact=request.getParameter("contact");
		String house=request.getParameter("house");
		String colony=request.getParameter("colony");
		String city=request.getParameter("city");
		String pincode=request.getParameter("pincode");
		String country=request.getParameter("country");
		try {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
	    	PreparedStatement pstmt=con.prepareStatement("UPDATE Customers SET name=?,email=?,password=?,contact=?,house_name=?,colony=?,city=?,pincode=?,country=? WHERE id=?");
	    	pstmt.setString(1, name);
	    	pstmt.setString(2, mail);
	    	pstmt.setString(3, password);
	    	pstmt.setString(4, contact);
	    	pstmt.setString(5, house);
	    	pstmt.setString(6, colony);
	    	pstmt.setString(7, city);
	    	pstmt.setString(8, pincode);
	    	pstmt.setString(9, country);
	    	pstmt.setString(10, id);
	    	pstmt.execute();
	    	//response.getWriter().write(name); 
	    	
	    }catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	}

}
