package upeta.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import upeta.admin.bean.member;
import upeta.admin.dao.Memberdao;

/**
 * Servlet implementation class UpdatememServlet
 */
@WebServlet("/UpdatememServlet")
public class UpdatememServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatememServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  String fname=request.getParameter("fname");
	      String lname=request.getParameter("lname");  
	      String email =request.getParameter("email");  
	      String gender =request.getParameter("gender");  
	      String city=request.getParameter("city");  
	      String state=request.getParameter("state");  
	      String country=request.getParameter("country");  
	      String zip=request.getParameter("zip");  
	      String password=request.getParameter("pswd");  
	      String groupid=request.getParameter("group");  
	      String username=request.getParameter("username");  
	      String address=request.getParameter("address");  
	      String phone=request.getParameter("phone");  
	      

	      String id=request.getParameter("id");  
	        HttpSession session = request.getSession(true);
	        String hostname = (String) session.getAttribute("host");
	      
	       
	      member e=new member();  
	      e.setFirstname(fname);  
	      e.setLastname(lname);
	      e.setGender(gender);
	      e.setEmail(email);
	      e.setCity(city);
	      e.setState(state);
	      e.setCountry(country);
	      e.setZip(zip);
	      e.setPassword(password);
	      e.setGroupid(groupid);
	      e.setUsername(username);
	      e.setPhone(phone);
	      e.setAddress(address);  
	        
	      int status=Memberdao.adminupdate(e,id,hostname);  
	      response.setContentType("text/html");

	      if(status>0) {
	          response.getWriter().write("success");

	      }else {    
	          response.getWriter().write("failed");
			} 

		}

}



