package kr.co.sist.badasaja.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.dbConnection.DbConnection;
import kr.co.sist.badasaja.vo.EntireForumVO;
import kr.co.sist.badasaja.vo.HashTagVO;
import kr.co.sist.badasaja.vo.WishListVO;


/**
 * 물물교환 게시판 조회
 */
public class EntireForumDAO {
	
	public List<EntireForumVO> selectEntireForum() throws SQLException, NamingException{
		
		List<EntireForumVO> eVOList = new ArrayList<EntireForumVO>();
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try{
			con = dc.getConn();
			
			
			StringBuilder entireQuery = new StringBuilder();
			entireQuery.append("SELECT CF_NUM, CF_TOPIC, MAIN_IMG, P_CODE FROM C_FORUM");
			// 1, 2, 3, 4, ... 
			pstmt=con.prepareStatement(entireQuery.toString());
			
			StringBuilder hashQuery = new StringBuilder();
			hashQuery.append("SELECT C.CF_NUM, H.HASH, C.CF_TOPIC FROM C_FORUM C, HASHTAG H WHERE C.CF_NUM = H.CF_NUM AND H.CF_NUM = ? ");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				EntireForumVO efVO = new EntireForumVO();
				List<HashTagVO> hashList = new ArrayList<HashTagVO>();
				
				efVO.setTitle(rs.getString("cf_topic"));
				efVO.setCfNum(rs.getString("cf_num"));
				efVO.setImg(rs.getString("main_img"));
				
				pstmt2=con.prepareStatement(hashQuery.toString());
				pstmt2.setString(1, efVO.getCfNum());
				rs2 = pstmt2.executeQuery();
				
				while(rs2.next()) {
					HashTagVO hsVO = new HashTagVO();
					hsVO.setCfNum(rs2.getString("cf_num"));
					hsVO.setHash(rs2.getString("hash"));
					hashList.add(hsVO);
				}
				
				efVO.setList(hashList);
				
				eVOList.add(efVO);
			}
			
		}finally {
			dc.close(rs, pstmt, con);
			dc.close(rs2, pstmt2, con);
		}//end finally

		return eVOList ;
		
	}//selectEntireForum
	
	/**
	 * 찜목록 추가하기 
	 */
	public void insertWishList(WishListVO wlVO) throws SQLException, NamingException {
		System.out.println(wlVO.getCfNum());
		System.out.println(wlVO.getcID());
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		
		DbConnection dc= DbConnection.getInstance();
		
		try {
			con =dc.getConn();
			
		String WishQuery = "INSERT INTO WISH_LIST VALUES(?,?,SYSDATE)";
		System.out.println(wlVO.getCfNum());
		System.out.println(wlVO.getcID());

		pstmt=con.prepareStatement(WishQuery);
		
		pstmt.setString(1,wlVO.getCfNum());
		pstmt.setString(2,wlVO.getcID());
		
		rs=pstmt.executeQuery();
		}finally {
			dc.close(rs, pstmt, con);
		}
		
	}//insertWishList
	
	/**
	 * 찜목록 삭제하기
	 */
	
	public void deleteWishList(WishListVO wlVO) throws SQLException, NamingException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		
		DbConnection dc= DbConnection.getInstance();
		
		try {
			con =dc.getConn();
		
		String WishQuery = "DELETE FROM WISH_LIST WHERE CF_NUM = ? AND C_ID = ?";
		pstmt=con.prepareStatement(WishQuery);
		
		pstmt.setString(1,wlVO.getCfNum());
		pstmt.setString(2,wlVO.getcID());
		
		rs=pstmt.executeQuery();
		}finally {
			dc.close(rs, pstmt, con);
		}
		
	}//delete



}//class
