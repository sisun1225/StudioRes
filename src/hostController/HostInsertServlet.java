package hostController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.HostVO;
import model.StudioResDAO;

/**
 * Servlet implementation class HostInsert
 */
@WebServlet("/host/hostInsert")
public class HostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//호스트 회원가입 페이지
		RequestDispatcher rd = request.getRequestDispatcher("hostInsert.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//호스트 회원등록 후 메인페이지?
		HostVO host = new HostVO();
		StudioResDAO dao = new StudioResDAO();
		host.setHost_id(request.getParameter("host_id"));
		host.setHost_pw(request.getParameter("host_pw"));
		host.setHost_name(request.getParameter("host_name"));
		host.setHost_phone(request.getParameter("host_phone"));
		host.setHost_email(request.getParameter("host_email"));
		int result = dao.insertHost(host);
		//System.out.println(result>0?"입력성공":"입력실패");
		RequestDispatcher rd = request.getRequestDispatcher("hostLogin");
		rd.forward(request, response);
	}
}
