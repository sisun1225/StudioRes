package hostController;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		for(String s:facility) {
			if(facilityChk.containsKey(s)) {
				facilityChk.replace(s, "1");
			}
		}
		for(Map)
	}

}
