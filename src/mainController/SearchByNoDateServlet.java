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
import javax.servlet.http.HttpSession;

import model.ReservationsVO;
import model.StudioResDAO;
import model.StudioVO;

/**
 * Servlet implementation class SearchByNoDate
 */
@WebServlet("/main/searchByNoDate")
public class SearchByNoDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		 String s_radio = request.getParameter("radioVal"); 
		 int i_radio =Integer.parseInt(s_radio); 
		 String s_date = request.getParameter("dateVal");
		 Date d_date= Date.valueOf(s_date);
		 
		 
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
		HttpSession session = request.getSession();
		
		int insertGuestNo = (Integer)(session.getAttribute("guest_no"));
		int insertRoomNoVal = Integer.parseInt(request.getParameter("insertRoomNoVal")); 
		Date insertDateVal = Date.valueOf(request.getParameter("insertDateVal")); 
		String[] s_insertTimeArr = request.getParameterValues("resvChk");
		
		System.out.println("------날짜 넘버-----");
			System.out.println(insertRoomNoVal);
		    System.out.println(insertDateVal);
			System.out.println(s_insertTimeArr.length);
		   
		System.out.println("-----test-------");
		for(String a : s_insertTimeArr) {
			System.out.println(a);
		}
		System.out.println("------------");
		for(String insertTimeArr : s_insertTimeArr) {
			System.out.println(insertTimeArr);
		}
		
		
		System.out.println("------------");
		StudioResDAO dao = new StudioResDAO();
		
		for(String insertTimeArr : s_insertTimeArr) {
			ReservationsVO reservation = new ReservationsVO();
			reservation.setGuest_no(insertGuestNo);
			reservation.setRoom_no(insertRoomNoVal);
			reservation.setResv_date(insertDateVal);
			reservation.setResv_time(Integer.parseInt(insertTimeArr));	
			int result = dao.insertReservation(reservation);
		}

		
		RequestDispatcher rd = request.getRequestDispatcher("/main/searchAll");
		rd.forward(request, response);
		
	}
}

