package mainController;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReservationsVO;
import model.StudioResDAO;
import model.StudioVO;

/**
 * Servlet implementation class SearchByNoDate
 */
@WebServlet("/main/searchByNoDate")
public class SearchByNoDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		 String s_radio = request.getParameter("radioVal"); 
		 int i_radio =Integer.parseInt(s_radio); 
		 String s_date = request.getParameter("dateVal");
		 Date d_date= Date.valueOf(s_date);
		 
		 System.out.println(i_radio); 
		 System.out.println(d_date);
		 
		 StudioResDAO dao = new StudioResDAO();
		 
		 List<ReservationsVO> resvList = dao.selectResvByRoomNoDate(d_date, i_radio);
		
		 System.out.println(resvList.size());
		 
		 request.setAttribute("resvList", resvList);
		 request.setAttribute("i_radio", i_radio);
		 request.setAttribute("d_date", d_date);
		 
		 
		 
		RequestDispatcher rd = request.getRequestDispatcher("resvTimeList.jsp");
		rd.forward(request, response);
		

	}




	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String insertRadioVal = request.getParameter("insertRadioVal"); 
		String insertDateVal = request.getParameter("insertDateVal"); 
		String[] insertArr = request.getParameterValues("insertChakArrVal[]");
		
		System.out.println("-----");
		System.out.println(insertRadioVal);
		System.out.println(insertDateVal);
		
		RequestDispatcher rd = request.getRequestDispatcher("/main/searchAll");
		rd.forward(request, response);
		
	}
}

