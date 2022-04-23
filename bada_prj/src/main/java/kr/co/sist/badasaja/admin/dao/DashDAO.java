package kr.co.sist.badasaja.admin.dao;

import java.sql.Connection;  
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.sist.badasaja.admin.dao.DbConnection;
import kr.co.sist.badasaja.vo.NoticeVO;

public class DashDAO {

	/**
	 * DashDAO 기본 생성자
	 */
	public DashDAO() {
	}//DashDAO
	
	
	/**
	 * 가장 최근에 작성된 운영자 공지(notice 테이블의 O_MAIN컬럼 값)을<br/>
	 * 조회하여 String으로 반환하는 메서드
	 * @return String
	 * @throws SQLException
	 * @throws NamingException
	 */
	public String selectOperNotice() throws SQLException, NamingException {
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String notice=null;
		
		try {
			//1.드라이버연결
			//2.커넥션 얻기
			con=DbConnection.getInstance().getConn();
			//3.쿼리문 생성객체 얻기
			stmt=con.createStatement();	
			//4.쿼리문 이용하기
			StringBuilder selectNotice=new StringBuilder();
			selectNotice
			.append(" SELECT O_MAIN ")
			.append(" FROM (SELECT O_MAIN FROM NOTICE ORDER BY POSTED_DATE DESC) ")
			.append(" WHERE ROWNUM = 1 ");
			
			rs=stmt.executeQuery(selectNotice.toString());
			
			if(rs.next()) {//검색된 레코드가 존재
				//VO에 값을 할당
				NoticeVO n =new NoticeVO();
				//커서가 존재하는 레코드의 컬럼명 값을 가져와서  
				n.setoMain(rs.getString("O_MAIN"));
				notice=n.getoMain();
			}//end-if

		}finally {
			//5.연결끊기
			DbConnection.getInstance().close(rs, stmt, con);
		}//end-finally
		
		return notice;
		
	}//selectOperNotice
	
	
	/**
	 * 배너 테이블의 전체 레코드 수를 반환하는 메서드<br/>
	 * @return int
	 * @throws SQLException
	 * @throws NamingException
	 */
	public int selectBannerCnt() throws SQLException, NamingException {
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		int cnt = 0;
		
		try {
			//1.드라이버연결
			//2.커넥션 얻기
			con=DbConnection.getInstance().getConn();
			//3.쿼리문 생성객체 얻기
			stmt=con.createStatement();	
			//4.쿼리문 이용하기
			String bannerCnt="SELECT count(*) FROM banner";
			
			rs=stmt.executeQuery(bannerCnt);
			
			if(rs.next()) {
				cnt=rs.getInt("count(*)");
			}//end-if
			
		}finally {
			//5.연결끊기
			DbConnection.getInstance().close(rs, stmt, con);
		}//end-finally
		
		return cnt;
		
	}//selectOperNotice
	
	
	/**
	 * ad_forum 테이블의 전체 레코드 수를 반환하는 메서드<br/>
	 * @return int
	 * @throws SQLException
	 * @throws NamingException
	 */
	public int selectForumCnt() throws SQLException, NamingException {
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		int cnt = 0;
		
		try {
			//1.드라이버연결
			//2.커넥션 얻기
			con=DbConnection.getInstance().getConn();
			//3.쿼리문 생성객체 얻기
			stmt=con.createStatement();	
			//4.쿼리문 이용하기
			String forumCnt="SELECT count(*) FROM ad_forum";
			
			rs=stmt.executeQuery(forumCnt);
			
			if(rs.next()) {
				cnt=rs.getInt("count(*)");
			}//end-if
			
		}finally {
			//5.연결끊기
			DbConnection.getInstance().close(rs, stmt, con);
		}//end-finally
		
		return cnt;
		
	}//selectOperNotice
	
	
	/**
	 * 매개변수로 fomatData 형식을 받아
	 * 현재날과 현재달에 가입한 회원 수를 반환해주는 메서드
	 * @param fomatDate
	 * @return
	 * @throws SQLException 
	 * @throws NamingException 
	 */
	public int selectSignCustomer(String formatDate) throws SQLException, NamingException {
		Connection con = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		int cnt = 0;
		
		try{
		//1 드라이버 로딩
		//2 커넥션 얻기
			con=DbConnection.getInstance().getConn();
		//3 쿼리문 생성 객체 얻기
			StringBuilder selectSignCnt = new StringBuilder();
			selectSignCnt
			.append(" select count(*) ")
			.append(" from customer ")
			.append(" where to_char(sign_date,?) = to_char(sysdate,?)");
		
			
			pstmt = con.prepareStatement(selectSignCnt.toString());
			
		//4 바인드 변수 값 할당
			pstmt.setString(1, formatDate);
			pstmt.setString(2, formatDate);
			
		//5 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {//조회된 레코드 없음
				cnt=rs.getInt("count(*)");
			}//end if
			
		}finally{
		//6 연결끊기
			DbConnection.getInstance().close(rs, pstmt, con);
		}
		
