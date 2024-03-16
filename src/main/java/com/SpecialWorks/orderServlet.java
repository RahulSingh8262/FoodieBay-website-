package com.SpecialWorks;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime; 

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.protocol.Resultset;

@WebServlet("/orderServlet")
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String cid=request.getParameter("cid");
		//System.out.println(cid);
		try
		{
			String cname="";
			String rid=request.getParameter("rid");
			DateTimeFormatter date = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			System.out.println(date.format(now));
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
			Statement stmt=con.createStatement();
			PreparedStatement pstmt=con.prepareStatement("SELECT name FROM Customers WHERE id=?");
			pstmt.setString(1, cid);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				cname=rs.getString("name");
			}
			//System.out.println(cname);
			pstmt=con.prepareStatement("SELECT Cart.id, Menu.id AS fid, Menu.price FROM Menu INNER JOIN Cart On Cart.fid=Menu.id WHERE cid=?");
			pstmt.setString(1, cid);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String fid=rs.getString("fid");
				String price=rs.getString("price");
				String cart_id=rs.getString("id");
				String q1="INSERT INTO Orders(customer_id,customer_name,food_id,order_date,price,status,rid)VALUES("+cid+",'"+cname+"',"+fid+",'"+date.format(now)+"',"+price+",'Successed',"+rid+");";
				stmt.executeUpdate(q1);
				String q2="DELETE FROM Cart WHERE id="+cart_id+";";
				stmt.executeUpdate(q2);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		} 
	}
}
