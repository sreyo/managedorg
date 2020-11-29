package upeta.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import upeta.admin.dao.Memberdao;

/**
 * Servlet implementation class ViswalokamServlet
 */
@WebServlet("/ViswalokamServlet")
public class ViswalokamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViswalokamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String hostname = (String) session.getAttribute("host");
	    List appliedList=Memberdao.getViswMember(hostname); 
        ViswaJsonObject viswaJsonObject = new ViswaJsonObject();
        viswaJsonObject.setDraw(5);
        viswaJsonObject.setiTotalDisplayRecords(appliedList.size());
        viswaJsonObject.setiTotalRecords(appliedList.size());
        viswaJsonObject.setAaData(appliedList);
        System.out.println(viswaJsonObject);

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json2 = gson.toJson(viswaJsonObject);           
        out.print(json2);

		//String json = JobDao.getAlljob(hostname);
	}


}
