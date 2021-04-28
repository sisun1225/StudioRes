package mainController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.StudioResDAO;
import model.StudioVO;

/**
 * Servlet implementation class SearchAll
 */
@WebServlet("/main/searchAll")
public class SearchAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		List<StudioVO> slist = dao.selectStudioByOption("","",new String[0]);
		request.setAttribute("searchAll", slist); 
		

		RequestDispatcher rd = request.getRequestDispatcher("mainList.jsp");
		rd.forward(request, response);
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

