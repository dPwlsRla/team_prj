package kr.co.sist.badasaja.user.dao;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.dbConnection.DbConnection;
import kr.co.sist.badasaja.vo.CForumVO;
import kr.co.sist.badasaja.vo.CuVO;
import kr.co.sist.badasaja.vo.MyPostBoardVO;
import kr.co.sist.util.cipher.DataDecrypt;
import kr.co.sist.util.cipher.DataEncrypt;


public class MypageDAO {

	/**
	 * 패스워드 찾는 다오 수정
	 * @param cuVO
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 * @throws GeneralSecurityException 
	 * @throws NoSuchAlgorithmException 
	 * @throws UnsupportedEncodingException 
	 */
	public String selectAccount(CuVO cuVO) throws SQLException, NamingException, NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException{
		String password ="";
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		
		DbConnection dc= DbConnection.getInstance();
		try {
		//1. 드라이버 로딩
		//2. 커넥션 얻기
			con=dc.getConn();

			StringBuilder login = new StringBuilder();  
			
			login.append("select c_pass ,c_id from customer where c_pass= ? and c_id= ? ");
			pstmt=con.prepareStatement(login.toString());
			 
			DataEncrypt de = new DataEncrypt("abcefghijklmn1234");//키가 안맞아서 에러 났어요
			password = de.encryption(cuVO.getcPass());
			pstmt.setString(1, password);
			pstmt.setString(2, cuVO.getcID());
			rs=pstmt.executeQuery(); 
			
			if(!rs.next()) {
				
				password="none";
				
			}
		}finally {
		//6. 연결 끊기
		dc.close(rs, pstmt, con);
		}
		return password;
	}//password 찾기
	
	public List<CuVO> selectCustomer(String id) throws SQLException, NamingException, UnsupportedEncodingException, NoSuchAlgorithmException, GeneralSecurityException{
		
		List<CuVO> list = new ArrayList<CuVO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		
		DbConnection dc= DbConnection.getInstance();
		try {
		//1. 드라이버 로딩
		//2. 커넥션 얻기
		con=dc.getConn();

		StringBuilder login = new StringBuilder();  
			
		login.append("select C_ID, GU_CODE, C_PASS ,NICKNAME,TEL, EMAIL from CUSTOMER where C_id= ?");
		pstmt=con.prepareStatement(login.toString());
		DataDecrypt de = new DataDecrypt("abcefghijklmn1234");
		pstmt.setString(1, id);
			
		rs=pstmt.executeQuery(); 
		CuVO cu = null;
		if(rs.next()) {
			cu= new CuVO();
			cu.setcID((rs.getString("C_ID")));
			cu.setGuCode(rs.getInt("GU_CODE"));
			cu.setcPass(de.decryption(rs.getString("C_PASS")));	
			cu.setNickName(rs.getString("NICKNAME"));	
			cu.setTel(rs.getString("TEL"));	
			cu.setEmail(rs.getString("EMAIL"));	
			list.add(cu);
			}
		}finally {
		//6. 연결 끊기
		dc.close(rs, pstmt, con);
		}
		return list;
	}//password 부분
	
