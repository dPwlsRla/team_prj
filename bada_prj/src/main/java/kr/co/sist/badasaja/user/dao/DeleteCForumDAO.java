package kr.co.sist.badasaja.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import kr.co.sist.badasaja.dbConnection.DbConnection;
import kr.co.sist.badasaja.vo.CForumVO;
import kr.co.sist.badasaja.vo.CImgVO;
import kr.co.sist.badasaja.vo.HashTagVO;

public class DeleteCForumDAO {

	public void editForum(String cfNum) throws SQLException, NamingException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dc = DbConnection.getInstance();

		con = dc.getConn();

		StringBuilder query = new StringBuilder();

		query.append("update c_forum set cf_status = '게시삭제' where cf_num= ? ");
		pstmt = con.prepareStatement(query.toString());

		pstmt.setString(1, cfNum);

		rs = pstmt.executeQuery();

		dc.close(rs, pstmt, con);
	}
}
