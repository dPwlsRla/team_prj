package kr.co.sist.badasaja.user.dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.dbConnection.DbConnection;
import kr.co.sist.badasaja.vo.CForumVO;
import kr.co.sist.badasaja.vo.CImgVO;

public class EditCfourmDAO {

	
	/**
	 * 위에꺼 select
	 * @param cfVO
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public List<CForumVO> selectData1(String cNum) throws SQLException, NamingException{
		List<CForumVO> list = new ArrayList<CForumVO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		
		DbConnection dc= DbConnection.getInstance();
		try {
		//1. 드라이버 로딩
		//2. 커넥션 얻기
			con=dc.getConn();

			StringBuilder data1 = new StringBuilder();  

			data1.append("select cf_num,cf_topic,cf_main from C_FORUM where cf_num= ? ");
			pstmt=con.prepareStatement(data1.toString());
			
			pstmt.setString(1,cNum);
		
			rs=pstmt.executeQuery();
			
			CForumVO cf = null;
			
			while(rs.next()) {
				cf= new CForumVO();
				cf.setCfNum(rs.getString("cf_num"));
				cf.setCfTopic(rs.getString("cf_topic"));
				cf.setCfMain(rs.getString("cf_main"));
				
				list.add(cf);
			}
		}finally {
		//6. 연결 끊기
		dc.close(rs, pstmt, con);
		}
		return list;
	}//selectData1
	
	public List<CImgVO> selectData2(String cNum) throws SQLException, NamingException{
		List<CImgVO> list = new ArrayList<CImgVO>();
		Connection con =null;
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		
		DbConnection dc= DbConnection.getInstance();
		try {
		//1. 드라이버 로딩
		//2. 커넥션 얻기
			con=dc.getConn();

			StringBuilder data1 = new StringBuilder();  
			
			data1.append("select h.HASH, c.CF_NUM ,c.img from HASHTAG h , C_IMG c ")
			.append(" where (h.cf_num= c.cf_num) and c.cf_num=?");
			
			pstmt=con.prepareStatement(data1.toString());
			 
			pstmt.setString(1, cNum);
			
			rs=pstmt.executeQuery(); 
			CImgVO cvo=null;
			while(rs.next()) {
				cvo=new CImgVO();
				cvo.setHash(rs.getString("hash"));
				cvo.setCfNum(rs.getString("cf_num"));
				cvo.setImg(rs.getString("img"));
				list.add(cvo);
			}
		}finally {
		//6. 연결 끊기
		dc.close(rs, pstmt, con);
		}
		return list;
	}//selectData2
}
