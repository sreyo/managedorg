package upeta.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import upeta.admin.bean.suborganization;
import upeta.admin.dao.Suborganizationdao;

/**
 * Servlet implementation class ViewsuborgServlet
 */
@WebServlet("/ViewsuborgServlet")
public class ViewsuborgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Gson gson = new Gson();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewsuborgServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sesid = request.getParameter("sesid").trim();
		if(sesid == null || "".equals(sesid)){
			sesid = "Guest";
		}
        List<suborganization> list=Suborganizationdao.getAllsuborganization();  

        String OrgJsonString = new Gson().toJson(list);		
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(OrgJsonString);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}

}
