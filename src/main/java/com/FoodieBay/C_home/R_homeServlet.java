package com.FoodieBay.C_home;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.print.event.PrintJobAdapter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/R_homeServlet")
public class R_homeServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String food=request.getParameter("food");
		String detail=request.getParameter("detail");
		String quantity=request.getParameter("quantity");
		String price=request.getParameter("price");
		String category=request.getParameter("category");
		String rid=request.getParameter("rid");
		
		PrintWriter out=response.getWriter();
		if(food==null || food.equals(""))
		{
			 
		}
		if(detail==null || detail.equals(""))
		{
			
		}
		if(quantity==null || quantity.equals(""))
		{
		
		}
		if(price==null || price.equals(""))
		{
			
		}
		if(category==null || category.equals(""))
		{
			
		}
		
		Connection con=null;
		try
		{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
			PreparedStatement pst=con.prepareStatement("INSERT INTO Menu(rid,food,detail,quantity,price,category)VALUES(?,?,?,?,?,?)");
			pst.setString(1, rid);
			pst.setString(2, food);
			pst.setString(3, detail);
			pst.setString(4, quantity);
			pst.setString(5, price);
			pst.setString(6, category);
			pst.executeUpdate();
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	private void getWritter() {
		// TODO Auto-generated method stub
		
	}
}