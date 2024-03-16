package com.uniquedeveloper.C_registration;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
@WebServlet("/R_registrationServlet")
public class R_registrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oname = request.getParameter("name");
        String rname = request.getParameter("restaurantName");
        String email = request.getParameter("email");
        String contact = request.getParameter("phone");
        String pass = request.getParameter("password");
        String rpass = request.getParameter("reEnterPassword");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String area = request.getParameter("area");
        String pincode = request.getParameter("pincode");
        String type = request.getParameter("businessType");

        RequestDispatcher dispatcher = null;

        if (oname == null || oname.equals("")) {
            request.setAttribute("status", "invalidoname");
            dispatcher = request.getRequestDispatcher("R_registration.jsp");
            dispatcher.forward(request, response);
        }
        if (rname == null || rname.equals("")) {
            request.setAttribute("status", "invalidrname");
            dispatcher = request.getRequestDispatcher("R_registration.jsp");
            dispatcher.forward(request, response);
        }
        if (email == null || email.equals("")) {
            request.setAttribute("status", "invalidemail");
            dispatcher = request.getRequestDispatcher("R_registration.jsp");
            dispatcher.forward(request, response);
        }
        if (pass == null || pass.equals("")) {
            request.setAttribute("status", "invalidpass");
            dispatcher = request.getRequestDispatcher("R_registration.jsp");
            dispatcher.forward(request, response);
        } else if (!pass.equals(rpass)) {
            request.setAttribute("status", "invalidrpass");
            dispatcher = request.getRequestDispatcher("R_registration.jsp");
            dispatcher.forward(request, response);
        } else if (contact.length() > 10 || contact.length() < 10) {
            request.setAttribute("status", "invalidcontact");
            dispatcher = request.getRequestDispatcher("R_registration.jsp");
            dispatcher.forward(request, response);
        }
        if (city == null || city.equals("")) {
            request.setAttribute("status", "invalidcity");
            dispatcher = request.getRequestDispatcher("R_registration.jsp");
            dispatcher.forward(request, response);
        }
        if (area == null || area.equals("")) {
            request.setAttribute("status", "invalidarea");
            dispatcher = request.getRequestDispatcher("R_registration.jsp");
            dispatcher.forward(request, response);
        }
        if (pincode == null || pincode.equals("")) {
            request.setAttribute("status", "invalidpincode");
            dispatcher = request.getRequestDispatcher("R_registration.jsp");
            dispatcher.forward(request, response);
        }
        Connection con = null;

        try {
    
			Part file=request.getPart("reataurantImage");
			String imageFileName=file.getSubmittedFileName();
			String uploadPath="D:/Projects/FoodieBay/FoodieBay/src/main/webapp/Restaurants_images/"+imageFileName;
			FileOutputStream fos=new FileOutputStream(uploadPath);
			InputStream is=file.getInputStream();
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
			
			
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodiebay?allowPublicKeyRetrieval=true&autoReconnect=true&useSSL=false","root", "root");
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO Restaurants(name,owner_name,email,password,contact,colony,city,pincode,country,logo,wallpaper)VALUES(?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, rname);
            pstmt.setString(2, oname);
            pstmt.setString(3, email);
            pstmt.setString(4, pass);
            pstmt.setString(5, contact);
            pstmt.setString(6, area);
            pstmt.setString(7, city);
            pstmt.setString(8, pincode);
            pstmt.setString(9, country);
            pstmt.setString(10, imageFileName);
            pstmt.setString(11, type);

            pstmt.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}
