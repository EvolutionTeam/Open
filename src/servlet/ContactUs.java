package servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import database.dbconnection;

/**
 * Servlet implementation class ContactUs
 */
@WebServlet("/ContactUs")
public class ContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("firstname");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String description = request.getParameter("description");

		Statement st;
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		dbconnection obj = new dbconnection();

		String query = "insert into contactus(`name`,`email`,`title`,`description`) VALUES (?,?,?,?)";

		try {
			con = obj.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, title);
			ps.setString(4, description);
			ps.executeUpdate();
			response.sendRedirect("index.jsp");	

		} catch (SQLException ex) {

		} catch (ClassNotFoundException ex) {

		}
	}

}
