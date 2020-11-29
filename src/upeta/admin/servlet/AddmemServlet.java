package upeta.admin.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import upeta.admin.bean.member;
import upeta.admin.bean.organization;
import upeta.admin.dao.Memberdao;
import upeta.admin.dao.Organizationdao;

/**
 * Servlet implementation class AddmemServlet
 */
@WebServlet("/AddmemServlet")
public class AddmemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddmemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

        String fname  =request.getParameter("fname");  
        String lname  =request.getParameter("lname");  
        String email  =request.getParameter("email");  
        String phone  =request.getParameter("phone");  
        String password  =request.getParameter("password");  

        String address=request.getParameter("address");  
        String gender =request.getParameter("gender");  
        String dob    =request.getParameter("dob");  
        String city   =request.getParameter("city");  
        String state  =request.getParameter("state");  
        String zip    =request.getParameter("zip");  
        String country=request.getParameter("country");  
        String hostname=request.getParameter("hostname");  
        String referedby=request.getParameter("referedby");  
        String local=request.getParameter("local");  
        String address1=request.getParameter("address1");  

        member m=new member();  
        m.setFirstname(fname);  
        m.setLastname(lname);  
        m.setEmail(email);  
        m.setPhone(phone);  
        m.setPassword(password);  

        m.setAddress(address);  
        m.setGender(gender);  
        m.setDob(dob);  
		 m.setCity(city);
		 m.setState(state);
		 m.setCountry(country);
		 m.setZip(zip);
        m.setCreatedby(email);
        m.setAddress1(address1);
        m.setLocal(local);
        m.setReferredby(referedby);
        
        int status=Memberdao.save(m,hostname);  
        if(status>0){  
            response.setContentType("text/html");
            response.getWriter().write("success");

        }else{  
            response.getWriter().write("failed");

        }  


	}
}
