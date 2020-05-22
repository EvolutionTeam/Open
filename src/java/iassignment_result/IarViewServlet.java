package iassignment_result;

import java.io.IOException;
  
import java.io.PrintWriter;  
import java.util.List;  
  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
@WebServlet("/IarViewServlet")  
public class IarViewServlet extends HttpServlet {  
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   
               throws ServletException, IOException {  
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter();
        out.print("<body style='background-image:url(123.png)'>");
        out.println("<button style='background-color: #3358ff; border: none'><a href='assignment_result.html' style='text-decoration: none;'>Add New Assignment Results</a></button>");  
        out.println("<h1>Assignment Result List</h1>");  
        out.println(""); 
        List<Iar> list=Iardb.getAllIAResults();  
          
        out.print("<table border='1' width='100%'"); 
        out.print("<tr style='border: 1px solid #ddd;'><th style='background-color: #102ba3;'>Id</th><th style='background-color: #102ba3;'>Index_no</th><th style='background-color: #102ba3;'>Grade</th><th style='background-color: #102ba3;'>Subject</th><th style='background-color: #102ba3;'>Result</th> <th style='background-color: #102ba3;'>Edit</th style='background-color: #102ba3;'><th style='background-color: #102ba3;'>Delete</th></tr>");  
        for(Iar iar:list){  
         out.print("<tr style='border: 1px solid #ddd;'><td>"+iar.getIarid()+"</td><td>"+iar.getIarindex_no()+"</td><td>"+iar.getIargrade()+"</td><td>"+iar.getIarsubject()+"</td><td>"+iar.getIarresult()+"</td><td><button><a href='IarEditServlet?iarid="+iar.getIarid()+"' style='text-decoration: none;'>edit</a></button></td>  <td><button><a href='IarDeleteServlet?iarid="+iar.getIarid()+"' style='text-decoration: none;'>delete</a></button></td></tr>");  
        }  
        out.print("</table>");
        out.print("<form action='assignment_rpdf.jsp'>");
        out.print("<button type='submit'>Report</button>");
        out.print("</form>");
        out.print("</body>");  
          
        out.close();  
    }  
}