package upeta.admin.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import upeta.admin.dao.Memberdao;

/**
 * Servlet implementation class AddhksregServlet
 */
@WebServlet("/AddhksregServlet")
public class AddhksregServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddhksregServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sesid = request.getParameter("sesid");
		String hostname=request.getParameter("hostname");  

        int id = Integer.parseInt(request.getParameter("id"));
        String[] fname =request.getParameterValues("fname[]");
        String[] lname=request.getParameterValues("lname[]");
        String[] relat=request.getParameterValues("relation[]");

        String[] email=request.getParameterValues("email[]");
        String[] phone=request.getParameterValues("phone[]");
        String[] khometown=request.getParameterValues("khometown[]");

        String[] dob=request.getParameterValues("dob[]");
        String[] monthdob=request.getParameterValues("monthdob[]");
        String[] gender=request.getParameterValues("gender[]");   
       
        String[] address=request.getParameterValues("address[]");
        String[] address1=request.getParameterValues("address1[]");
        String[] zip=request.getParameterValues("zip[]");

        String[] city=request.getParameterValues("city[]");
        String[] state=request.getParameterValues("state[]");
        String[] country=request.getParameterValues("country[]");
        
        String[] password=request.getParameterValues("password[]");
        String[] course=request.getParameterValues("course[]");
        int status=0;  

        for (int i=0;i<id;i++) { // stmt = con.createStatement(); fname1 =
	 
		     try {
				status=Memberdao.insertkalregMyEntity(hostname,sesid, fname[i], lname[i], email[i], phone[i], relat[i], dob[i], gender[i], address[i],address1[i], city[i], state[i], country[i], zip[i],khometown[i],monthdob[i],password[i],course[i]);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}
        
         if(status>0){  
             response.setContentType("text/html;charset=UTF-8");
             response.getWriter().write("success");

         }else{  
             response.getWriter().write("Sorry! unable to save record");

             System.out.println("Sorry! unable to save record");  
         }  
	}

}
