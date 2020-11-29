package upeta.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import upeta.admin.bean.organization;
import upeta.admin.dao.Organizationdao;

/**
 * Servlet implementation class UpdateorgServlet
 */
@WebServlet("/UpdateorgServlet")
public class UpdateorgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateorgServlet() {
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
        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");
          
        String sid=request.getParameter("id");  
        int id=Integer.parseInt(sid);  
        String name=request.getParameter("name");  
        String address=request.getParameter("address");  
         
        organization e=new organization();  
        e.setId(id);  
        e.setName(name);  
        e.setAddress(address);  
          
        int status=Organizationdao.update(e,hostname);  
        if(status>0) {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write("Success");


			/*
			 * response.setContentType("application/json");
			 * response.setCharacterEncoding("UTF-8");
			 * response.getWriter().write("Success");
			 */
		} 

        }

	}

