package kr.co.sist.badasaja.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.vo.NoticeVO;

public class KyhNoticeDAO {

	private static KyhNoticeDAO knDAO;

	private KyhNoticeDAO() {

	}

	public static KyhNoticeDAO getInstance() {
		if (knDAO == null) {
			knDAO = new KyhNoticeDAO();
		} // end if

		return knDAO;
	}

	/**
	 * 관리자 한줄 공지 전체 조회 method
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public List<NoticeVO> selectAllNotice() throws SQLException, NamingException {
		List<NoticeVO> list = new ArrayList<NoticeVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();

			pstmt = con.prepareStatement(
					" select n_num, o_id, o_main, to_char(posted_date,'yyyy-mm-dd') posted_date from notice order by n_num ");

			rs = pstmt.executeQuery();

			NoticeVO nVO = null;
			while (rs.next()) {
				nVO = new NoticeVO();
				nVO.setnNum(rs.getString("n_num"));
				nVO.setoID(rs.getString("o_id"));
				nVO.setoMain(rs.getString("o_main"));
				nVO.setPostedDate(rs.getString("posted_date"));

				list.add(nVO);
			}

		} finally {
			dc.close(rs, pstmt, con);
		}
		return list;
	}

	/**
	 * 관리자 한줄 공지 등록 method
	 * @param oID 관리자 ID
	 * @param iNotice 한줄 공지
	 * @throws SQLException
	 * @throws NamingException
	 */
	public void insertNotice(String oID, String iNotice) throws SQLException, NamingException {
		Connection con = null;
		PreparedStatement pstmt = null;
		DbConnection dc = DbConnection.getInstance();
		try {
			con = dc.getConn();

			pstmt = con.prepareStatement("insert into notice(n_num, o_id, o_main) values('n'||NOTICE_SEQ.NEXTVAL, ?, ?)");
			
			pstmt.setString(1, oID);
			pstmt.setString(2, iNotice);
			
			pstmt.executeUpdate();

		} finally {
			dc.close(null, pstmt, con);

		}
	}

}
