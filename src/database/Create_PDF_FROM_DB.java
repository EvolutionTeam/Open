package database;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;
public class Create_PDF_FROM_DB {
    public static void generatePDF() {
        String FILE_NAME = "C:\\Users\\Shyamal\\Desktop\\cccc\\Projects\\java_pdf\\student_DB.pdf";
        Document document = new Document();
        try {
            PdfWriter.getInstance(document, new FileOutputStream(new File(FILE_NAME)));
            document.open();
            Paragraph p = new Paragraph();
            document.add(Image.getInstance("C:\\Users\\Shyamal\\Desktop\\cccc\\Projects\\WebContent\\img\\PDFopen.jpg"));
            p.setAlignment(Element.ALIGN_CENTER);
            document.add(p);
            Paragraph p2 = new Paragraph();
            p2.add("Open Education Vertex"); //no alignment
            document.add(p2);
            Font f = new Font();
            f.setStyle(Font.BOLD);
            f.setSize(8);
            document.add(new Paragraph("Are you Ready to Take the Challenge?\n\n", f));
            document.add(new Paragraph("Student information list\n\n", f));
               
        	dbconnection obj = new dbconnection();
    		Connection con = obj.getConnection();
            
            String query = "select * from std_inf";
            Statement stmt = null;
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            Paragraph p3 = null;
            while (rs.next()) {
                p3 = new Paragraph();
                p3.add(rs.getString("idStd_Inf")+")");
                p3.add("\t\t\t");
                p3.add("Name : "+rs.getString("name"));
                p3.add("\n\t\t\t\t\t\t");
                p3.add("Birth day : "+rs.getString("dob"));
                p3.add("\n\t\t\t\t\t\t");
                p3.add("Gender : "+rs.getString("gender"));
                p3.add("\n\t\t\t\t\t\t");
                p3.add("Contact : "+rs.getString("contact"));
                p3.add("\n\t\t\t\t\t\t");
                p3.add("Address : "+rs.getString("address"));
                p3.add("\n\t\t\t\t\t\t");
                p3.add("Grade : "+rs.getString("grade"));
                p3.add("\n\t\t\t\t\t\t");
                p3.add("Subject : "+rs.getString("subject"));
                p3.add("\n\n\n");
                document.add(p3);
            }
            document.close();
            System.out.println("Done");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}