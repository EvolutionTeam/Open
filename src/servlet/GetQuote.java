package servlet;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.spec.KeySpec;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

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

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import database.dbconnection;

/**
 * Servlet implementation class GetQuote
 */
@WebServlet("/GetQuote")
public class GetQuote extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static int ID = 1;

	public static String encrypt(String strToEncrypt, String secret) 
	{
		String salt = "ssshhhhhhhhhhh!!!!";
	    try
	    {
	        byte[] iv = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	        IvParameterSpec ivspec = new IvParameterSpec(iv);
	         
	        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
	        KeySpec spec = new PBEKeySpec(secret.toCharArray(), salt.getBytes(), 65536, 256);
	        SecretKey tmp = factory.generateSecret(spec);
	        SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");
	         
	        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
	        cipher.init(Cipher.ENCRYPT_MODE, secretKey, ivspec);
	        return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
	    } 
	    catch (Exception e) 
	    {
	        System.out.println("Error while encrypting: " + e.toString());
	    }
	    return null;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String secretKey = "boooooooooom!!!!";
		// TODO Auto-generated method stub
		String Name = request.getParameter("name");
		String DOB = request.getParameter("dob");
		String Gender = request.getParameter("gender");
		String Contact = request.getParameter("contact");
		String Address = request.getParameter("address");
		String School = request.getParameter("school");
		String Grade = request.getParameter("grade");
		String[] Subjects = request.getParameterValues("subject") ;
		String U_name = request.getParameter("u_name");
		String Password = encrypt((request.getParameter("password")), secretKey);
	
		
		String subs = "";
		
		for(int i = Subjects.length;i > 0;i-- ) {
			
			subs = subs + "  " +Subjects[i-1];
		}
		
		Statement st;
		Connection con = null;
		PreparedStatement ps = null;
		

		String query = "insert into std_inf(`name`, `dob`, `gender`, `contact`, `address`, `school`, `grade`,`subject`,`u_name`,`password`,`qr_code`) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			con = dbconnection.getConnection();
			
			String filePath = "C:\\Users\\Shyamal\\Desktop\\cccc\\Projects\\QR-code\\"+"ST_2020_"+ ID +".png";
			
			
			
			ps = con.prepareStatement(query);
			ps.setString(1, Name);
			ps.setString(2, DOB);
			ps.setString(3, Gender);
			ps.setString(4, Contact);
			ps.setString(5, Address);
			ps.setString(6, School);
			ps.setString(7, Grade);	
			ps.setString(8, subs);	
			ps.setString(9, U_name);	
			ps.setString(10, Password);	
			ps.setString(11, filePath);	
			ps.execute();
			
			String sql2 = ("SELECT * FROM  std_inf where  name ='" +Name+"'");
			ps = con.prepareStatement(sql2);
			ResultSet res = ps.executeQuery();
			
			String subject="";
			String grade = "";
			while(res.next()) {
				subject = res.getString("subject");
				grade = res.getString("grade");
			}
			
			
	       	String qrCodeData = "Student ID : " +ID+ "\nStudent Name :" + Name+"\nGrade :" + grade+"\nSubjects:" + subject;
	       	
            String charset = "UTF-8"; // or "ISO-8859-1"
            Map < EncodeHintType, ErrorCorrectionLevel > hintMap = new HashMap < EncodeHintType, ErrorCorrectionLevel > ();
            hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
            BitMatrix matrix = new MultiFormatWriter().encode(
                new String(qrCodeData.getBytes(charset), charset),
                BarcodeFormat.QR_CODE, 200, 200, hintMap);
            MatrixToImageWriter.writeToFile(matrix, filePath.substring(filePath
                .lastIndexOf('.') + 1), new File(filePath));
            
            System.out.println("QR Code image created successfully!");
            
            ID = ID + 1;
            
			response.sendRedirect("Home.jsp");
			

		} catch (SQLException ex) {

			System.out.println(ex.getMessage().toString());
			
		} catch (ClassNotFoundException ex) {

			System.out.println(ex.getMessage().toString());
		} catch (WriterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
