package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
