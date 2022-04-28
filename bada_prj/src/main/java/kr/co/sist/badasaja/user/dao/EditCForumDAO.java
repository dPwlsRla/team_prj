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

public class EditCForumDAO {
	
public boolean editForum(CForumVO cForumVO, HashTagVO[] htVOarr, String cfNum) throws SQLException, NamingException{

	boolean flag= false;
	CForumVO cVO = new CForumVO();
	Connection con =null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;
	DbConnection dc= DbConnection.getInstance();
	try {
	//1. 드라이버 로딩
	//2. 커넥션 얻기
		con=dc.getConn();

		StringBuilder query = new StringBuilder();  
		for(HashTagVO htVO : htVOarr) {
			StringBuilder query1 = new StringBuilder();  
				query1.append("delete from HASHTAG where cf_num = ?");
				pstmt=con.prepareStatement(query1.toString());
				pstmt.setString(1, cfNum);
				rs=pstmt.executeQuery();
			
		}
		
		query.append("update c_forum set p_code = ?, cf_topic = ?,"
				+ " cf_main= ?, write_date=sysdate where cf_num = ?");
		pstmt=con.prepareStatement(query.toString());
		 
		pstmt.setString(1, cForumVO.getpCode());
		pstmt.setString(2, cForumVO.getCfTopic());
		pstmt.setString(3, cForumVO.getCfMain());
		pstmt.setString(4, cfNum);
		
		rs=pstmt.executeQuery();
		
		
		for(HashTagVO htVO : htVOarr) {
			StringBuilder query1 = new StringBuilder();  
			if (htVO.getHash() == null || htVO.getHash().length() == 1) { // when #
				continue;
			}
			query1.append("insert into hashtag(cf_num,hash)"
					+ " values(?, ? )");
			pstmt=con.prepareStatement(query1.toString());
			
			pstmt.setString(1, cfNum);
			pstmt.setString(2, htVO.getHash());
			
			
			rs=pstmt.executeQuery();
		}
		
		
	}finally {
	//6. 연결 끊기
	dc.close(rs, pstmt, con);
	}
	return flag;
}

	}

