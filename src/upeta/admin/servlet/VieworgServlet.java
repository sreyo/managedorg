package upeta.admin.servlet;
import java.io.IOException;  

import java.io.PrintWriter;  
import java.util.List;  


import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.google.gson.Gson;

import upeta.admin.bean.organization;
import upeta.admin.dao.Organizationdao;

/**
 * Servlet implementation class VieworgServlet
 */
@WebServlet("/VieworgServlet")
public class VieworgServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
    private Gson gson = new Gson();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VieworgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");


		String sesid = request.getParameter("sesid").trim();
		if(sesid == null || "".equals(sesid)){
			sesid = "Guest";
		}
		
         
        List<organization> list=Organizationdao.getAllorganization(hostname);  
        
        String userJsonString = new Gson().toJson(list);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(userJsonString);

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
