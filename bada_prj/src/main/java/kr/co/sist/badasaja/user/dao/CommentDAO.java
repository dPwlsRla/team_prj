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
import kr.co.sist.badasaja.vo.ComViewVO;
import kr.co.sist.badasaja.vo.CuVO;
import kr.co.sist.badasaja.vo.OperatorVO;
import kr.co.sist.badasaja.vo.ReplyVO;
import kr.co.sist.badasaja.vo.ReplyViewVO;

public class CommentDAO {

	public List<ComViewVO> getComments(String cfNum) throws SQLException, NamingException {
		List<ComViewVO> list = new ArrayList<ComViewVO>();
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


			while (rs.next()) {
				ResultSet rs1 = null;
				
				ComViewVO cvVO = new ComViewVO();
				List<ReplyViewVO> replyList = new ArrayList<ReplyViewVO>();
				
				cvVO.setCfNum(cfNum);
				cvVO.setcId(rs.getString("c_id"));
				cvVO.setComDate(rs.getString("com_date"));
				cvVO.setComMain(rs.getString("com_main"));
				cvVO.setComNum(rs.getString("com_num"));
				cvVO.setNickname(rs.getString("nickname"));
				cvVO.setProfile(rs.getString("profile"));
				
				PreparedStatement pstmt1 = null;
				
				StringBuilder query1 = new StringBuilder();
				
				
				query1.append("select * from replyview where p_com = ?"); 
				
				pstmt1 = con.prepareStatement(query1.toString());
				
				String p_com = rs.getString("com_num");
				
				pstmt1.setString(1, p_com);
				
				rs1 = pstmt1.executeQuery();
				
				while (rs1.next()) {
					
					ReplyViewVO rvVO = new ReplyViewVO();
					
					rvVO.setpCom(p_com);
					rvVO.setCfNum(cfNum);
					rvVO.setcId(rs1.getString("c_id"));
					rvVO.setNickname(rs1.getString("nickname"));
					rvVO.setProfile(rs1.getString("profile"));
					rvVO.setReplyDate(rs1.getString("reply_date"));
					rvVO.setReplyMain(rs1.getString("reply_main"));
					rvVO.setReplyNum(rs1.getInt("reply_num"));

					replyList.add(rvVO);
				}
				
				cvVO.setReplyList(replyList);
				list.add(cvVO);
				
			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return list;

	} // selectComment

	public boolean insertComment(ComVO comVO) throws SQLException, NamingException {
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

			pstmt.setString(1, comVO.getCfNum());
			pstmt.setString(2, comVO.getcID());
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

	public boolean insertReply(ReplyVO rVO) throws SQLException, NamingException {
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

			pstmt.setString(1, rVO.getpCom());
			pstmt.setString(2, rVO.getrID());
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
