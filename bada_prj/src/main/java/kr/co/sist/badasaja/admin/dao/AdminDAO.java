package kr.co.sist.badasaja.admin.dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.vo.AdImgVO;
import kr.co.sist.badasaja.vo.CuVO;
import kr.co.sist.badasaja.vo.OperatorVO;

public class AdminDAO {
	
	private static AdminDAO aDAO;
	
	private AdminDAO() {
		
	}
	
	public static AdminDAO getInstance() {
		if(aDAO == null) {
			aDAO = new AdminDAO();
		}
		
		return aDAO;
	}
	
	public boolean  selectAdminLogin(OperatorVO oVO) throws SQLException, NamingException {
		boolean flag = false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try {
			con = dc.getConn();
			
			StringBuilder query = new StringBuilder();
			
			query.append("  select o_id,  o_pass  from  operator where o_id = ? and o_pass = ?");
			
			pstmt = con.prepareStatement(query.toString());
			
			pstmt.setString(1, oVO.getoID());
			pstmt.setString(2, oVO.getoPass());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				flag = true;
			}
			
		} finally {
			dc.close(rs, pstmt, con);
		}
		
		return flag;
	} // selectAdminLogin
	
	public List<CuVO> selectAllCustomer() throws SQLException, NamingException {
		List<CuVO> list = new ArrayList<CuVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();
	try {
			
			con = dc.getConn();
			
			pstmt = con.prepareStatement("select c_id, nickname, c_status, sign_date, access_date from customer");
			
			rs = pstmt.executeQuery();
			
			CuVO cuVO = null;
			while( rs.next() ) {
				cuVO = new CuVO();
				cuVO.setcID(rs.getString("c_id"));
				cuVO.setNickName(rs.getString("nickname"));
			}
			
		} finally {
			dc.close(rs, pstmt, con);
		}
		
		return list;
	}
	
	public boolean checkAID(String aID) throws SQLException, NamingException {
		
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
			
			con = dc.getConn();
			
			pstmt = con.prepareStatement("select a_id from advertiser where a_id = ?");
			
			pstmt.setString(1, aID);

			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				flag = true;
			}
			
		} finally {
			dc.close(rs, pstmt, con);
		}
		
		return flag;
	}
}
