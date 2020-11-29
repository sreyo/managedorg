package upeta.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import upeta.admin.dao.Validate;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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
	    response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
	          
	    String n=request.getParameter("username");  
	    String p=request.getParameter("userpass");  
	    String h = request.getParameter("hostname");
	    if(Validate.checkUser(n,h,p)){  System.out.println("helo");
	    	HttpSession session = request.getSession(true); // reuse existing
	        session.setAttribute("name",n);  
	        session.setAttribute("host",h);  
	        String newhost = new String("viswagokulam.org");
	        String kala = new String("kalakendram.org");
            if (h.equals(newhost)) {        System.out.println("vis"); 

                String admin = new String("admin@sreyo.com");
                if(n.equals(admin)) {
    		        RequestDispatcher rd=request.getRequestDispatcher("newdashboard.jsp");  
    		        rd.forward(request,response); 
    	        }else {
    		        RequestDispatcher rd=request.getRequestDispatcher("userviswadashboard.jsp");  
    		        rd.forward(request,response); 

    	        }
            }else if (h.equals(kala)) {         System.out.println("kala");

                String admin = new String("admin@sreyo.com");
                if(n.equals(admin)) {
    		        RequestDispatcher rd=request.getRequestDispatcher("newdashboard.jsp");  
    		        rd.forward(request,response); 
    	        }else {
    		        RequestDispatcher rd=request.getRequestDispatcher("userviswadashboard.jsp");  
    		        rd.forward(request,response); 

    	        }
            }else {
            String admin = new String("admin@sreyo.com");
            if(n.equals(admin)) {
		        RequestDispatcher rd=request.getRequestDispatcher("newdashboard.jsp");  
		        rd.forward(request,response); 
	        }else {
		        RequestDispatcher rd=request.getRequestDispatcher("userdashboard.jsp");  
		        rd.forward(request,response); 

	        }}
	    }  
	    else{  
	        RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
	        rd.include(request,response);  
	    }  
	          
	    out.close();  
	    }  


}
