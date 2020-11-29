package upeta.admin.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import upeta.admin.bean.member;
import upeta.admin.dao.Memberdao;

/**
 * Servlet implementation class AddmultimemServlet
 */
@WebServlet("/AddmultimemServlet")
public class AddmultimemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddmultimemServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sesid = request.getParameter("sesid");
        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");

        int id = Integer.parseInt(request.getParameter("id"));
        String[] fname =request.getParameterValues("fname[]");
        String[] lname=request.getParameterValues("lname[]");
        String[] email=request.getParameterValues("email[]");
        String[] phone=request.getParameterValues("phone[]");
        String[] relat=request.getParameterValues("relation[]");
        String[] org=request.getParameterValues("organization[]");
        String[] dob=request.getParameterValues("dob[]");
        String[] address=request.getParameterValues("address[]");
        String[] address1=request.getParameterValues("address[]");
        String[] gender=request.getParameterValues("gender[]");   
        String[] city=request.getParameterValues("city[]");
        String[] state=request.getParameterValues("state[]");
        String[] country=request.getParameterValues("country[]");
        String[] zip=request.getParameterValues("zip[]");



        int status=0;  

        for (int i=0;i<id;i++) { // stmt = con.createStatement(); fname1 =
	 
		     try {
				status=Memberdao.insertMyEntity(hostname,sesid, fname[i], lname[i], email[i], phone[i], relat[i], dob[i], gender[i], address[i],address1[i],org[i], city[i], state[i], country[i], zip[i]);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}
         if(status>0){  
             response.setContentType("text/html;charset=UTF-8");
             response.getWriter().write("Success");

         }else{  
             response.getWriter().write("Sorry! unable to save record");

             System.out.println("Sorry! unable to save record");  
         }  

         
        }
}
