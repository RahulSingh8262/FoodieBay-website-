package com.SpecialWorks;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/RD_saverServlet")
public class RD_saverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String rid=request.getParameter("rid");
		RequestDispatcher dispatcher=null;
		Connection con=null;
		try {
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root","root");
				Part file=request.getPart("dimg");
				String imageFileName=file.getSubmittedFileName();
				String uploadPath="C:/Users/Smart-tech/eclipse-workspace/FoodieBay/src/main/webapp/Restaurants_dashboard/"+imageFileName;
				FileOutputStream fos=new FileOutputStream(uploadPath);
				InputStream is=file.getInputStream();
				byte[] data=new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
				
				PreparedStatement pst=con.prepareStatement("update Restaurants set wallpaper=? where email=?;");
				pst.setString(1, imageFileName);
				pst.setString(2, rid);
				pst.executeUpdate();
				
				int rowCount=pst.executeUpdate();
				if(rowCount>0){
					System.out.println("Success");
					dispatcher=request.getRequestDispatcher("R_home.jsp");
				}
				else{
					System.out.println("Failed");
				}
				dispatcher.forward(request,response);
		}catch(Exception e)
		{ e.printStackTrace();
		}
	}

}
