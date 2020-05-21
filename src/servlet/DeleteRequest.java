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
 * Servlet implementation class DeleteRequest
 */
@WebServlet("/DeleteRequest")
public class DeleteRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteRequest() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");

		Statement st;
		Connection con = null;
		PreparedStatement ps = null;
		dbconnection obj = new dbconnection();

		String query = "delete from Std_Inf where idStd_Inf=?";

		try {
			con = obj.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, id);
			ps.executeUpdate();

			response.sendRedirect("Home.jsp");

		} catch (SQLException ex) {
			
		} catch (ClassNotFoundException ex) {
			
		}
	}

}
