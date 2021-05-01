package hostController;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.RoomVO;
import model.StudioResDAO;
import model.StudioVO;


@WebServlet("/host/roomInsert")
public class RoomInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("host_no") == null) {
			response.sendRedirect("hostLogin");
			return;
		}
		request.setAttribute("studio_no", request.getParameter("studio_no"));
		RequestDispatcher rd = request.getRequestDispatcher("roomInsert.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		RoomVO room = new RoomVO();
		
		//사진 업로드
		String upload_dir ="imageUpload";
		int size = 1024*1024*10;
		String path = getServletContext().getRealPath(upload_dir);
		
		MultipartRequest mutipartRequest = new MultipartRequest(request, path, size, "utf-8",
					new DefaultFileRenamePolicy());
		Enumeration files = mutipartRequest.getFileNames();
		String str = (String)files.nextElement();
		String originalFileName = mutipartRequest.getOriginalFileName(str);
		if(originalFileName==null) {
			originalFileName = "이미지 없음"; 
		}
		
		room.setStudio_no(Integer.parseInt(mutipartRequest.getParameter("studio_no")));
		room.setRoom_name(mutipartRequest.getParameter("room_name"));
		room.setRoom_capacity(Integer.parseInt(mutipartRequest.getParameter("room_capacity")));
		room.setRoom_intro(mutipartRequest.getParameter("room_intro"));
		room.setRoom_price(Integer.parseInt(mutipartRequest.getParameter("room_price")));
		room.setRoom_picture(originalFileName);
		dao.insertRoom(room);
		response.sendRedirect("hostSearchStudio");
		
	}

}
