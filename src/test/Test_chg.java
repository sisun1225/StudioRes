package test;

import java.util.List;

import model.GuestVO;
import model.HostVO;
import model.ReservationsVO;
import model.RoomVO;
import model.StudioResDAO;
import model.StudioVO;
import view.TestView;

public class Test_chg {
	public static void main(String[] args) {
		
		/*
		 * 테스트 성공
		test_insert_guest();
		test_update_guest();
		test_delete_guest();
		test_select_guest_by_id();
		test_select_resv_by_guest_no();
		test_delete_resv();
		*/
		test1();
		
	}

	private static void test1() {
		StudioResDAO dao = new StudioResDAO();
//		List<StudioVO> slist = dao.selectStudioByHostId("host5");
		HostVO s = dao.loginChk("host1","pw1");
		TestView.view(s);
	}

	private static void test_delete_resv() {
		StudioResDAO dao = new StudioResDAO();
		int result = dao.deleteResv(1, 1, "21/05/01", 7);
		TestView.view(result>0?"예약삭제성공":"예약삭제실패");
	}

	private static void test_select_resv_by_guest_no() {
		StudioResDAO dao = new StudioResDAO();
		List<ReservationsVO> resvlist = dao.selectResvByGuestNo(1);
		System.out.println(resvlist.size());
		TestView.view(resvlist);
		
	}

	private static void test_select_guest_by_id() {
		StudioResDAO dao = new StudioResDAO();
		GuestVO guest = dao.selectGuestById("guest1");
		TestView.view(guest);
	}

	private static void test_delete_guest() {
		StudioResDAO dao = new StudioResDAO();
		int result = dao.deleteGuest("test_id", "test_pw2");
		TestView.view(result>0?"회원삭제성공":"회원삭제실패");
	}

	private static void test_update_guest() {
		StudioResDAO dao = new StudioResDAO();
		int result = dao.updateGuest("test_id", "test_pw2", "test_name2", "test_phone2", "test_email");
		TestView.view(result>0?"회원수정성공":"회원수정실패");
	}

	private static void test_insert_guest() {
		StudioResDAO dao = new StudioResDAO();
		GuestVO guest = new GuestVO(0, "test_id", "test_pw", "test_name", "test_phone", "test_email");
		int result = dao.insertGuest(guest);
		TestView.view(result>0?"회원가입성공":"회원가입실패");		
	}

}
