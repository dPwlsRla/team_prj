package kr.co.sist.badasaja.user.dao;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import kr.co.sist.badasaja.dbConnection.DbConnection;
import kr.co.sist.badasaja.vo.CuVO;
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
			
			login.append("select c_pass from customer where c_pass= ?");
			pstmt=con.prepareStatement(login.toString());
			 
			DataEncrypt de = new DataEncrypt("abcefghijklmn1234");//키가 안맞아서 에러 났어요
			password = de.encryption(cuVO.getcPass());
			pstmt.setString(1, password);
			
			rs=pstmt.executeQuery(); 
			
			if(!rs.next()) {
				
				password="none";
				
			}
		}finally {
		//6. 연결 끊기
		dc.close(rs, pstmt, con);
		}
		return password;
	}
}
