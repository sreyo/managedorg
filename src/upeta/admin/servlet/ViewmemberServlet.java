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
 * Servlet implementation class ViewmemberServlet
 */
@WebServlet("/ViewmemberServlet")
public class ViewmemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewmemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sesid = request.getParameter("sesid").trim();
        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");
		if(sesid == null || "".equals(sesid)){
			sesid = "Guest";
		}
        List<member> list=Memberdao.getAllmember(hostname);        
        String MemberJsonString = null;
        MemberJsonString = new Gson().toJson(list);System.out.println(MemberJsonString);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(MemberJsonString);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
