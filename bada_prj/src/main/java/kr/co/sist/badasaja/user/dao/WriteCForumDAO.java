package kr.co.sist.badasaja.user.dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import kr.co.sist.badasaja.admin.dao.AdminAdDAO;
import kr.co.sist.badasaja.dbConnection.DbConnection;
import kr.co.sist.badasaja.vo.CForumVO;
import kr.co.sist.badasaja.vo.CImgVO;
import kr.co.sist.badasaja.vo.HashTagVO;

public class WriteCForumDAO {
	
	private static WriteCForumDAO wcDAO;
	
	public static WriteCForumDAO getInstance() {

		if (wcDAO == null) {
			wcDAO = new WriteCForumDAO();
		} // end if

		return wcDAO;

	}
	
public boolean insertForum(CForumVO cForumVO, HashTagVO[] htArr) throws SQLException, NamingException{

	boolean flag= false;
	Connection con =null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;
	DbConnection dc= DbConnection.getInstance();
	try {
	//1. 드라이버 로딩
	//2. 커넥션 얻기
		con=dc.getConn();

		StringBuilder query = new StringBuilder();  
		
		query.append("insert into C_Forum(cf_num,c_id,p_code,cf_topic,cf_main,cf_status,main_img)"
				+ " values('cf'||PRO2.C_FORUM_SEQ.NEXTVAL, ? , ? , ? , ? , ? , ?)");
		pstmt=con.prepareStatement(query.toString());
		 
		pstmt.setString(1, cForumVO.getcID());
		pstmt.setString(2, cForumVO.getpCode());
		pstmt.setString(3, cForumVO.getCfTopic());
		pstmt.setString(4, cForumVO.getCfMain());
		pstmt.setString(5, cForumVO.getCfStatus());
		pstmt.setString(6, cForumVO.getMainImg());
		
		rs=pstmt.executeQuery();
		
		
		for(HashTagVO htVO : htArr) {
			StringBuilder query2 = new StringBuilder();  
			if (htVO.getHash() == null || htVO.getHash().length() == 1) { // when #
				continue;
			}
			query2.append("insert into hashtag(cf_num,hash)"
					+ " values('cf'||PRO2.C_FORUM_SEQ.CURRVAL, ? )");
			pstmt=con.prepareStatement(query2.toString());
			
			pstmt.setString(1, htVO.getHash());
			
			
			rs=pstmt.executeQuery();
		}
		
		
	}finally {
	//6. 연결 끊기
	dc.close(rs, pstmt, con);
	}
	return flag;
}

public void inserFImg(String imgs) throws SQLException, NamingException {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	DbConnection dc = DbConnection.getInstance();
	
	try {
		
		con = dc.getConn();
		
		StringBuilder query = new StringBuilder();
		
		query.append("insert into C_IMG(cf_num,img)"
				+ " values('cf'||PRO2.C_FORUM_SEQ.CURRVAL, ? )");
		
		pstmt = con.prepareStatement(query.toString());
		
		pstmt.setString(1, imgs);
		
		pstmt.executeUpdate();
		
	} finally {
		dc.close(null, pstmt, con);
	}
}
}
	


