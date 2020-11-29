package upeta.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import upeta.admin.bean.organization;
import upeta.admin.dao.Organizationdao;

/**
 * Servlet implementation class AddorgServlet
 */
@WebServlet("/AddorgServlet")
public class AddorgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddorgServlet() {
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
        String orgid=request.getParameter("org_select");  
        String name=request.getParameter("name");  
        String address=request.getParameter("address");  
        String createdby =request.getParameter("createdby");  
        String parentid=request.getParameter("org_select");
        String grouptype=request.getParameter("grouptype"); 
        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");

        organization o=new organization();  
        o.setName(name);  
        o.setAddress(address);  
        o.setCreatedby(createdby);  
        o.setParentid(parentid); 
        o.setOrgid(orgid); 
        o.setUptgrouptype(grouptype); 

 
         
        int status=Organizationdao.save(o,hostname);  
        if(status>0){  
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write("success");

        }else{  
            response.getWriter().write("Sorry! unable to save record");
           // response.getWriter().write("Success");

        }  
          
    }  
  


}
