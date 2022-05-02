package kr.co.sist.badasaja.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.vo.ProhibitVO;

public class ProhibitDAO {

	private static ProhibitDAO pDAO;

	private ProhibitDAO() {

	}

	public static ProhibitDAO getInstance() {
		if (pDAO == null) {
			pDAO = new ProhibitDAO();
		}
		return pDAO;
	}

	/**
	 * 전체 금지 품목 조회 method
	 * @param keyword
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public List<ProhibitVO> selectProhibit(String keyword) throws SQLException, NamingException {
		List<ProhibitVO> list = new ArrayList<ProhibitVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();

			pstmt = con.prepareStatement(" select * from prohibit order by k_num ");
			if (keyword != null && !keyword.equals("")) {
				pstmt = con.prepareStatement(" select * from prohibit where keyword like ? order by k_num  ");

				pstmt.setString(1, "%" +keyword +"%");

			}

			rs = pstmt.executeQuery();

			ProhibitVO pVO = null;
			while (rs.next()) {
				pVO = new ProhibitVO();
				pVO.setkNum(rs.getInt("k_num"));
				pVO.setKeyWord(rs.getString("keyword"));

				list.add(pVO);
			}

		} finally {
			dc.close(rs, pstmt, con);
		}
		return list;
	}
	
	/**
	 * 금지 품목 조회 method
	 * @param iKey 금지 품목
	 * @throws SQLException
	 * @throws NamingException
	 */
	public void insertProhibit(String iKey) throws SQLException, NamingException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();
		try {
			con = dc.getConn();
			
			pstmt = con.prepareStatement(" insert into prohibit( k_num, keyword ) values( ROHIBIT_SEQ.NEXTVAL, ? )");
			
			pstmt.setString(1, iKey);
			
			pstmt.executeUpdate();
			
		} finally {
			dc.close(rs, pstmt, con);
		}
		
	}

}
