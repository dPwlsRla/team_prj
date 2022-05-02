package kr.co.sist.badasaja.admin.dao;

import java.sql.Connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.vo.AdForumVO;
import kr.co.sist.badasaja.vo.AdImgVO;
import kr.co.sist.badasaja.vo.AdvertiserVO;
import kr.co.sist.badasaja.vo.BannerVO;

public class AdminAdDAO {

	private static AdminAdDAO adDAO;

	private AdminAdDAO() {
	}

	public static AdminAdDAO getInstance() {

		if (adDAO == null) {
			adDAO = new AdminAdDAO();
		} // end if

		return adDAO;

	} // getInstance

	/**
	 * 베너 전체 조회 method
	 * @param aID 광고주 ID
	 * @param gu 지역
	 * @param pr 카테고리
	 * @param st 상태
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public List<BannerVO> selectAllBanner(String aID, String gu, String pr, String st)
			throws SQLException, NamingException {

		List<BannerVO> list = new ArrayList<BannerVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			// ID로 검색했을 때
			if ((aID != null && !aID.equals("")) && (gu == null || gu.equals("")) && (pr == null || pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner").append("    where a_id like ? order by b_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");

			}
			// 지역으로 검색했을 때
			else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr == null || pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner").append("    where gu_name = ? order by b_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);

			}
			// 카테고리로 검색했을 때
			else if ((aID == null || aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner").append("    where product = ? order by b_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, pr);

			}
			// 상태로 검색 했을 때
			else if ((aID == null || aID.equals("")) && (gu == null || gu.equals("")) && (pr == null || pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner").append("    where b_status = ? order by b_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, st);

			}
			// ID, 지역으로 검색했을 때
			else if ((aID != null && !aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr == null || pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where a_id like ? and gu_name =  ? order by b_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);

			} 
			// ID, 카테고리로 검색했을 때
			else if ((aID != null && !aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where a_id like ? and product = ? order by b_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, pr);

			}
			// ID, 상태로 검색했을 때
			else if ((aID != null && !aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr == null || pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where a_id like ? and b_status = ? order by b_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, st);

			}
			// 지역, 카테고리로 검색했을 때
			else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where gu_name =  ? and product = ? order by b_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, pr);

			}
			// 지역, 상태로 검색했을 때
			else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr == null || pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where gu_name = ? and b_status = ? order by b_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, st);

			}
			// 카테고리, 상태로 검색했을 때
			else if ((aID == null || aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where product = ? and b_status = ? order by b_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, pr);
				pstmt.setString(2, st);

			}
			// 아이디, 지역, 카테고리로 검색했을 때
			else if ((aID != null && !aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where a_id like ? and gu_name = ? and  product = ? order by b_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, pr);

			}
			// 아이디, 카테고리, 상태로 검색했을 때
			else if ((aID != null && !aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where a_id like ? and product = ? and b_status = ? order by b_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, pr);
				pstmt.setString(3, st);

			}
			// 아이디, 카테고리, 상태로 검색했을 때
			else if ((aID != null && !aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where a_id like ? and gu_name = ? and b_status = ? order by b_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, st);

			}
			// 지역, 카테고리, 상태로 검색했을 때
			else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where gu_name = ? and product = ?  and b_status = ? order by b_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, pr);
				pstmt.setString(3, st);

			}
			// 아이디, 지역, 카테고리, 상태로 검색했을 때
			else if ((aID != null && !aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where a_id like ? and  gu_name = ? and product = ? and b_status = ? order by b_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, pr);
				pstmt.setString(4, st);

			}
			// 검색조건이 없을 때
			else {

				query.append("  select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("from admin_banner order by b_num");

				pstmt = con.prepareStatement(query.toString());
			}

			rs = pstmt.executeQuery();

			BannerVO bVO = null;

			while (rs.next()) {

				bVO = new BannerVO();
				bVO.setbNum(rs.getString("b_num"));
				bVO.setaID(rs.getString("a_id"));
				bVO.setaURL(rs.getString("a_url"));
				bVO.setbStatus(rs.getString("b_status").charAt(0));
				bVO.setLocal(rs.getString("gu_name"));
				bVO.setpCode(rs.getString("product"));
				bVO.setPostedDate(rs.getString("posted_date"));
				bVO.setExpiryDate(rs.getString("expiry_date"));

				list.add(bVO);

			} // end while

		} finally {
			dc.close(rs, pstmt, con);
		}

		return list;
	} // selectAllBanner

	/**
	 * 전체 광고주 조회 method
	 * @param aID 광고주 ID
	 * @param local 지역
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public List<AdvertiserVO> selectAllAdvertiser(String aID, String local) throws SQLException, NamingException {

		List<AdvertiserVO> list = new ArrayList<AdvertiserVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			// ID로 검색했을 때
			if ((aID != null && !aID.equals("")) && (local == null || local.equals(""))) {
				query.append(" 	select a_id, a_name, gu_name,").append(
						" 	to_char(CONTRACT_DATE,'yyyy-mm-dd') contract_date, to_char(EXPIRY_DATE,'yyyy-mm-dd') expiry_date")
						.append(" 	from advertiser av").append(" 	inner join local l")
						.append(" 	on av.gu_code = l.gu_code").append("   where av.a_id like ? order by a_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");

			}
			// 지역으로 검색했을 때
			else if ((aID == null || aID.equals("")) && (local != null && !local.equals(""))) {
				query.append(" 	select a_id, a_name, gu_name,").append(
						" 	to_char(CONTRACT_DATE,'yyyy-mm-dd') contract_date, to_char(EXPIRY_DATE,'yyyy-mm-dd') expiry_date")
						.append(" 	from advertiser av").append(" 	inner join local l")
						.append(" 	on av.gu_code = l.gu_code").append("   where l.gu_name = ? order by a_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, local);
			}
			// 아이디, 지역으로 검색했을 때
			else if ((aID != null && !aID.equals("")) && (local != null && !local.equals(""))) {
				query.append(" 	select a_id, a_name, gu_name,").append(
						" 	to_char(CONTRACT_DATE,'yyyy-mm-dd') contract_date, to_char(EXPIRY_DATE,'yyyy-mm-dd') expiry_date")
						.append(" 	from advertiser av").append(" 	inner join local l")
						.append(" 	on av.gu_code = l.gu_code")
						.append("   where av.a_id like ? and l.gu_name = ? order by a_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, local);
			}
			// 아무런 조건이 없을 때
			else {

				query.append(" 	select a_id, a_name, gu_name,").append(
						" 	to_char(CONTRACT_DATE,'yyyy-mm-dd') contract_date, to_char(EXPIRY_DATE,'yyyy-mm-dd') expiry_date")
						.append(" 	from advertiser av").append(" 	inner join local l")
						.append(" 	on av.gu_code = l.gu_code order by a_id");

				pstmt = con.prepareStatement(query.toString());

			}
			rs = pstmt.executeQuery();

			AdvertiserVO avVO = null;

			while (rs.next()) {
				String a_id = rs.getString("a_id");
				String a_name = rs.getString("a_name");
				String gu_code = rs.getString("gu_name");
				String contract_date = rs.getString("contract_date");
				String expiry_date = rs.getString("expiry_date");

				avVO = new AdvertiserVO(a_id, gu_code, a_name, contract_date, expiry_date);

				list.add(avVO);

			} // end while

		} finally {
			dc.close(rs, pstmt, con);
		}

		return list;
	} // selectAllAdvertiser

	/**
	 * 광고주 등록 method
	 * @param adVO 광고주 정보
	 * @throws SQLException
	 * @throws NamingException
	 */
	public void insertAdvertiser(AdvertiserVO adVO) throws SQLException, NamingException {

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			pstmt = con.prepareStatement("insert into advertiser(a_id, a_name, gu_code) values(?,?,?)");

			pstmt.setString(1, adVO.getaID());
			pstmt.setString(2, adVO.getaName());
			pstmt.setString(3, adVO.getGuCode());

			pstmt.executeUpdate();

		} finally {
			dc.close(null, pstmt, con);
		}
	} // insertAdvertiser

	/**
	 * 게시글 작성 method
	 * @param afVO 게시글 Data
	 * @throws SQLException
	 * @throws NamingException
	 */
	public void insertAdForum(AdForumVO afVO) throws SQLException, NamingException {

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			query.append("insert into ad_forum(af_num, a_id, p_code, af_topic, af_main, af_status, main_img)")
					.append(" values('ad'||AD_FORUM_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)");

			pstmt = con.prepareStatement(query.toString());

			pstmt.setString(1, afVO.getaID());
			pstmt.setString(2, afVO.getpCode());
			pstmt.setString(3, afVO.getAfTopic());
			pstmt.setString(4, afVO.getAfMain());
			pstmt.setString(5, afVO.getAfStatus());
			pstmt.setString(6, afVO.getMainImg());

			pstmt.executeUpdate();

		} finally {
			dc.close(null, pstmt, con);
		}
	}

	/**
	 * 광고 게시글 이미지 조회 method
	 * @param imgs
	 * @throws SQLException
	 * @throws NamingException
	 */
	public void inserFImg(String imgs) throws SQLException, NamingException {

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = null;

			// 조회 결과에 사진이 2장 이상인 경우
			if (imgs.contains(",")) {
				String[] imgArr = imgs.split(",");
				for (int i = 0; i < imgArr.length; i++) {
					query = new StringBuilder();
					query.append("insert into ad_img(af_num, img)")
							.append(" values('ad'||AD_FORUM_SEQ.CURRVAL, ?)");

					pstmt = con.prepareStatement(query.toString());

					pstmt.setString(1, imgArr[i]);

					pstmt.executeUpdate();
				}
			}
			// 한장인 경우
			else {
				query = new StringBuilder();
				query.append("insert into ad_img(af_num, img)").append(" values('ad'||AD_FORUM_SEQ.CURRVAL, ?)");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, imgs);
			}

			pstmt.executeUpdate();

		} finally {
			dc.close(null, pstmt, con);
		}
	}

	/**
	 * 배너광고 등록 method
	 * @param bVO 배너 등록 data
	 * @throws SQLException
	 * @throws NamingException
	 */
	public void insertBanner(BannerVO bVO) throws SQLException, NamingException {

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			query.append("insert into banner(b_num, a_id, a_url, p_code, img)")
					.append(" values('b'||BANNER_SEQ.NEXTVAL, ?, ?, ?, ?)");

			pstmt = con.prepareStatement(query.toString());

			pstmt.setString(1, bVO.getaID());
			pstmt.setString(2, bVO.getaURL());
			pstmt.setString(3, bVO.getpCode());
			pstmt.setString(4, bVO.getImg());

			pstmt.executeUpdate();

		} finally {
			dc.close(null, pstmt, con);
		}
	} // insertBanner

	/**
	 * 광고 게시글 업데이트 method
	 * @param afVO 광고 게시글 data
	 * @throws SQLException
	 * @throws NamingException
	 */
	public void updateAdForum(AdForumVO afVO) throws SQLException, NamingException {

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			query.append(" update ad_forum ").append("  set af_topic = ?, af_main = ?, p_code = ?, af_status = ?  ")
					.append("  where af_num = ? ");

			pstmt = con.prepareStatement(query.toString());

			pstmt.setString(1, afVO.getAfTopic());
			pstmt.setString(2, afVO.getAfMain());
			pstmt.setString(3, afVO.getpCode());
			pstmt.setString(4, afVO.getAfStatus());
			pstmt.setString(5, afVO.getAfNum());

			pstmt.executeUpdate();

		} finally {
			dc.close(null, pstmt, con);

		}

	} // updateAdForum

	/**
	 * 게시글 상태 변경 method
	 * @param afNum 광고 게시글 번호
	 * @throws SQLException
	 * @throws NamingException
	 */
	public void updateAfStatus(String afNum) throws SQLException, NamingException {

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dc = DbConnection.getInstance();
		try {
			con = dc.getConn();

			pstmt = con.prepareStatement(" update ad_forum set af_status = '삭제' where af_num = ? ");

			pstmt.setString(1, afNum);

			pstmt.executeUpdate();

		} finally {
			dc.close(null, pstmt, con);

		}

	}

}
