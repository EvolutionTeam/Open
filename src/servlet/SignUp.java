package servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.security.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Create_PDF_FROM_DB;
import database.dbconnection;
import manager.EncAndDec;


public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		Create_PDF_FROM_DB.generatePDF();
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Home.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String uname = request.getParameter("uname");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		
		
		Statement st;
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;

		String query = "insert into users(`fname`,`lname`,`username`,`password`,`email`) VALUES (?,?,?,?,?)";
		
		System.out.println("Step3");
		
		try {
			String secretKey = "boooooooooom!!!!";
			con = dbconnection.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, uname);
			ps.setString(4, EncAndDec.encrypt(password, secretKey));
			ps.setString(5, email);
			ps.executeUpdate();
//			response.sendRedirect("login.jsp");
			
			ps.execute();
			
			System.out.println("Step4");
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
			
			

		} catch (SQLException ex) {
			System.out.println(ex.getMessage().toString());

		} catch (ClassNotFoundException ex) {

			System.out.println(ex.getMessage().toString());
		}

	}

}
