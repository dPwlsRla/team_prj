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
import kr.co.sist.badasaja.vo.HashTagVO;
import kr.co.sist.badasaja.vo.CImgVO;
import kr.co.sist.badasaja.vo.CuVO;


/**
 * 물물교환 게시판 조회
 */
public class CForumDAO {
	public CForumVO getCForumVO(String cfNum) throws SQLException, NamingException{
		CForumVO cVO = new CForumVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try{
			con = dc.getConn();
			StringBuilder entireQuery = new StringBuilder();
			entireQuery.append("SELECT C_ID, P_CODE, CF_TOPIC, CF_MAIN, WRITE_DATE, CF_STATUS FROM C_FORUM WHERE CF_NUM = ?");
			pstmt=con.prepareStatement(entireQuery.toString());	
			pstmt.setString(1,cfNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cVO.setCfNum(cfNum);
				cVO.setcID(rs.getString("C_ID"));
				cVO.setpCode(rs.getString("P_CODE"));
				cVO.setCfTopic(rs.getString("CF_TOPIC"));
				cVO.setCfMain(rs.getString("CF_MAIN"));
				cVO.setWriteDate(rs.getString("WRITE_DATE"));
				cVO.setCfStatus(rs.getString("CF_STATUS"));
			}
			
		}finally {
			dc.close(rs, pstmt, con);
		}//end finally
		return cVO;	
	}//getCForumVO
	
	public List<CImgVO> getCImgVOList(String cfNum) throws SQLException, NamingException{
		List<CImgVO> imageList = new ArrayList<CImgVO>(); // 이미지 3개까지 담을 리스트
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try{
			con = dc.getConn();
			StringBuilder entireQuery = new StringBuilder();
			entireQuery.append("SELECT IMG FROM C_IMG WHERE CF_NUM = ?");
			pstmt=con.prepareStatement(entireQuery.toString());	
			pstmt.setString(1,cfNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CImgVO cIVO = new CImgVO();
				cIVO.setCfNum(cfNum);
				cIVO.setImg(rs.getString("IMG"));
				imageList.add(cIVO);
			}
			
		}finally {
			dc.close(rs, pstmt, con);
		}
		return imageList;	
	} //getCImgVOList
	
	public List<HashTagVO> getHashTagVOList(String cfNum) throws SQLException, NamingException{
		List<HashTagVO> hashList = new ArrayList<HashTagVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc= DbConnection.getInstance();
		
		try{
			con = dc.getConn();
			StringBuilder entireQuery = new StringBuilder();
			entireQuery.append("SELECT HASH FROM HASHTAG WHERE CF_NUM = ?");
			pstmt=con.prepareStatement(entireQuery.toString());	
			pstmt.setString(1,cfNum);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				HashTagVO hVO = new HashTagVO();
				hVO.setCfNum(cfNum);
				hVO.setHash(rs.getString("HASH"));
				hashList.add(hVO);
			}
			
		}finally {
			dc.close(rs, pstmt, con);
		}
		return hashList;	
	} //getCImgVOList
	
	public CuVO getCuVO(String cfNum) throws SQLException, NamingException{
		CuVO cuVO = new CuVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dc= DbConnection.getInstance();
		try{
			con = dc.getConn();
			StringBuilder entireQuery = new StringBuilder();
			entireQuery.append("select c.nickname, s.one, s.two, s.three, s.four, s.five "
					+ "from customer c, c_score s "
					+ "where c.c_id = (select c_id from c_forum where cf_num = ?) "
					+ "and s.c_id = (select c_id from c_forum where cf_num = ?)");
			pstmt= con.prepareStatement(entireQuery.toString());
			pstmt.setString(1,cfNum);
			pstmt.setString(2,cfNum);
			rs = pstmt.executeQuery();
			
			
			float score = 0;

			if(rs.next()) {
				int total = rs.getInt("one") + rs.getInt("two") + rs.getInt("three") + rs.getInt("four") + rs.getInt("five");
				if (total==0) {
					cuVO.setScore("0");
				}
				else {
					score += rs.getInt("one");
					score += 2 * rs.getInt("two");
					score += 3 * rs.getInt("three");
					score += 4 * rs.getInt("four");
					score += 5 * rs.getInt("five");
					score = score / total; 
					cuVO.setScore(String.format("%.1f", score));
				}
				cuVO.setNickName(rs.getString("nickname"));

			}
			
			
		}finally {
			dc.close(rs, pstmt, con);
		}
		return cuVO;	
	} 

	
}//class
