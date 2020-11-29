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
 * Servlet implementation class cardinformationServlet
 */
@WebServlet("/cardinformationServlet")
public class cardinformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cardinformationServlet() {
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
	   // response.setContentType("text/html");  
	  //  PrintWriter out = response.getWriter();  
	          
	    String n=request.getParameter("memberid");
	    RequestDispatcher rd=request.getRequestDispatcher("paymentcardinformation.jsp");  
        rd.forward(request,response); 

	 //   String p=request.getParameter("userpass");  
	          
/*            if(n.equals(admin)) {
/*	        }else {
		        RequestDispatcher rd=request.getRequestDispatcher("userdashboard.jsp");  
		        rd.forward(request,response); 

	        }
	    }  
	    else{  
	        RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			
			 * out.println("<font color=red> username or password is wrong.</font>");
			 
	        rd.include(request,response);  
	    }  
*/	          
	    }  


	//}

}
