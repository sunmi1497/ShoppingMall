package com.tjoeun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tjoeun.dto.MemberVO;
import com.tjoeun.dto.Paging;
import com.tjoeun.util.DBManager;

public class MemberDAO {
	private MemberDAO(){
		
	}
	private static MemberDAO instance=new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	public int confirmID(String id) {
		int result = -1;
		String sql = "select * from member where id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if ( rs.next() ) result = 1;
			else result = -1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;
	}
	
	public int insertMember(MemberVO mVo) {
		int result = 0;
		String sql = "insert into member(id, pwd, name, email, address, phone) values(?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getId());
			pstmt.setString(2, mVo.getPwd());
			pstmt.setString(3, mVo.getName());
			pstmt.setString(4, mVo.getEmail());
			pstmt.setString(5, mVo.getAddress());
			pstmt.setString(6, mVo.getPhone());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public MemberVO getMember(String id) {
		MemberVO mdto = new MemberVO();

		String sql = "select * from member where id=?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println("id : "+id);
				mdto.setId(rs.getString("id"));
				mdto.setPwd(rs.getString("pwd"));
				mdto.setName(rs.getString("name"));
				mdto.setEmail(rs.getString("email"));
				mdto.setAddress(rs.getString("address"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setUseyn(rs.getString("useyn"));
				mdto.setIndate(rs.getTimestamp("indate"));
				mdto.setAdmin_yn(rs.getString("admin_yn"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mdto;
	}
	
	
	/*
	 * * 관리자 모드에서 사용되는 메소드 * *
	 */
	public ArrayList<MemberVO> listMember(String member_name, Paging paging) {
		ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
		String sql = "select * from (SELECT * FROM (select ROW_NUMBER() OVER(order by indate desc) row_num, member.* from member "
				+ "where name like '%'||?||'%' and admin_yn='n') WHERE row_num >= ?) WHERE row_num<= ?";
		
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			if (member_name == "") {
				pstmt.setString(1, "%");
			} else {
				pstmt.setString(1, member_name);
			}
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO mVo = new MemberVO();
				mVo.setId(rs.getString("id"));
				mVo.setPwd(rs.getString("pwd"));
				mVo.setName(rs.getString("name"));
				mVo.setEmail(rs.getString("email"));
				mVo.setAddress(rs.getString("address"));
				mVo.setPhone(rs.getString("phone"));
				mVo.setUseyn(rs.getString("useyn"));
				mVo.setIndate(rs.getTimestamp("indate"));
				memberList.add(mVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return memberList;
	}
	
	public int getAllCount(String key) {
		int count = 0;
		
		String sql = "SELECT COUNT(*) as count FROM member where name like '%'||?||'%' and admin_yn='n'";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			if (key == "") {	//* key가 전해졌을때와 없을때를 나눔
				pstmt.setString(1, "%");
			} else {
				pstmt.setString(1, key);
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return count;
	}

}
