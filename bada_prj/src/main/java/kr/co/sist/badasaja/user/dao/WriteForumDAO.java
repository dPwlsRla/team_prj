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

public class WriteForumDAO {
	
public boolean insertForum(CForumVO cForumVO, CImgVO[] ciVOarr, HashTagVO[] htVOarr) throws SQLException, NamingException{

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
				+ " values('cf'||PRO1.C_FORUM_SEQ.NEXTVAL, ? , ? , ? , ? , ? , ?)");
		pstmt=con.prepareStatement(query.toString());
		 
		pstmt.setString(1, cForumVO.getcID());
		pstmt.setString(2, cForumVO.getpCode());
		pstmt.setString(3, cForumVO.getCfTopic());
		pstmt.setString(4, cForumVO.getCfMain());
		pstmt.setString(5, cForumVO.getCfStatus());
		pstmt.setString(6, cForumVO.getMainImg());
		
		rs=pstmt.executeQuery();
		
		for(CImgVO ciVO : ciVOarr) {
			StringBuilder query1 = new StringBuilder();  
			if (ciVO.getImg()==null) {
				continue; // 이미지가 안들어왔을 때 디비에 안들어가게
			}
			System.out.println(ciVO.getImg());
	
			query1.append("insert into C_IMG(cf_num,img)"
					+ " values('cf'||PRO1.C_FORUM_SEQ.CURRVAL, ? )");
			pstmt=con.prepareStatement(query1.toString());
			pstmt.setString(1, ciVO.getImg());
			rs=pstmt.executeQuery();
		}
		
		for(HashTagVO htVO : htVOarr) {
			StringBuilder query1 = new StringBuilder();  
			if (htVO.getHash() == null || htVO.getHash().length() == 1) { // when #
				continue;
			}
			query1.append("insert into hashtag(cf_num,hash)"
					+ " values('cf'||PRO1.C_FORUM_SEQ.CURRVAL, ? )");
			pstmt=con.prepareStatement(query1.toString());
			
			pstmt.setString(1, htVO.getHash());
			
			
			rs=pstmt.executeQuery();
		}
		
		
	}finally {
	//6. 연결 끊기
	dc.close(rs, pstmt, con);
	}
	return flag;
}

	}

