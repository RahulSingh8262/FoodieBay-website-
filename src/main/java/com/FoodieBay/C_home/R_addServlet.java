package com.FoodieBay.C_home;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class R_addServlet
 */

@MultipartConfig
@WebServlet("/R_addServlet")
public class R_addServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String food_name=request.getParameter("food_name");
		String details=request.getParameter("details");
		String quantity=request.getParameter("quantity");
		String price=request.getParameter("price");
		String category=request.getParameter("category");
		String rid=request.getParameter("rid");
		
		
		try 
		{
			
			//for storing image into folder
			Part file=request.getPart("pic");
			String imageFileName=file.getSubmittedFileName();
			String uploadPath="D:/Projects/FoodieBay/FoodieBay/src/main/webapp/Menu_img/"+imageFileName;
			FileOutputStream fos=new FileOutputStream(uploadPath);
			InputStream is=file.getInputStream();
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/FoodieBay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
			PreparedStatement pstmt=con.prepareStatement("INSERT INTO Menu(rid,food,detail,quantity,price,category,pic)VALUES(?,?,?,?,?,?,?)");
			pstmt.setString(1, rid);
			pstmt.setString(2, food_name);
			pstmt.setString(3, details);
			pstmt.setString(4, quantity);
			pstmt.setString(5, price);
			pstmt.setString(6, category);
			pstmt.setString(7, imageFileName);
			pstmt.execute();
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
//			try {
//				con.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
		}
	}

}
