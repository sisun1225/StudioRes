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
		String sql = "select * from geusts where guest_id = ? ";

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
				" select * from guests";
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
