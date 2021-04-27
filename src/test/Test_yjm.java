package test;

import java.util.List;

import model.HostVO;
import model.RoomVO;
import model.StudioResDAO;
import model.StudioVO;
import view.TestView;

public class Test_yjm {
	static StudioResDAO dao = new StudioResDAO();
	public static void main(String[] args) {
//		test_room_search();
//		test_host_signup();
//		test_host_update();
//		test_host_delete();
//		test_host_detail();
//		test_studio_request();
//		test_studio_update();
//		test_studio_have_host();
//		test_resv_search();
		test_resv_check_update();
	}

	//성공
	private static void test_host_signup() {
		
		int result = 0;
		//이렇게 테스트하는게 맞나??
		HostVO host = new HostVO();
		host.setHost_email("dcsk@naver.com");
		host.setHost_id("host_yoon1");
		host.setHost_name("yoon_호스1");
		host.setHost_phone("010-2938-1028");
		host.setHost_pw("yoon_pw1");
		result = dao.insertHost(host);
		
		System.out.println(result>0?"호스트동록성공":"호스트등록실패");
	}
	//성공
	private static void test_host_update() {
		int result = 0;
		HostVO host = new HostVO();
		//호스트넘버는 시퀀스라 안건들임......
		//호스트 아이디로 수정 >> 호스트 아이디는 고정
		host.setHost_id("host_yoon1");
		host.setHost_email("dcsk수정@naver.com");
		host.setHost_name("yoon_호스1수정");
		host.setHost_phone("010-2938-1028수정");
		host.setHost_pw("yoon_pw1수정");
		result = dao.updateHost(host);
		System.out.println(result>0?"호스트수정성공":"호스트수정실패");
	}
	//성공
	private static void test_host_delete() {
		int result = 0;
		String hostId = "host_yoon1";
		result = dao.deleteHost(hostId);
		System.out.println(result>0?"호스트삭제성공":"호스트삭제실패");
	}

	private static void test_host_detail() {
		int result = 0;
		String hostId = "host7";
		HostVO host = dao.selectHostById(hostId);
		TestView.view(host);
	}
	
	private static void test_studio_request() {
		int result = 0;
		StudioVO studio = new StudioVO();
		studio.setHost_no(101);
		studio.setStudio_desc("연습실 설명101");
		studio.setStudio_name("yoon_연습실1");
		studio.setStudio_picture("yoon_사진");
		studio.setStudio_days("월수금");
		studio.setStudio_notice("yoon_유의사항1");
		studio.setStudio_subway("신촌");
		studio.setStudio_address("구로구 구로2동");
		studio.setStudio_have_mic("1");
		studio.setStudio_have_park("0");
		studio.setStudio_have_shower("1");
		studio.setStudio_have_water("0");
		studio.setStudio_have_aircon("0");
		studio.setStudio_have_heater("0");
		studio.setStudio_have_toilet("1");
		result = dao.insertStudio(studio);
		System.out.println(result>0?"연습실등록신청성공":"연습실등록신청실패");
	}
	
	private static void test_studio_update() {
		int result = 0;
		StudioVO studio = new StudioVO();
		studio.setStudio_no(102);
		studio.setStudio_desc("연습실 설명101수정");
		studio.setStudio_name("yoon_연습실1수정");
		studio.setStudio_picture("yoon_사진수정");
		studio.setStudio_days("월수금토");
		studio.setStudio_notice("yoon_유의사항1수정");
		studio.setStudio_subway("대방");
		studio.setStudio_address("대방구 대방2동");
		studio.setStudio_check("1");
		studio.setStudio_have_mic("1");
		studio.setStudio_have_park("1");
		studio.setStudio_have_shower("1");
		studio.setStudio_have_water("1");
		studio.setStudio_have_aircon("1");
		studio.setStudio_have_heater("1");
		studio.setStudio_have_toilet("1");
		result = dao.updateStudio(studio);
		System.out.println(result>0?"연습실수정성공":"연습실수정실패");
	}

	private static void test_studio_have_host() {
		//sql조인안하고 나중에 서블릿에서 호스트 아이디값으로 호스트 넘버 찾아서 넣을거 
		String host_id = "3";
		List<StudioVO> studioList = dao.selectStudioByHostId(host_id);
		TestView.view(studioList);
	}
	
	private static void test_resv_search() {
		int roomNo = 3;
		//sql조인안하고 나중에 서블릿에서 호스트 넘버값으로 연습실 넘버 찾고
		//연습실 넘버로 룸넘버 찾기
		RoomVO room = dao.selectRoomByRoomNo(roomNo);
		TestView.view(room);
	}
	
	private static void test_resv_check_update() {
		int result=0;
		int resvNo=100;
		result = dao.updateReservationPay(resvNo);
		System.out.println(result>0?"결제완료":"결제실패");
	}

	
//	private static void test_room_search() {
//		StudioResDAO dao = new StudioResDAO();
//		RoomVO roomlist = dao.selectRoomByRoomNo(1);
//		//TestView.view(roomlist);
//
//	}

}
