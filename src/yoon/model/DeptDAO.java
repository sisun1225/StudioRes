package yoon.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import yoon.util.DBUtil;


public class DeptDAO {
	
	public List<ManagerVO> selectAllManager() {
		List<ManagerVO> malist= new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		Statement st = null; // ë³??ˆ˜ê°? tryë¬? ë°–ìœ¼ë¡? ëª»ë‚˜?˜¤?‹ˆ ë°–ì—?„œ ?•œë²? ?„ ?–¸?•´ì¤??‹¤.
		ResultSet rs = null;
		String sql = " select employee_id, first_name||last_name fullname"
				+ " from EMPLOYEES"
				+ " where employee_id in (select distinct manager_id from employees)";
				
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql); 
			while(rs.next()) { //?ˆ?„?•Œê¹Œì? ?Œ?•„?¼
				ManagerVO manager = new ManagerVO();
				manager.setManager_id(rs.getInt(1));
				manager.setFullname(rs.getString(2));
				malist.add(manager);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return malist;
	}
	
	public List<LocationVO> selectAllLocation() {
		List<LocationVO> loclist = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		Statement st = null; // ë³??ˆ˜ê°? tryë¬? ë°–ìœ¼ë¡? ëª»ë‚˜?˜¤?‹ˆ ë°–ì—?„œ ?•œë²? ?„ ?–¸?•´ì¤??‹¤.
		ResultSet rs = null;
		String sql = "select * from locations order by 1";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql); 
			while(rs.next()) { //?ˆ?„?•Œê¹Œì? ?Œ?•„?¼
				LocationVO location = new LocationVO();
				location.setLocation_id(rs.getInt(1));
				location.setCity(rs.getString("city"));
				loclist.add(location);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return loclist;
	}

	
	
	public List<DeptVO> selectAll() {
		List<DeptVO> deptlist = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		Statement st = null; // ë³??ˆ˜ê°? tryë¬? ë°–ìœ¼ë¡? ëª»ë‚˜?˜¤?‹ˆ ë°–ì—?„œ ?•œë²? ?„ ?–¸?•´ì¤??‹¤.
		ResultSet rs = null;
		String sql = "select * from departments order by 1";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql); 
			while(rs.next()) { //?ˆ?„?•Œê¹Œì? ?Œ?•„?¼
				DeptVO dept = new DeptVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4));
						deptlist.add(dept); //ë§Œë“¤?–´?„œ ?„£?–´ì¤?.....
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		
		
		return deptlist;
	}

	public int insertDept(DeptVO dept) {  
		String sql="insert into departments values(?,?,?,?)";
		Connection conn;
		PreparedStatement st = null;
		int result = 0;
		
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, dept.getDepartment_id());
			st.setString(2, dept.getDepartment_name());
			st.setInt(3, dept.getManager_id());
			st.setInt(4, dept.getLocation_id());
			result = st.executeUpdate();  

		} catch (SQLException e) {
				e.printStackTrace();

		}finally {
			DBUtil.dbClose(null, st, conn);
		}
		
		
		return result;
	}

	public DeptVO selectById(int i_deptid) {
		DeptVO dept = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement st = null; // ë³??ˆ˜ê°? tryë¬? ë°–ìœ¼ë¡? ëª»ë‚˜?˜¤?‹ˆ ë°–ì—?„œ ?•œë²? ?„ ?–¸?•´ì¤??‹¤.
		ResultSet rs = null;
		String sql = "select * from departments where department_id=?";
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, i_deptid);
			rs = st.executeQuery(); 
			while(rs.next()) { //?ˆ?„?•Œê¹Œì? ?Œ?•„?¼
				dept = new DeptVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4));
					
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return dept;
	}

	public int updateDept(DeptVO dept) {
		String sql=" update departments "
				+ " set Department_name=?, Manager_id=?, Location_id=? "
				+ " where Department_id=?";
		Connection conn;
		PreparedStatement st = null;
		int result = 0;
		
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setInt(4, dept.getDepartment_id());
			st.setString(1, dept.getDepartment_name());
			st.setInt(2, dept.getManager_id());
			st.setInt(3, dept.getLocation_id());
			result = st.executeUpdate();  

		} catch (SQLException e) {
				e.printStackTrace();

		}finally {
			DBUtil.dbClose(null, st, conn);
		}
		return result;
	}

	public int deleteDept(int deptid) {
		String sql=" delete from departments "
				+ " where Department_id=?";
		Connection conn;
		PreparedStatement st = null;
		int result = 0;
		
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(sql);
			st.setInt(1, deptid);
			result = st.executeUpdate();  

		} catch (SQLException e) {
				e.printStackTrace();

		}finally {
			DBUtil.dbClose(null, st, conn);
		}
		
		
		return result;
	}
	
	
}
