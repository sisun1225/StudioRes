package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

public class StudioResDAO {


	//메인페이지 조건별조회
	public List<StudioVO> selectStudioByOption(String[] locOption, String[] detailOption){
		List<StudioVO> studioList = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null; 
		ResultSet rs = null;


		String sqlResult ="select * from studios where 1=1";
		String sqlLoc="";
		String sqlOption="";

		for(int k=0; k<locOption.length; k++) {
			if(locOption[k]==null) {break;} 	
			sqlLoc +=" and (loc="+"'"+locOption[k]+"'"+" or subway="+"'"+locOption[k]+"')";	
		}

		for(int i=0; i<detailOption.length; i++) {
			if(detailOption[i]==null) {break;} 
			int j = Integer.parseInt(detailOption[i]);

			switch (j) {
			case 0: sqlOption += " and studio_have_mic=1"; break;
			case 1:	sqlOption += " and studio_have_park=1"; break;
			case 2:	sqlOption += " and studio_have_shower=1"; break;
			case 3:	sqlOption += " and studio_have_water=1"; break;
			case 4:	sqlOption += " and studio_have_aircon=1"; break;
			case 5:	sqlOption += " and studio_have_heater=1"; break;
			case 6:	sqlOption += " and studio_have_toilet=1"; break;
			default: break;
			}
		}


		String sql = sqlResult + sqlOption + sqlLoc;
		try {
			st = conn.prepareStatement(sql);
			rs = st.executeQuery(); 
			while(rs.next()) { 
				StudioVO studio = new StudioVO();
				studio.setStudio_no(rs.getInt(1));
				studio.setHost_no(rs.getInt(2));
				studio.setStudio_desc(rs.getString(3));
				studio.setStudio_name(rs.getString(4));
				studio.setStudio_picture(rs.getString(5));
				studio.setStudio_days(rs.getString(6));
				studio.setStudio_notice(rs.getString(7));
				studio.setStudio_subway(rs.getString(8));
				studio.setStudio_address(rs.getString(9));
				studio.setStudio_check(rs.getString(10));
				studio.setStudio_have_mic(rs.getString(11));
				studio.setStudio_have_park(rs.getString(12));
				studio.setStudio_have_shower(rs.getString(13));
				studio.setStudio_have_water(rs.getString(14));
				studio.setStudio_have_aircon(rs.getString(15));
				studio.setStudio_have_heater(rs.getString(16));
				studio.setStudio_have_toilet(rs.getString(17));

				studioList.add(studio);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return studioList;
	}



	//방 조회 : select * from rooms where studio_no=?
	public List<RoomVO> selectRoomById(int studioNo) {
		List<RoomVO> roomList = new ArrayList<RoomVO>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null; // 변수가 try문 밖으로 못나오니 밖에서 한번 선언해준다.
		ResultSet rs = null;
		String sql = "select * from rooms where studio_no=?";
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, studioNo);
			rs = st.executeQuery(); 
			while(rs.next()) { //있을때까지 돌아라
				RoomVO room = new RoomVO();
				room.setRoom_no(rs.getInt("room_no"));
				room.setStudio_no(rs.getInt("studio_no")); 
				room.setRoom_name(rs.getString("room_name"));
				room.setRoom_capacity(rs.getInt("room_capacity"));
				room.setRoom_intro(rs.getString("room_intro"));
				room.setRoom_price(rs.getInt("room_price"));
				room.setRoom_picture(rs.getString("room_picture"));		

				roomList.add(room);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}	
		return roomList;
	}



	//시간선택(예약된거 불러와서 막아야함) select date, room_no, resv_time /reservation
	public List<ReservationsVO> selectRoomByChk() {
		List<ReservationsVO> reservation = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		Statement st = null; 
		ResultSet rs = null;
		String sql = "select resv_date, room_no, resv_time from reservations where resv_check=0 or resv_check=1";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql); 
			while(rs.next()) { 
				ReservationsVO rv = new ReservationsVO();
				rv.setResv_date(rs.getDate("resv_date"));
				rv.setResv_no(rs.getInt("room_no")); 
				rv.setResv_time(rs.getInt("resv_time"));

				reservation.add(rv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return reservation;
	}



	//예약하기 insert/reservation	
	public int insertReservation(ReservationsVO rv){ 

		String sql="insert into reservations values(resv_seq.nextval, ?, ?, ?, ?, 0)";
		Connection conn=null;
		PreparedStatement st = null;
		int result = 0;

		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);

			st.setInt(2, rv.getGuset_no());
			st.setInt(3, rv.getRoom_no());
			st.setDate(4, rv.getResv_date());
			st.setInt(5, rv.getResv_time());

			result = st.executeUpdate();  

		} catch (SQLException e) {
			e.printStackTrace();

		}finally {
			DBUtil.dbClose(null, st, conn);
		}
		return result;
	}


