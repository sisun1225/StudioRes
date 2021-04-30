package hostController;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.StudioResDAO;
import model.StudioVO;

@WebServlet("/host/studioInsert")
public class StudioInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("host_no") == null) {
			response.sendRedirect("hostLogin");
			return;
		}
		RequestDispatcher rd = request.getRequestDispatcher("studioInsert.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		StudioVO studio = new StudioVO();
		
		//사진업로드
		String upload_dir ="imageUpload";
		int size = 1024*1024*10;
		//서버경로
		//String path = getServletContext().getRealPath(upload_dir);
		//이클립스경로
		String path =this.getClass().getResource("").getPath();
		path = path.substring(1,path.indexOf(".metadata"))+request.getContextPath()+"/WebContent/imageUpload";
		
		MultipartRequest mutipartRequest = new MultipartRequest(request, path, size, "utf-8",
					new DefaultFileRenamePolicy());
		Enumeration files = mutipartRequest.getFileNames();
		String str = (String)files.nextElement();
		String originalFileName = mutipartRequest.getOriginalFileName(str);
		
		//부대시설 체크
		String[] facility = mutipartRequest.getParameterValues("have");
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

		//데이터입력(연습실등록)
		HttpSession session = request.getSession();		
		studio.setHost_no((Integer)session.getAttribute("host_no"));
		studio.setStudio_name(mutipartRequest.getParameter("studio_name"));
		studio.setStudio_desc(mutipartRequest.getParameter("studio_desc"));
		studio.setStudio_picture(originalFileName);
		studio.setStudio_days("월화수목금토일");
		studio.setStudio_notice(mutipartRequest.getParameter("studio_notice"));
		studio.setStudio_have_aircon(facilityChk.get("studio_have_aircon"));
		studio.setStudio_have_heater(facilityChk.get("studio_have_heater"));
		studio.setStudio_have_mic(facilityChk.get("studio_have_mic"));
		studio.setStudio_have_park(facilityChk.get("studio_have_park"));
		studio.setStudio_have_shower(facilityChk.get("studio_have_shower"));
		studio.setStudio_have_toilet(facilityChk.get("studio_have_toilet"));
		studio.setStudio_have_water(facilityChk.get("studio_have_water"));
		studio.setStudio_subway(mutipartRequest.getParameter("studio_subway"));
		studio.setStudio_address(mutipartRequest.getParameter("roadFullAddr"));
		dao.insertStudio(studio);
		response.sendRedirect("hostMain");
	}

}
