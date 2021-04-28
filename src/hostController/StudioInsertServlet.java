package hostController;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.HostVO;
import model.StudioResDAO;
import model.StudioVO;

/**
 * Servlet implementation class StudioInsertServlet
 */
@WebServlet("/host/studioInsert")
public class StudioInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("studioInsert.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		StudioVO studio = new StudioVO();
		
		String[] facility = request.getParameterValues("have");
		Map<String, String> facilityChk = new HashMap<String, String>();
		facilityChk.put("studio_have_mic", "0");
		facilityChk.put("studio_have_park", "0");
		facilityChk.put("studio_have_shower", "0");
		facilityChk.put("studio_have_water", "0");
		facilityChk.put("studio_have_aircon", "0");
		facilityChk.put("studio_have_heater", "0");
		facilityChk.put("studio_have_toilet", "0");
		if(facility != null) {
			for(String s:facility) {
				if(facilityChk.containsKey(s)) {
					facilityChk.replace(s, "1");
				}
			}
		}
		//사진업로드
		String upload_dir ="imageUpload";
		int size = 1024*1024*10;
		String path = getServletContext().getRealPath(upload_dir);
		System.out.println(path);
		
		MultipartRequest mutipartRequest = new MultipartRequest(request, path, size, "utf-8",
					new DefaultFileRenamePolicy());
		Enumeration files = mutipartRequest.getFileNames();
		String str = (String)files.nextElement();
		System.out.println("str= "+str);
		String originalFileName = mutipartRequest.getOriginalFileName(str);
		System.out.println("originalFileName=  "+originalFileName);

		//데이터입력
		HttpSession session = request.getSession();
		studio.setHost_no((int)session.getAttribute("host_no"));
		studio.setStudio_name(request.getParameter("studio_name"));
		studio.setStudio_desc(request.getParameter("studio_desc"));
		dao.insertStudio(studio);
		System.out.println(facilityChk.get("studio_have_mic"));
	}

}