	public void updateCustomer(CuVO cuVO) throws SQLException, NamingException, NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException{
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		DbConnection dc= DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			StringBuilder updateQuery = new StringBuilder(); 
			
			
			if(cuVO.getcPass()=="none") {
				updateQuery
				.append("	update CUSTOMER ")
				.append(" set GU_CODE= ? , NICKNAME= ?, TEL= ? , EMAIL=? ")
				.append(" where c_id=?");
				
				pstmt=con.prepareStatement(updateQuery.toString());
				pstmt.setInt(1, cuVO.getGuCode());
				pstmt.setString(2, cuVO.getNickName());
				pstmt.setString(3, cuVO.getTel());
				pstmt.setString(4, cuVO.getEmail());
				pstmt.setString(5, cuVO.getcID());
				
			}else {
				updateQuery
				.append("	update CUSTOMER ")
				.append(" set GU_CODE= ? , C_PASS= ? , NICKNAME= ?, TEL= ? , EMAIL=? ")
				.append(" where c_id=?");
				
				
				
				pstmt=con.prepareStatement(updateQuery.toString());
				pstmt.setInt(1, cuVO.getGuCode());
				pstmt.setString(2, cuVO.getcPass());
				pstmt.setString(3, cuVO.getNickName());
				pstmt.setString(4, cuVO.getTel());
				pstmt.setString(5, cuVO.getEmail());
				pstmt.setString(6, cuVO.getcID());
			}
			
			pstmt.executeUpdate();
		//5. 쿼리수행 후 결과 얻기
		}finally {
		//6. 연결끊기
			dc.close(null, pstmt, con);
		}
		
	}
	
	/**
	 * 내가 쓴 글 목록 조회하기 
	 * 내가 쓴 글 : 내가 작성한 게시글 모아보기
	 * 변수를 쉽게 받기 위해 MyPostBoardVO를 생성했음.
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public List<MyPostBoardVO> selectMyForum(String id) throws SQLException, NamingException{
		
		List<MyPostBoardVO> mpbList = new ArrayList<MyPostBoardVO>();
		
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try {
				con=dc.getConn();
				StringBuilder myForum = new StringBuilder();	
				//화면에서 조회 될 데이터 : 게시글 제목, 게시물 작성일, 거래 대상자 닉네임 
				//입력 받을 데이터 : 사용자 아이디
				
				myForum
				 .append(" select c.cf_num, c.c_id, t.c_id buyer_id, c.cf_topic, to_char(c.write_date, 'yyyy-mm-dd') write_date, c.main_img,")
				 .append(" (select nickname from customer where c_id like t.c_id) nickname ")
				 .append(" from c_forum c , transaction t ")
				 .append(" where c.cf_num=t.cf_num and c.c_id like ? ")
				 .append(" order by c.write_date desc ");
				
				
				pstmt=con.prepareStatement(myForum.toString());
				
				pstmt.setString(1,id);
				
				rs=pstmt.executeQuery();
				
				MyPostBoardVO mpbVO = 	null;
				while(rs.next()) {
					mpbVO =new MyPostBoardVO();
					
					mpbVO.setCfNum(rs.getString("cf_num"));
					mpbVO.setcID(rs.getString("c_id"));
					mpbVO.setBuyerID(rs.getString("buyer_id"));
					mpbVO.setCfTopic(rs.getString("cf_topic"));
					mpbVO.setWriteDate(rs.getString("write_date"));
					mpbVO.setMainImg(rs.getString("main_img"));
					mpbVO.setNickname(rs.getString("nickname"));
					
					mpbList.add(mpbVO);
				}//end while
				
			}finally {
			dc.close(rs, pstmt, con);
			}
		
		return mpbList;
	}
	
	/**
	 * 거래한글 조회 하기
	 * 거래 한글 : 거래 약속이 성사되어 물물교환이 완료된 글 모아보기
	 * @param id
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public List<MyPostBoardVO> selectDoneForum(String id) throws SQLException, NamingException{
		List<MyPostBoardVO> mpbList = new ArrayList<MyPostBoardVO>();
		
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			
			StringBuilder doneForum = new StringBuilder();	
			//화면에서 조회 될 데이터 : 게시글 제목, 게시물 작성일, 거래 대상자 닉네임 
			//입력 받을 데이터 : 사용자 아이디
			
			doneForum
			 .append(" select c.cf_num, c.c_id, t.c_id buyer_id, ")
			 .append(" c.cf_topic, to_char(c.write_date, 'yyyy-mm-dd') write_date, c.main_img, c.cf_status, ")
			 .append(" (select nickname from customer where c_id like t.c_id) nickname ")
			 .append(" from c_forum c , transaction t ")
			 .append(" where c.cf_num = t.cf_num ")
			.append(" and c.c_id= ? and c.cf_status= '거래완료' ")
			.append(" order by c.write_date desc ");
			
			pstmt=con.prepareStatement(doneForum.toString());
			
			// 세션 구현 후 주석 해제
			//pstmt.setString(1,id);
			
			pstmt.setString(1, "test");
			
			rs=pstmt.executeQuery();
			MyPostBoardVO mpbVO =null;
			
			while(rs.next()) {
				
				mpbVO = new MyPostBoardVO();
				mpbVO.setCfNum(rs.getString("cf_num"));
				mpbVO.setcID(rs.getString("c_id"));
				mpbVO.setBuyerID(rs.getString("buyer_id"));
				mpbVO.setCfTopic(rs.getString("cf_topic"));
				mpbVO.setWriteDate(rs.getString("write_date"));
				mpbVO.setMainImg(rs.getString("main_img"));
				mpbVO.setCfStatus(rs.getString("cf_status"));
				mpbVO.setNickname(rs.getString("nickname"));
				
				mpbList.add(mpbVO);
				
			}//end while
			
		}finally {
		dc.close(rs, pstmt, con);
		}
	
		return mpbList;
	}//selectDoneForum
	
	public List<MyPostBoardVO> selectMyTransaction(String id) throws SQLException, NamingException{
		List<MyPostBoardVO> mpbList = new ArrayList<MyPostBoardVO>();
		
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			
			StringBuilder selectTrans = new StringBuilder();
			
			selectTrans
			.append(" select cf_num, cf_topic, main_img, TO_CHAR(WRITE_DATE, 'YYYY-MM-DD') write_date ")
			.append(" from c_forum ")
			.append(" where c_id=? and cf_status='거래중'  ");
			
			pstmt=con.prepareStatement(selectTrans.toString());
			
			MyPostBoardVO mpbVO = 	null;
			
			pstmt.setString(1,id);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				mpbVO = new MyPostBoardVO();
				mpbVO.setCfNum(rs.getString("cf_num"));
				mpbVO.setCfTopic(rs.getString("cf_topic"));
				mpbVO.setMainImg(rs.getString("main_img"));
				mpbVO.setWriteDate(rs.getString("write_date"));
				
				mpbList.add(mpbVO);
				
			}//end while
			
		}finally {
			dc.close(rs, pstmt, con);
			
		}//end finally
		
		return mpbList;
	}//selectMyTransaction
	
	public List<MyPostBoardVO> updateMyTransaction(String cfNum) throws SQLException, NamingException{
		List<MyPostBoardVO> mpbList = new ArrayList<MyPostBoardVO>();
		MyPostBoardVO mpbVO = new MyPostBoardVO();
		
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		
		DbConnection dc= DbConnection.getInstance();
		try {
			con=dc.getConn();
			
			StringBuilder updateTrans = new StringBuilder();
			
			updateTrans
			.append(" 	update c_forum			   ")
			.append("  set cf_status ='거래완료' ")
			.append("  where cf_num = ? ");
			
			pstmt=con.prepareStatement(updateTrans.toString());
			
			pstmt.setString(1,cfNum);
			
			rs=pstmt.executeQuery();
				
				mpbList.add(mpbVO);
				
			
		}finally {
			dc.close(rs, pstmt, con);
			
		}//end finally
		return mpbList;
	}//updateMyTransaction
}
