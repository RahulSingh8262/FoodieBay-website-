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

@WebServlet("/menuServlet")
public class menuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cid="";
		String cartid="";
		String fid=request.getParameter("id");
		String cmail=request.getParameter("cmail");
	    PrintWriter out=response.getWriter();
	    
	    
	    try {
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
	    	PreparedStatement pstmt=con.prepareStatement("SELECT id FROM Customers WHERE email=?");
	    	pstmt.setString(1, cmail);
	    	ResultSet rs=pstmt.executeQuery();
	    	while(rs.next())
	    	{
	    		cid=rs.getString("id");
	    	}
	    	pstmt=con.prepareStatement("INSERT INTO Cart(fid,cid)VALUES(?,?);");
	    	pstmt.setString(1, fid);
	    	pstmt.setString(2, cid);
	    	pstmt.execute();
	    	pstmt=con.prepareStatement("SELECT id FROM Cart WHERE cid=? AND fid=?");
	    	pstmt.setString(1, cid);
	    	pstmt.setString(2, fid);
	    	rs=pstmt.executeQuery();
	    	while(rs.next())
	    	{
	    		cartid=rs.getString("id");
	    	}
	    	
	    	response.getWriter().write(cartid);
	    }catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String cartid=request.getParameter("id");
		//System.out.println(cartid);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
			PreparedStatement pstmt=con.prepareStatement("DELETE FROM Cart WHERE id=?");
			pstmt.setString(1, cartid);
			pstmt.execute();
			response.getWriter().write("done");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
