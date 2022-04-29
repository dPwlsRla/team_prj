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
import kr.co.sist.badasaja.vo.CuVO;
import kr.co.sist.badasaja.vo.EntireForumVO;
import kr.co.sist.badasaja.vo.HashTagVO;
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
				 .append(" from c_forum c ")
				 .append(" left outer join transaction t ")
				 .append(" on c.cf_num=t.cf_num ")
				 .append(" where c.c_id = ? ")
				 .append(" order by c.write_date desc ");
				
				
				pstmt=con.prepareStatement(myForum.toString());
				
				//세션 구현 후 주석해제
				//pstmt.setString(1,id);
				
				pstmt.setString(1, "test");
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
			
			//세션 구현 후 주석 해제
			pstmt.setString(1,id);
			
			//pstmt.setString(1, "test");
			
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
	
	public void updateCStatus(String id) throws SQLException, NamingException, NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException{
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		DbConnection dc= DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			StringBuilder updateQuery = new StringBuilder(); 
			
			
			updateQuery
			.append("	update CUSTOMER ")
			.append(" set C_STATUS= 'se' ")
			.append(" where c_id=?");
			
			pstmt=con.prepareStatement(updateQuery.toString());
			pstmt.setString(1, id);
		
			pstmt.executeUpdate();
		//5. 쿼리수행 후 결과 얻기
		}finally {
		//6. 연결끊기
			dc.close(null, pstmt, con);
		}
		
	}
	

	public List<EntireForumVO> selectWishList(String cId ,int count) throws SQLException, NamingException{
		
		List<EntireForumVO> eVOList = new ArrayList<EntireForumVO>();
		int rowNum1=1;
		int rowNum2=9;
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		if(count!=1) {
			
			rowNum2=rowNum2*count;
			rowNum1=rowNum2-8;
		}

		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try{
			con = dc.getConn();
			
			
			StringBuilder entireQuery = new StringBuilder();
//			entireQuery.append(" SELECT rownum , c.CF_NUM, c.CF_TOPIC, c.MAIN_IMG,c.c_id ")
//			.append( " FROM C_FORUM c, WISH_LIST w")
//			.append(" where (c.CF_NUM = w.CF_NUM) and w.c_id=? and rownum between ? and ?");
			entireQuery.append("  select * from (SELECT rownum as ro ,c.CF_NUM, c.CF_TOPIC, c.MAIN_IMG,c.c_id ")
			.append( " FROM  WISH_LIST w ,C_FORUM c ")
			.append(" where (c.CF_NUM = w.CF_NUM ) and w.c_id= ? ) where ro between ? and ?");
			//.append(" where (c.CF_NUM = w.CF_NUM) and c.c_id=? ");
			// 1, 2, 3, 4, ... 
			pstmt=con.prepareStatement(entireQuery.toString());
			pstmt.setString(1, cId);
			pstmt.setInt(2, rowNum1);
			pstmt.setInt(3, rowNum2);
			rs = pstmt.executeQuery();

			StringBuilder hashQuery = new StringBuilder();
			hashQuery.append(" SELECT w.CF_NUM, H.HASH ")
			.append(" FROM HASHTAG H,WISH_LIST w ")
			.append("  WHERE (w.CF_NUM = h.CF_NUM) and w.CF_NUM = ? ");
				

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
				
				StringBuilder hashQuery2 = new StringBuilder();
				hashQuery2.append("SELECT CF_NUM FROM WISH_LIST WHERE CF_NUM = ? AND C_ID = ?");
				pstmt3 = con.prepareStatement(hashQuery2.toString());
				pstmt3.setString(1, efVO.getCfNum());
				pstmt3.setString(2, cId);
				rs3 = pstmt3.executeQuery();
				if(rs3.next()) {
					efVO.setIsWish(true);
				}
				else {
					efVO.setIsWish(false);
				}
				
				eVOList.add(efVO);
			}
			
		}finally {
			dc.close(rs, pstmt, con);
			dc.close(rs2, pstmt2, con);
			dc.close(rs3, pstmt3, con);

		}//end finally

		return eVOList ;
		
	}//selectEntireForum
	

	public int selectRowNum(String cId) throws SQLException, NamingException, NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException{
		int rownum=0;
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		
		DbConnection dc= DbConnection.getInstance();
		try {
		//1. 드라이버 로딩
		//2. 커넥션 얻기
			con=dc.getConn();

			StringBuilder entireQuery = new StringBuilder();
			entireQuery.append(" SELECT rownum , w.CF_NUM, c.CF_TOPIC, c.MAIN_IMG,c.c_id ")
			.append( " FROM C_FORUM c, WISH_LIST w")
			.append(" where (c.CF_NUM = w.CF_NUM) and c.c_id=?");
			//.append(" where (c.CF_NUM = w.CF_NUM) and c.c_id=? ");
			// 1, 2, 3, 4, ... 
			pstmt=con.prepareStatement(entireQuery.toString());
			pstmt.setString(1, cId);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rownum=rs.getInt("rownum");
				}
		}finally {
		//6. 연결 끊기
		dc.close(rs, pstmt, con);
		}
		return rownum;
	}//row반환
	

	
}
