package kr.co.sist.badasaja.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.dbConnection.DbConnection;
import kr.co.sist.badasaja.vo.AdImgVO;
import kr.co.sist.badasaja.vo.ComVO;
import kr.co.sist.badasaja.vo.CuVO;
import kr.co.sist.badasaja.vo.OperatorVO;
import kr.co.sist.badasaja.vo.ReplyVO;

public class CommentDAO {


	public ComVO getComment(String cfNum, String cId) throws SQLException, NamingException {
		ComVO comVO = new ComVO();
		CuVO cuVO = new CuVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			query.append("select * from comview where cf_num = ?");

			pstmt = con.prepareStatement(query.toString());

			pstmt.setString(1, cfNum);

			rs = pstmt.executeQuery();
			if(rs.next()) {
			comVO.setComNum(rs.getString("comNum"));
			cuVO.setNickName(rs.getString("nickname"));
			comVO.setcID(cId);
			comVO.setComMain(rs.getString("comMain"));
			}

			
		} finally {
			dc.close(rs, pstmt, con);
		}
		
		return comVO;

	} // selectComment

	
	
	public ReplyVO getReply(String cNum) throws SQLException, NamingException {

		ReplyVO rVO = new ReplyVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			query.append("select * from replyview where p_com = 'c1'");

			pstmt = con.prepareStatement(query.toString());

			pstmt.setString(1, cNum);

			rs = pstmt.executeQuery();


		} finally {
			dc.close(rs, pstmt, con);
		}
		return rVO;

	} // selectReply

	
	
	public boolean insertComment(String cfNum, String cId, ComVO comVO) throws SQLException, NamingException {
		boolean flag = false;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			query.append("insert into com(com_num, cf_num, c_id, com_main, com_date)\r\n"
					+ "values('c'||pro2.com_seq.nextval, ?, ?, ?, sysdate)");

			pstmt = con.prepareStatement(query.toString());

			pstmt.setString(1, cfNum);
			pstmt.setString(2, cId);
			pstmt.setString(3, comVO.getComMain());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				flag = true;
			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return flag;
	} // insertComment
	
	
	
	public boolean insertReply(String cId, String comNum, ReplyVO rVO) throws SQLException, NamingException {
		boolean flag = false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
			con = dc.getConn();
			
			StringBuilder query = new StringBuilder();
			
			query.append("insert into reply(reply_num, p_com, c_id, reply_main, REPLY_DATE)\r\n"
					+ "values(pro2.reply_seq.nextval, ?, ?, ?, sysdate)");
			
			pstmt = con.prepareStatement(query.toString());
			
			pstmt.setString(1, comNum);
			pstmt.setString(2, cId);
			pstmt.setString(3, rVO.getReplyMain());
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				flag = true;
			}
			
		} finally {
			dc.close(rs, pstmt, con);
		}
		
		return flag;
	} // insertReply

}
