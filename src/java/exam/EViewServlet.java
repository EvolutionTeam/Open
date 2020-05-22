package exam;

import java.io.IOException;
  
import java.io.PrintWriter;  
import java.util.List;  
  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse; 

@WebServlet("/EViewServlet")  
public class EViewServlet extends HttpServlet {  
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   
               throws ServletException, IOException {  
        response.setContentType("text/html");  
        PrintWriter out=response.getWriter(); 
       
        out.print("<body style='background-image:url(123.png)'>");
        
        out.println("<button style='background-color: #3358ff; border: none'><a href='exam.html' style='text-decoration: none;'>Add New Exam</a></button>");  
        out.println("<h1>Exams List</h1>");  
          
        List<E> list=Edb.getAllExams(); 
       
        
          
        out.print("<table border='3' width='100%' ");  
        out.print("<tr style='border: 1px solid #ddd;'><th style='background-color: #0d37e1;'>Id</th><th style='background-color: #0d37e1;'>Grade</th><th style='background-color: #0d37e1;'>Subject</th><th style='background-color: #0d37e1;'>Link</th> <th style='background-color: #0d37e1;'>Edit</th><th style='background-color: #0d37e1;'>Delete</th></tr>");  
        for(E e:list){  
         out.print("<tr border: 1px solid #ddd;><td>"+e.getEid()+"</td><td>"+e.getEgrade()+"</td><td>"+e.getEsubject()+"</td><td>"+e.getElink()+"</td><td><button><a href='EEditServlet?eid="+e.getEid()+"'style='text-decoration: none;'>edit</a></button></td>  <td><button><a href='EDeleteServlet?eid="+e.getEid()+"'style='text-decoration: none;'>delete</a></button></td></tr>");  
        }  
        out.print("</table>");
        out.print("<form action='exampdf.jsp'>");
        out.print("<button type='submit'>Report</button>");
        out.print("</form>");
        out.print("</body>");
          
        out.close();  
    }  
}