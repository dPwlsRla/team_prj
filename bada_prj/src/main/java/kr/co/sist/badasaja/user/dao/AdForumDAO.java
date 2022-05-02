package kr.co.sist.badasaja.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.dbConnection.DbConnection;
import kr.co.sist.badasaja.vo.AdForumVO;
import kr.co.sist.badasaja.vo.AdImgVO;

/**
 * @author user
 *
 */
public class AdForumDAO {
	
	/**
	 * 광고 게시글 정보 불러오기 : 제목, 게시일, 내용
	 * @param adVO
	 * @return
	 * @throws SQLException 
	 * @throws NamingException 
	 */
	public List<AdForumVO> selectAdForum(String afNum) throws SQLException, NamingException{
		List<AdForumVO> adList = new ArrayList<AdForumVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try{
			con = dc.getConn();
			
			
			StringBuilder adQuery = new StringBuilder();
			adQuery 
			.append("	select af_num, a_id, af_topic, af_main, to_char(posted_date, 'yyyy-mm-dd') posted_date, p_code ")
			.append("	from ad_forum 	")
			.append("	where af_num = ?	");
			pstmt=con.prepareStatement(adQuery.toString());
			
			pstmt.setString(1, afNum);
			rs = pstmt.executeQuery();
			//System.out.println(adfVO.getAfNum());
			while(rs.next()) {
				
				AdForumVO adfVO = new AdForumVO();
				adfVO.setaID(rs.getString("a_id"));
				adfVO.setAfTopic(rs.getString("af_topic"));
				adfVO.setAfMain(rs.getString("af_main"));
				adfVO.setPostedDate(rs.getString("posted_date"));
				adList.add(adfVO);
			}//end while
			
		}finally {
			dc.close(rs, pstmt, con);
		}//end finally
		
		return adList;
	}//selectAdForum
	
	/**
	 * 광고주 닉네임 불러오기
	 * @return
	 * @throws NamingException 
	 * @throws SQLException 
	 */
	public List<AdForumVO> selectAdNickname(String afNum) throws SQLException, NamingException{
		List<AdForumVO> adList = new ArrayList<AdForumVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try{
			con = dc.getConn();
			
			
			StringBuilder nickQuery = new StringBuilder();
			nickQuery 
			.append(" select adv.a_name, adf.af_num	 ")
			.append(" from advertiser adv, ad_forum adf	 	")
			.append(" where adv.a_id=adf.a_id and af_num = ?	");
			pstmt=con.prepareStatement(nickQuery.toString());
		
			pstmt.setString(1, afNum);
			System.out.println(">>>afNum : "+afNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AdForumVO adfVO = new AdForumVO();
				adfVO.setaName(rs.getString("a_name"));
				adfVO.setAfNum(rs.getString("af_num"));
				adList.add(adfVO);
			}//end while
			
		}finally {
			dc.close(rs, pstmt, con);
		}//end finally
		
		return adList;
	}//selectAdNickname
	
	public List<AdImgVO> selectImg(String afNum) throws SQLException, NamingException{
		List<AdImgVO> adimgList = new ArrayList<AdImgVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try{
			con = dc.getConn();
			
			
			StringBuilder imgQuery = new StringBuilder();
			imgQuery 
			.append(" select af_num, img from ad_img	 ")
			.append("  where af_num= ? ");
			
			pstmt=con.prepareStatement(imgQuery.toString());
			
			pstmt.setString(1, afNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AdImgVO adiVO = new AdImgVO();
				adiVO.setImg(rs.getString("img"));
				adiVO.setAfNum(rs.getString("af_num"));
				adimgList.add(adiVO);
			}//end while
			
		}finally {
			dc.close(rs, pstmt, con);
		}//end finally
		
		return adimgList;
	}//selectImg
}//class
