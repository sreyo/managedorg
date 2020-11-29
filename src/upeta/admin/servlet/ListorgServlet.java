package upeta.admin.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import upeta.admin.bean.member;
import upeta.admin.bean.organization;
import upeta.admin.dao.Memberdao;
import upeta.admin.dao.Organizationdao;

/**
 * Servlet implementation class ListorgServlet
 */
@WebServlet("/ListorgServlet")
public class ListorgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListorgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");System.out.println(hostname);
	    List<member> list=Memberdao.getFamilylist(hostname);   System.out.println(list);     
        String orgjson = new Gson().toJson(list);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(orgjson);
        } catch(Exception e){e.printStackTrace();}
		

	}


}
