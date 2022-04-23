package kr.co.sist.badasaja.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.dbConnection.DbConnection;
import kr.co.sist.badasaja.vo.CForumVO;
import kr.co.sist.badasaja.vo.CImgVO;
import kr.co.sist.badasaja.vo.CuVO;
import kr.co.sist.badasaja.vo.FReportVO;
import kr.co.sist.badasaja.vo.HashTagVO;
import kr.co.sist.badasaja.vo.ReportVO;
import kr.co.sist.badasaja.vo.TransactionVO;



/**
 * 게시글 상세보기
 */
public class DetailCForumDAO {
	
	/**
	 * 게시물 제목,시간 불러오기
	 */
	public List<CForumVO> selectForum(CForumVO cfVO) throws SQLException, NamingException{
		List<CForumVO> cfoList = new ArrayList<CForumVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc= DbConnection.getInstance();
		try{
			con = dc.getConn();
			
			
			StringBuilder detailQuery = new StringBuilder();
			detailQuery.append("SELECT CF_TOPIC, WRITE_DATE FROM C_FORUM WHERE CF_NUM = ?");
			pstmt=con.prepareStatement(detailQuery.toString());
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CForumVO cfoVO = new CForumVO();
				cfoVO.setCfTopic(rs.getString("cf_topic"));
				cfoVO.setWriteDate("write_date");
				cfoList.add(cfoVO);
				
			}//end while
			
		}finally {
			dc.close(rs, pstmt, con);
		}//end finally

		
		
		return cfoList;
	}// selectForum
	
	/**
	 * 게시글 사진 불러오기
	 */
	public List<CImgVO> selectCImg() throws SQLException, NamingException {
		List<CImgVO> cimgList = new ArrayList<CImgVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try{
			con = dc.getConn();
			
			
			StringBuilder imgQuery = new StringBuilder();
			imgQuery.append("SELECT CF_NUM, IMG FROM C_IMG WHERE CF_NUM = ?");
			pstmt=con.prepareStatement(imgQuery.toString());
			
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CImgVO cimgVO = new CImgVO();
				cimgVO.setImg("img");
				cimgList.add(cimgVO);
				
			}//end while
			
		}finally {
			dc.close(rs, pstmt, con);
		}//end finally
		
		return cimgList;
	}//selectCImg
	
	/**
	 * 게시글 해시태그 불러오기
	 */
	public List<HashTagVO>selectHash() throws SQLException, NamingException{
		List<HashTagVO> htList = new ArrayList<HashTagVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try{
			con = dc.getConn();
			
			
			StringBuilder hashQuery = new StringBuilder();
			hashQuery.append("SELECT CF_NUM, HASH FROM HASHTAG WHERE CF_NUM = ?");
			pstmt=con.prepareStatement(hashQuery.toString());
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				HashTagVO htVO = new HashTagVO();
				htVO.setHash("hash");
				htList.add(htVO);
				
			}//end while
			
		}finally {
			dc.close(rs, pstmt, con);
		}//end finally
		
		
		return htList;
	}//selectHash
	
	/**
	 * 게시물 작성자 정보 불러오기 - 닉네임, 거래만족도, 프로필 사진
	 */
	public List<CuVO> selectCustomer() throws SQLException, NamingException{
		List<CuVO> cuList = new ArrayList<CuVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try{
			con = dc.getConn();
			
			
			StringBuilder cuQuery = new StringBuilder();
			cuQuery
			.append("SELECT C.CF_NUM, CU.NICKNAME, CU.PROFILE, CS.SCORE ")
			.append("FROM C_FORUM C, CUSTOMER CU, C_SCORE CS ")
			.append("WHERE C.C_ID = CU.C_ID ")
			.append("AND CS.C_ID = C.C_ID;");
			pstmt=con.prepareStatement(cuQuery.toString());
			
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				CuVO cuVO = new CuVO();
				cuVO.setNickName("nickname");
				cuVO.setProfile("profile");
				cuVO.setScore("score");
				cuList.add(cuVO);
				
			}//end while
			
		}finally {
			dc.close(rs, pstmt, con);
		}//end finally
		
		
		
		return cuList;
		
		
	}//selectCustomer
	
	/**
	 * 거래 상태 조회
	 */
	public List<TransactionVO> selectTstatus() throws SQLException, NamingException{
		List<TransactionVO> tsList = new ArrayList<TransactionVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try{
			con = dc.getConn();
			
			
			StringBuilder tStatusQuery = new StringBuilder();
			tStatusQuery 
			.append("SELECT C_ID, CF_NUM, T_STATUS")
			.append("FROM TRANSACTION")
			.append("WHERE CF_NUM = ? ");
			pstmt=con.prepareStatement(tStatusQuery.toString());
			
			
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				TransactionVO tsVO = new TransactionVO();
				tsVO.setcID("c_id");
				tsVO.setCfNum("cf_num");
				tsVO.settStatus("t_status");
				tsList.add(tsVO);
				
			}//end while
			
		}finally {
			dc.close(rs, pstmt, con);
		}//end finally
		
		
		
		
		return tsList;
	}//selectTstatus
	
	/**
	 * 계정 신고
	 */
	public void insertCReport(List<ReportVO>rplist) throws SQLException, NamingException{
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		
		DbConnection dc= DbConnection.getInstance();
		
		try {
			con =dc.getConn();
			
		StringBuilder creportQuery = new StringBuilder();
		creportQuery
		.append("insert into c_report(r_code, cr_main, cr_date) ")
		.append(" values(?,?,sysdate);");
		pstmt=con.prepareStatement(creportQuery.toString());
		
		
		ReportVO rpVO = new ReportVO();
		pstmt.setInt(1,rpVO.getrCode());
		pstmt.setString(2,rpVO.getrCategory());
		
		rs=pstmt.executeQuery();
		}finally {
			dc.close(rs, pstmt, con);
			
		}
		
	}//insertReport
	
	/**
	 * 게시글 신고
	 * @throws SQLException 
	 * @throws NamingException 
	 */
	public void insertFreport(FReportVO frVO) throws SQLException, NamingException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		
		DbConnection dc= DbConnection.getInstance();
		
		try {
			con =dc.getConn();
			
		StringBuilder creportQuery = new StringBuilder();
		creportQuery
		.append("insert into c_report(reported_id, report_id, r_code, cr_main, cr_status, cr_date) ")
		.append(" values(?,?,?,?,?,sysdate);");
		pstmt=con.prepareStatement(creportQuery.toString());
		
		
		pstmt.setInt(1,frVO.getrCode());
		pstmt.setString(2,frVO.getCfNum());
		
		rs=pstmt.executeQuery();
		}finally {
			dc.close(rs, pstmt, con);
			
		}
		
	}//insertFreport
}//class
