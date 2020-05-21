package servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.dbconnection;
import manager.EncAndDec;

/**
 * Servlet implementation class UpdateInfor
 */
@WebServlet("/UpdateInfor")
public class UpdateInfor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ID = request.getParameter("id");
		String Name = request.getParameter("name");
		String DOB = request.getParameter("dob");
		String Gender = request.getParameter("gender");
		String Contact = request.getParameter("contact");
		String Address = request.getParameter("address");
		String School = request.getParameter("school");
		String Grade = request.getParameter("grade");
		String[] Subjects = request.getParameterValues("subject") ;
		String U_name = request.getParameter("u_name");
		String Password = request.getParameter("password");
		String QR_IFP = request.getParameter("qr_code");
		
		String secretKey = "boooooooooom!!!!";
		
		Password = EncAndDec.encrypt(Password, secretKey);
		
		String subs = "";
		
		for(int i = Subjects.length;i > 0;i-- ) {
			
			subs = subs + " , " +Subjects[i-1];
		}
		
		
		Statement st;
		Connection con = null;
		PreparedStatement ps = null;
		
		
		String query = "UPDATE std_inf SET `name`='"+Name+"',`dob`='"+DOB+"',`gender`='"+Gender+"',`contact`='"+Contact+"',`address`='"+Address+"',`school`='"+School+"',`grade`='"+Grade+"' ,`subject`='"+subs+"' ,`u_name`='"+U_name+"' ,`password`='"+Password+"' ,`qr_code`='"+QR_IFP+"'  WHERE idStd_Inf ='"+ID+"'";
		
		try {
			
			con = dbconnection.getConnection();
			ps = con.prepareStatement(query);
			ps.executeUpdate();
			response.sendRedirect("Edit.jsp?idStd_Inf="+ID+"");			

		} catch (SQLException ex) {

		} catch (ClassNotFoundException ex) {

		}
	}

}
