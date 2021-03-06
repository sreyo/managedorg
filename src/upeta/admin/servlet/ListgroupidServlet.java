package upeta.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import upeta.admin.bean.member;
import upeta.admin.dao.Memberdao;

/**
 * Servlet implementation class ListgroupidServlet
 */
@WebServlet("/ListgroupidServlet")
public class ListgroupidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListgroupidServlet() {
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
		try {
		    String sesid=request.getParameter("sesid"); 
	        HttpSession session = request.getSession(true);
	        String hostname = (String) session.getAttribute("host");

		    List<member> list=Memberdao.getGrouplist(sesid,hostname);        
	        String orgjson = new Gson().toJson(list);System.out.println(orgjson);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(orgjson);
	        } catch(Exception e){e.printStackTrace();}
			
	}

}
