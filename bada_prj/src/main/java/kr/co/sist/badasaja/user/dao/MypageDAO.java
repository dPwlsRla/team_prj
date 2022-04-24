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
import kr.co.sist.util.cipher.DataDecrypt;
import kr.co.sist.util.cipher.DataEncrypt;


public class MypageDAO {

	/**
	 * 패스워드 찾는 다오
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
}
