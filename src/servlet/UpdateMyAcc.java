package servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.KeySpec;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.dbconnection;
import manager.EncAndDec;

/**
 * Servlet implementation class UpdateMyAcc
 */
@WebServlet("/UpdateMyAcc")
public class UpdateMyAcc extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ID = request.getParameter("id");
		String Contact = request.getParameter("contact");
		String Address = request.getParameter("address");
		String School = request.getParameter("school");
		String U_name = request.getParameter("uname");
		String Password = request.getParameter("password");
		
		String secretKey = "boooooooooom!!!!";
		
		Password = EncAndDec.encrypt(Password, secretKey);
		
		System.out.println("ID1"+ID);
		
		Statement st;
		Connection con = null;
		PreparedStatement ps = null;

		String query = "UPDATE std_inf SET `contact`='"+Contact+"',`address`='"+Address+"',`school`='"+School+"',`u_name`='"+U_name+"',`password`='"+Password+"' WHERE idStd_Inf='"+ID+"'";
		
		try {
			con = dbconnection.getConnection();
			ps = con.prepareStatement(query);
			ps.executeUpdate();
			response.sendRedirect("MyAcc.jsp?idStd_Inf="+ID+"");			

		} catch (SQLException ex) {
			System.out.println(ex.getMessage().toString());

		} catch (ClassNotFoundException ex) {
			System.out.println(ex.getMessage().toString());

		}
	}

}
