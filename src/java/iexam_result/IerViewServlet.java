package iexam_result;

import java.io.IOException;
  
import java.io.PrintWriter;  
import java.util.List;  
  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
@WebServlet("/IerViewServlet")  
public class IerViewServlet extends HttpServlet {  
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   
               throws ServletException, IOException {  
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter(); 
        
        out.print("<body style='background-image:url(123.png)'>");
        out.println("<button style='background-color: #3358ff; border: none'><a href='mainUI.html' style='text-decoration: none;'>Add New Exam Results</a></button>");  
        out.println("<h1>Exam Result List</h1>");  
          
        List<Ier> list=Ierdb.getAllIEresults();  
          
        out.print("<table border='1' width='100%'");  
        out.print("<tr style='border: 1px solid #ddd;'><th style='background-color: #102ba3;'>Id</th><th style='background-color: #102ba3;'>Index No</th><th style='background-color: #102ba3;'>Grade</th><th style='background-color: #102ba3;'>Subject</th><th style='background-color: #102ba3;'>Result</th> <th style='background-color: #102ba3;'>Edit</th><th style='background-color: #102ba3;'>Delete</th></tr>");  
        for(Ier ier:list){  
         out.print("<tr style='border: 1px solid #ddd;'><td>"+ier.getIerid()+"</td><td>"+ier.getIerindex_no()+"</td><td>"+ier.getIergrade()+"</td><td>"+ier.getIersubject()+"</td><td>"+ier.getIerresult()+"</td><td><button><a href='IerEditServlet?ierid="+ier.getIerid()+"'style='text-decoration: none;'>edit</a></button></td>  <td><button><a href='IerDeleteServlet?ierid="+ier.getIerid()+"'style='text-decoration: none;'>delete</a></button></td></tr>");  
        }  
        out.print("</table>");
        out.print("<form action='exam_rpdf.jsp'>");
        out.print("<button type='submit'>Report</button>");
        out.print("</form>");
        out.print("</body>");
          
        out.close();  
    }  
}