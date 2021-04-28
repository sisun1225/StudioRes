package mainController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.HostVO;
import model.RoomVO;
import model.StudioResDAO;
import model.StudioVO;

/**
 * Servlet implementation class RoomDetailServlet
 */
@WebServlet("/main/roomDetail")
public class RoomDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String s_studioid = request.getParameter("studioid");
		int i_studioid = Integer.parseInt(s_studioid);
		StudioResDAO dao = new StudioResDAO();
		
		StudioVO studio = dao.selectStudioByNo(i_studioid);
		request.setAttribute("studio", studio);
		
		HostVO host	= dao.selectHostById(studio.getHost_id());
		request.setAttribute("host", host);
		
		List<String> studiooption = dao.StudioOption(studio);
		request.setAttribute("studiooption", studiooption);
		
		List<RoomVO> room = dao.selectRoomById(studio.getStudio_no());
		request.setAttribute("room", room);
		System.out.println(room);
	
		RequestDispatcher rd = request.getRequestDispatcher("roomDetail.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