		return cnt;
		
	}//selectSignCustomer
	
	
	/**
	 * 매개변수로 fomatData 형식을 받아
	 * 현재날과 현재달 현재년도에 광고수익을 반환해주는 메서드
	 * @param fomatDate
	 * @return
	 * @throws SQLException 
	 * @throws NamingException 
	 */
	public int revenue(String formatDate) throws SQLException, NamingException {
		Connection conForum = null;
		PreparedStatement pstmtForum= null;
		ResultSet rsForum = null;
		
		Connection conBanner = null;
		PreparedStatement pstmtBanner= null;
		ResultSet rsBanner = null;
		
		int forumCnt = 0;
		int bannerCnt = 0;
		int revenue = 0;
		
		try{
			// 드라이버 로딩
			// 커넥션 얻기
			conForum=DbConnection.getInstance().getConn();
			conBanner=DbConnection.getInstance().getConn();
			// 쿼리문 생성 객체 얻기
			StringBuilder selectAdFCnt = new StringBuilder();
			selectAdFCnt
			.append(" select count(*) ")
			.append(" from ad_forum ")
			.append(" where to_char(posted_date,?) = to_char(sysdate,?)");
			
			pstmtForum = conForum.prepareStatement(selectAdFCnt.toString());
			
			
			StringBuilder selectAdBCnt = new StringBuilder();
			selectAdBCnt
			.append(" select count(*) ")
			.append(" from banner ")
			.append(" where to_char(posted_date,?) = to_char(sysdate,?)");
			
			pstmtBanner = conBanner.prepareStatement(selectAdBCnt.toString());
			
			//4 바인드 변수 값 할당
			pstmtForum.setString(1, formatDate);
			pstmtForum.setString(2, formatDate);
			pstmtBanner.setString(1, formatDate);
			pstmtBanner.setString(2, formatDate);
			
			//5 쿼리문 수행 후 결과 얻기
			rsForum=pstmtForum.executeQuery();
			rsBanner=pstmtBanner.executeQuery();
			
			if(rsForum.next()) {//조회된 레코드 없음
				forumCnt=rsForum.getInt("count(*)");
			}//end if
			
			if(rsBanner.next()) {//조회된 레코드 없음
				bannerCnt=rsBanner.getInt("count(*)");
			}//end if
			
		}finally{
			//6 연결끊기
			DbConnection.getInstance().close(rsForum, pstmtForum, conForum);
			DbConnection.getInstance().close(rsBanner, pstmtBanner, conBanner);
		}
		
		System.out.println(bannerCnt+","+forumCnt);
		revenue = (bannerCnt*200000)+(forumCnt*130000);
		return revenue;
		
	}//selectSignCustomer
	
	
	
	
//	public static void main(String[] args) {
//		try {
//			System.out.println(new DashDAO().selectOperNotice());
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}catch(NamingException ne){
//			ne.printStackTrace();
//		}
//	}
	
}
