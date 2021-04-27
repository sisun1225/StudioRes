package test;

import java.sql.Date;
import java.util.List;

import model.GuestVO;
import model.HostVO;
import model.ReservationsVO;
import model.RoomVO;
import model.StudioResDAO;
import model.StudioVO;
import view.TestView;

public class Test_khy {
	public static void main(String[] args) {
		//TestselectHostAll();
		//TestselectGuestsAll();
		//TestselectRoomsAll();
		//TestselectStudiosAll();
		//TestselectReservationssAll();
		//TestselectStudioByNo(4);
		//TestupdateStudioChkByNo(1);
		//TestdeleteStudioByNo(15);
		//TestinsertReservation();
		TestselectRoomByChk();
		//TestselectRoomById();
	}
	


	private static void TestselectRoomById() {
		StudioResDAO dao = new StudioResDAO();
		List<RoomVO> roomlist = dao.selectRoomById(2);
		TestView.view(roomlist);
	}



	private static void TestselectRoomByChk() {
		StudioResDAO dao = new StudioResDAO();
		List<ReservationsVO> reservationlist = dao.selectRoomByChk();
		TestView.view(reservationlist);
	}



	private static void TestinsertReservation() {
		StudioResDAO dao = new StudioResDAO();
		ReservationsVO rv = new ReservationsVO();
		rv.setGuest_no(5);
		rv.setRoom_no(9);
		rv.setResv_date(Date.valueOf("2021-02-03"));
		rv.setResv_time(5);
		int result = dao.insertReservation(rv);
		System.out.println(result>0?"예약완료":"예약실패");
	}



	private static void TestdeleteStudioByNo(int num) {
		StudioResDAO dao = new StudioResDAO();
		int result = dao.deleteStudioByNo(num);
		System.out.println(result>0?"삭제완료":"삭제실패");
		
	}

	private static void TestupdateStudioChkByNo(int num) {
		StudioResDAO dao = new StudioResDAO();
		int result = dao.updateStudioChkByNo(num);
		System.out.println(result>0?"업데이트완료":"업데이트실패");
	}

	private static void TestselectStudioByNo(int num) {
		StudioResDAO dao = new StudioResDAO();
		StudioVO vo = dao.selectStudioByNo(num);
		TestView.view(vo);
	}

	private static void TestselectReservationssAll() {
		StudioResDAO dao = new StudioResDAO();
		List<ReservationsVO> reservationlist = dao.selectReservationsAll();
		TestView.view(reservationlist);
	}

	private static void TestselectStudiosAll() {
		StudioResDAO dao = new StudioResDAO();
		List<StudioVO> studiolist = dao.selectStudiosAll();
		TestView.view(studiolist);
	}

	private static void TestselectRoomsAll() {
		StudioResDAO dao = new StudioResDAO();
		List<RoomVO> roomlist = dao.selectRoomsAll();
		TestView.view(roomlist);
	}

	private static void TestselectGuestsAll() {
		StudioResDAO dao = new StudioResDAO();
		List<GuestVO> guestlist = dao.selectGuestsAll();
		TestView.view(guestlist);
	}

	private static void TestselectHostAll() {
		StudioResDAO dao = new StudioResDAO();
		List<HostVO> hostlist = dao.selectHostsAll();
		TestView.view(hostlist);
	}
	
	
}
