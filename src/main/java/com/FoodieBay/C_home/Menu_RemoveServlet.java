package com.FoodieBay.C_home;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Menu_RemoveServlet")
public class Menu_RemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		String food=request.getParameter("food");
		String detail=request.getParameter("detail");
		String quantity=request.getParameter("quantity");
		String price=request.getParameter("price");
		String category=request.getParameter("category");
		System.out.println(id);
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/FoodieBay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
			PreparedStatement pstmt=con.prepareStatement("UPDATE Menu SET food=?, detail=?, quantity=?, price=?, category=? WHERE id=?");
			pstmt.setString(1, food);
			pstmt.setString(2, detail);
			pstmt.setString(3, quantity);
			pstmt.setString(4, price);
			pstmt.setString(5, category);
			pstmt.setString(6, id);
			
			pstmt.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		System.out.println(id);
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/FoodieBay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
			PreparedStatement pstmt=con.prepareStatement("DELETE FROM Menu WHERE id=?");
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
