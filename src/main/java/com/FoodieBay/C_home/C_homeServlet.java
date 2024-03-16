package com.FoodieBay.C_home;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.io.*;
import javax.servlet.RequestDispatcher;


@WebServlet("/C_homeServlet")
public class C_homeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