	//게스트 회원 가입
	public int insertGuest(GuestVO guest) {
		int result = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "insert into guests values (guest_seq.nextval, ?, ?, ?, ?, ?)";

		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(sql);
			st.setString(1, guest.getGuest_id());
			st.setString(2, guest.getGuest_pw());
			st.setString(3, guest.getGuest_name());
			st.setString(4, guest.getGuest_phone());
			st.setString(5, guest.getGuest_email());
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}

		return result;
	}

	//게스트 회원 정보 수정
	public int updateGuest(String id, String pw, String name, String phone, String email) {
		int result = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "update guests set guest_pw = ?, guest_name = ?, guest_phone = ?, guest_email = ? where guest_id = ?";

		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(sql);
			st.setString(1, pw);
			st.setString(2, name);
			st.setString(3, phone);
			st.setString(4, email);
			st.setString(5, id);
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}

		return result;
	}

	//게스트 회원 탈퇴
	public int deleteGuest(String id, String pw) {
		int result = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "delete from guests where guest_id = ? and guest_pw = ?";

		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(sql);
			st.setString(1, id);
			st.setString(2, pw);
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}

		return result;
	}

	//회원 정보 조회
	//select * from guests where guest_id = ?
	public GuestVO selectGuestById(String id) {
		GuestVO guest = null;
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = "select * from guests where guest_id = ? ";

		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(sql);
			st.setString(1, id);
			rs = st.executeQuery();
			while(rs.next()){
				guest = new GuestVO();
				guest.setGuest_no(rs.getInt("guest_no"));
				guest.setGuest_id(rs.getString("guest_id"));
				guest.setGuest_pw(rs.getString("guest_pw"));
				guest.setGuest_name(rs.getString("guest_name"));
				guest.setGuest_phone(rs.getString("guest_phone"));
				guest.setGuest_email(rs.getString("guest_email"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}

		return guest;
	}

	//게스트 예약 조회
	//select * from reservation where guest_no = ?
	public List<ReservationsVO> selectResvByGuestNo(int no){
		List<ReservationsVO> resvlist = new ArrayList<ReservationsVO>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = " select * from reservation where guest_no = ? ";
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, no);
			rs = st.executeQuery();
			while(rs.next()) {
				ReservationsVO resv = makeReservation(rs);
				resvlist.add(resv);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}

		return resvlist;
	}

	//예약 취소
	public int deleteResv(int guest_no) {
		int result = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "delete from reservations where guest_no = ?";

		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, guest_no);
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}

		return result;
	}

	//전체 호스트 조회
	public List<HostVO> selectHostsAll() {
		List<HostVO> hostlist = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = 
				" select * from hosts";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				HostVO vo = new HostVO();
				vo.setHost_email(rs.getString("Host_email"));
				vo.setHost_id(rs.getString("Host_id"));
				vo.setHost_name(rs.getString("Host_name"));
				vo.setHost_no(rs.getInt("Host_no"));
				vo.setHost_phone(rs.getString("Host_phone"));
				vo.setHost_pw(rs.getString("Host_pw"));
				hostlist.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return hostlist;
	}

	//전체 게스트 조회
	public List<GuestVO> selectGuestsAll() {
		List<GuestVO> guestlist = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = 
				" select * from guests";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				GuestVO vo = new GuestVO();
				vo.setGuest_email(rs.getString("Guest_email"));
				vo.setGuest_id(rs.getString("Guest_id"));
				vo.setGuest_name(rs.getString("Guest_name"));
				vo.setGuest_no(rs.getInt("Guest_no"));
				vo.setGuest_phone(rs.getString("Guest_phone"));
				vo.setGuest_pw(rs.getString("Guest_pw"));
				guestlist.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return guestlist;
	}

	//전체 방 조회
	public List<RoomVO> selectRoomsAll() {
		List<RoomVO> roomlist = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = 
				" select * from rooms";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				RoomVO vo = new RoomVO();
				vo.setRoom_capacity(rs.getInt("Room_capacity"));
				vo.setRoom_intro(rs.getString("Room_intro"));
				vo.setRoom_name(rs.getString("Room_name"));
				vo.setRoom_no(rs.getInt("Room_no"));
				vo.setRoom_picture(rs.getString("Room_picture"));
				vo.setRoom_price(rs.getInt("Room_price"));
				vo.setStudio_no(rs.getInt("Studio_no"));
				roomlist.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return roomlist;
	}

	//전체 연습실 조회
	public List<StudioVO> selectStudiosAll() {
		List<StudioVO> studiolist = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = 
				" select * from studios order by studio_check,studio_no";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				StudioVO vo = new StudioVO();
				vo.setHost_no(rs.getInt("Host_no"));
				vo.setStudio_address(rs.getString("Studio_address"));
				vo.setStudio_check(rs.getString("Studio_check"));
				vo.setStudio_days(rs.getString("Studio_days"));
				vo.setStudio_desc(rs.getString("Studio_desc"));
				vo.setStudio_have_aircon(rs.getString("Studio_have_aircon"));
				vo.setStudio_have_heater(rs.getString("Studio_have_heater"));
				vo.setStudio_have_mic(rs.getString("Studio_have_mic"));
				vo.setStudio_have_park(rs.getString("Studio_have_park"));
				vo.setStudio_have_shower(rs.getString("Studio_have_shower"));
				vo.setStudio_have_toilet(rs.getString("Studio_have_toilet"));
				vo.setStudio_have_water(rs.getString("Studio_have_water"));
				vo.setStudio_name(rs.getString("Studio_name"));
				vo.setStudio_no(rs.getInt("Studio_no"));
				vo.setStudio_notice(rs.getString("Studio_notice"));
				vo.setStudio_picture(rs.getString("Studio_picture"));
				vo.setStudio_subway(rs.getString("Studio_subway"));
				studiolist.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return studiolist;
	}

	//전체 예약 조회
	public List<ReservationsVO> selectReservationsAll() {
		List<ReservationsVO> reservationlist = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		Statement st = null;
		ResultSet rs = null;
		String sql = 
				" select * from reservations";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				ReservationsVO vo = new ReservationsVO();
				vo.setGuset_no(rs.getInt("Guset_no"));
				vo.setResv_check("Resv_check");
				vo.setResv_date(rs.getDate("Resv_date"));
				vo.setResv_no(rs.getInt("Resv_no"));
				vo.setResv_time(rs.getInt("Resv_time"));
				vo.setRoom_no(rs.getInt("Room_no"));
				reservationlist.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return reservationlist;
	}

	//연습실상세내역조회 - by id
	public StudioVO selectStudioByNo(int studioNo) {
		StudioVO vo = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		String sql = 
				"select * from studios where studio_no = ?";
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, studioNo);
			rs = st.executeQuery();
			while(rs.next()) {
				vo.setHost_no(rs.getInt("Host_no"));
				vo.setStudio_address(rs.getString("Studio_address"));
				vo.setStudio_check(rs.getString("Studio_check"));
				vo.setStudio_days(rs.getString("Studio_days"));
				vo.setStudio_desc(rs.getString("Studio_desc"));
				vo.setStudio_have_aircon(rs.getString("Studio_have_aircon"));
				vo.setStudio_have_heater(rs.getString("Studio_have_heater"));
				vo.setStudio_have_mic(rs.getString("Studio_have_mic"));
				vo.setStudio_have_park(rs.getString("Studio_have_park"));
				vo.setStudio_have_shower(rs.getString("Studio_have_shower"));
				vo.setStudio_have_toilet(rs.getString("Studio_have_toilet"));
				vo.setStudio_have_water(rs.getString("Studio_have_water"));
				vo.setStudio_name(rs.getString("Studio_name"));
				vo.setStudio_no(rs.getInt("Studio_no"));
				vo.setStudio_notice(rs.getString("Studio_notice"));
				vo.setStudio_picture(rs.getString("Studio_picture"));
				vo.setStudio_subway(rs.getString("Studio_subway"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return vo;
	}

	//연습실 신청승인시 studio check를 승인완료(1)로 업데이트
	public int updateStudioChkByNo(int studioNo) {
		int result = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql =" update studios"+ 
				" set studio_check = 1"+
				" where studio_no = ?";
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, studioNo);
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		return result;
	}

	//연습실 미승인시 해당 studio삭제
	public int deleteStudioByNo(int studioNo) {
		int result = 0;
		Connection conn = null;
		PreparedStatement st = null;
		String sql = "delete from studios where studio_no = ?";
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, studioNo);
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		return result;

	}

	//호스트 회원가입
	public int insertHost(HostVO host) {
		String sql = "insert into hosts values(host_seq.nextval,?,?,?,?,?)";
		int result=0;
		Connection conn;
		PreparedStatement st = null;
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(sql);
			st.setString(1, host.getHost_id());
			st.setString(2, host.getHost_pw());
			st.setString(3, host.getHost_name());
			st.setString(4, host.getHost_phone());
			st.setString(5, host.getHost_email());
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		return result;
	}

	//		호스트수정
	public int updateHost(HostVO host) {
		String sql = "update hosts set "
				+ " HOST_PW=?"
				+ " HOST_NAME =?"
				+ " HOST_PHONE=?"
				+ " HOST_EMAIL=?"
				+ " where host_id = ?";
		int result=0;
		Connection conn;
		PreparedStatement st = null;
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(sql);
			st.setString(1, host.getHost_pw());
			st.setString(2, host.getHost_name());
			st.setString(3, host.getHost_phone());
			st.setString(4, host.getHost_email());
			st.setString(5, host.getHost_id());
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		return result;
	}
	//		호스트탈퇴
	public int deleteHost(String hostId) {
		String sql = "delete from hosts where host_id= ?";
		int result = 0;
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;

		try {
			st = conn.prepareStatement(sql);
			st.setString(1, hostId);
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		return result;
	}

	//호스트 상세내역 
	public HostVO selectHostById(String hostId) {
		String sql = "select * from hosts where host_id=?";
		HostVO host = new HostVO();

		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, hostId);
			rs = st.executeQuery();
			while(rs.next()) {
				host.setHost_no(rs.getInt("host_no"));
				host.setHost_id(rs.getString("host_id"));
				host.setHost_email(rs.getString("Host_emai"));
				host.setHost_name(rs.getString("Host_name"));
				host.setHost_phone(rs.getString("Host_phone"));
				host.setHost_pw(rs.getString("Host_pw"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return host;
	}

	//		연습실 등록  insert/s
	public int insertStudio(StudioVO studio) {
		String sql = "insert into studios values(studio_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int result=0;
		Connection conn;
		PreparedStatement st = null;
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, studio.getHost_no());
			st.setString(2, studio.getStudio_desc());
			st.setString(3, studio.getStudio_name());
			st.setString(4, studio.getStudio_picture());
			st.setString(5, studio.getStudio_days());
			st.setString(6, studio.getStudio_notice());
			st.setString(7, studio.getStudio_subway());
			st.setString(8, studio.getStudio_address());
			st.setString(9, studio.getStudio_check());
			st.setString(10, studio.getStudio_have_mic());
			st.setString(11, studio.getStudio_have_park());
			st.setString(12, studio.getStudio_have_shower());
			st.setString(13, studio.getStudio_have_water());
			st.setString(14, studio.getStudio_have_aircon());
			st.setString(15, studio.getStudio_have_heater());
			st.setString(16, studio.getStudio_have_toilet());
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		return result;
	}
	//		연습실수정 update/s/s_no
	public int updateStudio(StudioVO studio) {
		String sql = "update studios set "
				+ " HOST_NO=?"
				+ " STUDIO_DESC=?"
				+ " STUDIO_NAME=?"
				+ " STUDIO_PICTURE=?"
				+ " STUDIO_DAYS=?"
				+ " STUDIO_NOTICE=?"
				+ " STUDIO_SUBWAY=?"
				+ " STUDIO_ADDRESS=?"
				+ " STUDIO_CHECK=?"
				+ " STUDIO_HAVE_MIC=?"
				+ " STUDIO_HAVE_PARK=?"
				+ " STUDIO_HAVE_SHOWER=?"
				+ " STUDIO_HAVE_WATER=?"
				+ " STUDIO_HAVE_AIRCON=?"
				+ " STUDIO_HAVE_HEATER=?"
				+ " STUDIO_HAVE_TOILET=?"
				+ " where studio_id=?";

		int result=0;
		Connection conn;
		PreparedStatement st = null;
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, studio.getHost_no());
			st.setString(2, studio.getStudio_desc());
			st.setString(3, studio.getStudio_name());
			st.setString(4, studio.getStudio_picture());
			st.setString(5, studio.getStudio_days());
			st.setString(6, studio.getStudio_notice());
			st.setString(7, studio.getStudio_subway());
			st.setString(8, studio.getStudio_address());
			st.setString(9, studio.getStudio_check());
			st.setString(10, studio.getStudio_have_mic());
			st.setString(11, studio.getStudio_have_park());
			st.setString(12, studio.getStudio_have_shower());
			st.setString(13, studio.getStudio_have_water());
			st.setString(14, studio.getStudio_have_aircon());
			st.setString(15, studio.getStudio_have_heater());
			st.setString(16, studio.getStudio_have_toilet());
			st.setInt(17, studio.getStudio_no());
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		return result;
	}
	//		연습실 정보 (호스트가 가진)
	public List<StudioVO> selectStudioByHostId(String hostId) {
		String sql = "select * from studios where host_id=?";
		List<StudioVO> studioList = new ArrayList<StudioVO>();
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = conn.prepareStatement(sql);
			st.setString(1, hostId);
			rs = st.executeQuery();
			while(rs.next()) {
				StudioVO studio = new StudioVO();
				studio.setStudio_no(rs.getInt(1));
				studio.setHost_no(rs.getInt(2));
				studio.setStudio_desc(rs.getString(3));
				studio.setStudio_name(rs.getString(4));
				studio.setStudio_picture(rs.getString(5));
				studio.setStudio_days(rs.getString(6));
				studio.setStudio_notice(rs.getString(7));
				studio.setStudio_subway(rs.getString(8));
				studio.setStudio_address(rs.getString(9));
				studio.setStudio_check(rs.getString(10));
				studio.setStudio_have_mic(rs.getString(11));
				studio.setStudio_have_park(rs.getString(12));
				studio.setStudio_have_shower(rs.getString(13));
				studio.setStudio_have_water(rs.getString(14));
				studio.setStudio_have_aircon(rs.getString(15));
				studio.setStudio_have_heater(rs.getString(16));
				studio.setStudio_have_toilet(rs.getString(17));
				studioList.add(studio);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return studioList;
	}
	//예약내역 정보(select /rooms /by room_id)
	public RoomVO selectRoomByRoomNo(int roomNo){
		String sql = "select * from rooms where room_no=?";
		RoomVO room = new RoomVO();

		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, roomNo);
			rs = st.executeQuery();
			while(rs.next()) {
				room.setRoom_capacity(rs.getInt("room_capacity"));
				room.setRoom_intro(rs.getString("Room_intro"));
				room.setRoom_name(rs.getString("Room_name"));
				room.setRoom_no(rs.getInt("Room_no"));
				room.setRoom_picture(rs.getString("Room_picture"));
				room.setRoom_price(rs.getInt("Room_price"));
				room.setStudio_no(rs.getInt("Studio_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return room;
	}
	//		결제 check->1
	public int updateReservationPay(int resvNo) {
		String sql = "update reservations set RESV_CHECK=1 where resv_No=?" ;
		int result=0;
		Connection conn;
		PreparedStatement st = null;
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, resvNo);
			result = st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(null, st, conn);
		}
		return result;
	}
	//		스케쥴러 check->2

	private ReservationsVO makeReservation(ResultSet rs) throws SQLException{
		ReservationsVO resv = new ReservationsVO();
		resv.setResv_no(rs.getInt("resv_no"));
		resv.setGuset_no(rs.getInt("guest_no"));
		resv.setRoom_no(rs.getInt("room_no"));
		resv.setResv_date(rs.getDate("resv_date"));
		resv.setResv_time(rs.getInt("resv_time"));
		resv.setResv_check(rs.getString("resv_check"));
		return null;
	}


}
