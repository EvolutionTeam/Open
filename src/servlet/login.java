package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.dbconnection;
import manager.EncAndDec;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			Connection con = null;
			PreparedStatement pst = null;
			ResultSet rs = null;

			try {
				dbconnection obj = new dbconnection();
				con = obj.getConnection();

				String user = request.getParameter("user");
				String secretKey = "boooooooooom!!!!";
				String password = EncAndDec.encrypt(request.getParameter("pass"), secretKey);
				
				
				String sql = "SELECT * FROM users WHERE username='" + user + "' and password='" + password + "'";

				pst = con.prepareStatement(sql);
				rs = pst.executeQuery();
				while (rs.next()) {
					HttpSession session1 = request.getSession(true);
					session1.setAttribute("username",user );
					
					String type = rs.getString("type");
					if ("user".equals(type)) {
						response.sendRedirect("Home.jsp");
					}
					if ("manager".equals(type)) {
						response.sendRedirect("Manager.jsp");
					}
					if ("admin".equals(type)) {
						response.sendRedirect("Admin.jsp");
					}
				}
				
				
				 sql = "SELECT * FROM std_inf WHERE u_name ='" + user + "' and password='" + password + "'";
				 
				pst = con.prepareStatement(sql);
				rs = pst.executeQuery();
				
				
				while (rs.next()) {
					HttpSession session1 = request.getSession(true);
					session1.setAttribute("username",user );
					
					
						response.sendRedirect("UserView.jsp");
					
					
				}
				

			} catch (Exception e) {
				out.println(e.getMessage().toString());
			}

		}
	}

}
