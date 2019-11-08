package com.tjoeun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tjoeun.dto.Paging;
import com.tjoeun.dto.ProductVO;
import com.tjoeun.util.DBManager;

public class ProductDAO {
	public ProductDAO() {
		
	}
	private static ProductDAO instance=new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	}

	public ArrayList<ProductVO> listNewProduct(){
		ArrayList<ProductVO> list=new ArrayList<ProductVO>();
		String sql="select * from new_pro_view";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO pvo=new ProductVO();
				
				pvo.setPseq(rs.getInt("pseq"));
				pvo.setPtitle(rs.getString("ptitle"));
				pvo.setIndate(rs.getTimestamp("indate"));
				pvo.setReadcount(rs.getInt("readcount"));
				list.add(pvo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	public ArrayList<ProductVO> listBestProduct(){
		ArrayList<ProductVO> list=new ArrayList<ProductVO>();
		String sql="select * from best_pro_view";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO pvo=new ProductVO();
				
				pvo.setPseq(rs.getInt("pseq"));
				pvo.setPtitle(rs.getString("ptitle"));
				pvo.setIndate(rs.getTimestamp("indate"));
				pvo.setReadcount(rs.getInt("readcount"));
				list.add(pvo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}	
	
	public ArrayList<ProductVO> listProduct(Paging paging){
		ArrayList<ProductVO> productList=new ArrayList<ProductVO>();
		int startNum = paging.getStartNum();
		int endNum=paging.getEndNum();
		String sql="select * from ( "
					+ "select * from ( "
					+ "select rownum row_num, product.* from product ";
					sql += " order by pseq desc"
					+ " ) where row_num >= ?"
					+ " ) where row_num <= ?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO pvo=new ProductVO();
				
				pvo.setPseq(rs.getInt("pseq"));
				pvo.setPtitle(rs.getString("ptitle"));
				pvo.setKind(rs.getString("kind"));
				pvo.setArea(rs.getString("area"));
				pvo.setPrice(rs.getInt("price"));
				pvo.setPhone(rs.getString("phone"));
				pvo.setPeriod(rs.getInt("period"));
				pvo.setContent(rs.getString("content"));
				pvo.setImage(rs.getString("image"));
				pvo.setUseyn(rs.getString("useyn"));
				pvo.setBestyn(rs.getString("bestyn"));
				pvo.setIndate(rs.getTimestamp("indate"));
				pvo.setId(rs.getString("id"));
				pvo.setReadcount(rs.getInt("readcount"));
				
				productList.add(pvo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return productList;
	}
	
	public int getAllCount() {
		int count=0;
		
		String sql="select count(*) as count from product ";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=DBManager.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt("count");
				System.out.println("count : " + count);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return count;
	}
	
	public ProductVO getProduct(String pseq) {
		ProductVO pvo = null;
		String sql = "select * from product where pseq=?";
		
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pseq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pvo = new ProductVO();
				pvo.setPseq(rs.getInt("pseq"));
				pvo.setPtitle(rs.getString("ptitle"));
				pvo.setKind(rs.getString("kind"));
				pvo.setArea(rs.getString("area"));
				pvo.setPrice(rs.getInt("price"));
				pvo.setPhone(rs.getString("phone"));
				pvo.setPeriod(rs.getInt("period"));
				pvo.setContent(rs.getString("content"));
				pvo.setContent_image(rs.getString("content_image"));
				pvo.setImage(rs.getString("image"));
				pvo.setUseyn(rs.getString("useyn"));
				pvo.setBestyn(rs.getString("bestyn"));
				pvo.setIndate(rs.getTimestamp("indate"));
				pvo.setId(rs.getString("id"));
				pvo.setReadcount(rs.getInt("readcount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return pvo;
	}
	
	public static ArrayList<ProductVO> listKindProduct(String kind) {
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		String sql = "select * from product where kind=?";
		
		Connection conn = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(sql));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductVO pvo = new ProductVO();
				pvo.setPseq(rs.getInt("pseq"));
				pvo.setPtitle(rs.getString("ptitle"));
				pvo.setPrice(rs.getInt("price"));
				pvo.setImage(rs.getString("image"));
				list.add(pvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	
	/*추가 메소드*/
	
	
	public int updateProduct(ProductVO product) {
		int result = -1;
		String sql = "update product set kind=?, useyn=?, ptitle=?, area=?, price=?, period=?, phone=?, content=?, image=?, bestyn=? where pseq=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getKind());
			pstmt.setString(2, product.getUseyn());
			pstmt.setString(3, product.getPtitle());
			pstmt.setString(4, product.getArea());
			pstmt.setInt(5, product.getPrice());
			pstmt.setInt(6, product.getPeriod());
			pstmt.setString(7, product.getPhone());
			pstmt.setString(8, product.getContent());
			pstmt.setString(9, product.getImage());
			pstmt.setString(10, product.getBestyn());
			pstmt.setInt(11, product.getPseq());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	/*
	 * * 관리자 모드에서 사용되는 메소드 *
	 */
	public ArrayList<ProductVO> listAllProduct(Paging paging, String member_name) {
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		String sql = "select * from (SELECT * FROM (SELECT ROW_NUMBER() OVER(order by pseq desc) row_num, product.* from product "
				 + "where ptitle like '%'||?||'%') WHERE row_num >= ?) WHERE row_num<= ?";
		
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			if (member_name == "") {	//* key가 전해졌을때와 없을때를 나눔
				pstmt.setString(1, "%");
			} else {
				pstmt.setString(1, member_name);
			}
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductVO pVo = new ProductVO();
				pVo.setPseq(rs.getInt("pseq"));
				pVo.setArea(rs.getString("area"));
				pVo.setKind(rs.getString("kind"));
				pVo.setIndate(rs.getTimestamp("indate"));
				pVo.setPtitle(rs.getString("ptitle"));
				pVo.setPrice(rs.getInt("price"));
				pVo.setPhone(rs.getString("phone"));
				pVo.setPeriod(rs.getInt("period"));
				pVo.setImage(rs.getString("image"));
				pVo.setUseyn(rs.getString("useyn"));
				pVo.setBestyn(rs.getString("bestyn"));
				pVo.setContent(rs.getString("content"));
				pVo.setId(rs.getString("id"));
				
				productList.add(pVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return productList;
	}
	
	public int getKeyCount(String key) {
		int count = 0;
		
		String sql = "SELECT COUNT(*) as count FROM product where ptitle like '%'||?||'%'";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			if (key == "") {
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
	
	public int insertProduct(ProductVO pVo) {
		int result = 0;

		String sql = "insert into product (pseq, kind, ptitle, area, price, period, id, phone, content, image) "
				+ "values(product_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pVo.getKind());
			pstmt.setString(2, pVo.getPtitle());
			pstmt.setString(3, pVo.getArea());
			pstmt.setInt(4, pVo.getPrice());
			pstmt.setInt(5, pVo.getPeriod());
			pstmt.setString(6, pVo.getId());
			pstmt.setString(7, pVo.getPhone());
			pstmt.setString(8, pVo.getContent());
			pstmt.setString(9, pVo.getImage());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("추가 실패");
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	
}
