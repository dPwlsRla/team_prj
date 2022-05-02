package kr.co.sist.badasaja.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.vo.AdForumVO;
import kr.co.sist.badasaja.vo.AdImgVO;
import kr.co.sist.badasaja.vo.BannerVO;
import kr.co.sist.badasaja.vo.CForumVO;
import kr.co.sist.badasaja.vo.ComVO;
import oracle.net.aso.af;

public class AdminForumDAO {

	private static AdminForumDAO afDAO;

	private AdminForumDAO() {
		// TODO Auto-generated constructor stub
	}

	public static AdminForumDAO getInstance() {

		if (afDAO == null) {
			afDAO = new AdminForumDAO();
		} // end if

		return afDAO;

	} // getInstance

	/**
	 * 전체 광고게시글 조회 method
	 * 
	 * @param aID 게시자 아이디
	 * @param gu  지역
	 * @param pr  카테고리
	 * @param st  상태
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public List<AdForumVO> selectAllFforum(String aID, String gu, String pr, String st)
			throws SQLException, NamingException {

		List<AdForumVO> list = new ArrayList<AdForumVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();
			// 아이디로 검색했을 때
			if ((aID != null && !aID.equals("")) && (gu == null || gu.equals("")) && (pr == null || pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum").append("    where a_id like ? order by af_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");

			}
			// 지역으로 검색했을 때
			else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals("")) && (pr == null || pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum").append("    where gu_name = ? order by af_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);

			}
			// 카테고리로 검색했을 때
			else if ((aID == null || aID.equals("")) && (gu == null || gu.equals("")) && (pr != null && !pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum").append("    where product = ? order by af_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, pr);

			}
			// 상태로 검색했을 때
			else if ((aID == null || aID.equals("")) && (gu == null || gu.equals("")) && (pr == null || pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum").append("    where af_status = ? order by af_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, st);

			}
			// ID, 지역으로 검색했을 때
			else if ((aID != null && !aID.equals("")) && (gu != null && !gu.equals("")) && (pr == null || pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum")
						.append("    where a_id like ? and gu_name = ? order by af_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);

			}
			// ID, 카테고리로 검색했을 때
			else if ((aID != null && !aID.equals("")) && (gu == null || gu.equals("")) && (pr != null && !pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum")
						.append("    where a_id like ? and product = ? order by af_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, pr);

			} // ID, 상태로 검색했을 때
			else if ((aID != null && !aID.equals("")) && (gu == null || gu.equals("")) && (pr == null || pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum")
						.append("    where a_id like ? and af_status = ? order by af_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, st);

			}
			// 지역, 카테고리로 검색했을 때
			else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals("")) && (pr != null && !pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum")
						.append("    where gu_name =  ? and product = ? order by af_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, pr);

			}
			// 지역, 상태로 검색했을 대
			else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals("")) && (pr == null || pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum")
						.append("    where gu_name = ? and af_status = ? order by af_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, st);

			} // 카테고리 상태로 검색했을 때
			else if ((aID == null || aID.equals("")) && (gu == null || gu.equals("")) && (pr != null && !pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum")
						.append("    where product = ? and af_status = ? order by af_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, pr);
				pstmt.setString(2, st);

			}
			// ID, 지역으로 검색했을 때
			else if ((aID != null && !aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum")
						.append("    where a_id like ? and gu_name = ? and  product = ? order by af_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, pr);

			}
			// ID, 카테고리, 상태로 검색했을 때
			else if ((aID != null && !aID.equals("")) && (gu == null || gu.equals("")) && (pr != null && !pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum")
						.append("    where a_id like ? and gu_name = ? and af_status = ? order by af_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, st);

			}
			// 지역, 카테고리, 상태로 검색했을 때
			else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals("")) && (pr != null && !pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum")
						.append("    where gu_name = ? and product = ?  and af_status = ? order by af_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, pr);
				pstmt.setString(3, st);

			}
			// ID, 지역, 카테고리, 상태로 검색했을 때
			else if ((aID != null && !aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum")
						.append("    where a_id like ? and  gu_name = ? and product = ? and af_status = ? order by af_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, pr);
				pstmt.setString(4, st);

			}
			// 검색 조건이 없을 때
			else {
				query.append("  select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("from admin_ad_forum order by af_num ");

				pstmt = con.prepareStatement(query.toString());
			}

			rs = pstmt.executeQuery();

			AdForumVO afVO = null;

			while (rs.next()) {

				afVO = new AdForumVO();
				afVO.setAfNum(rs.getString("af_num"));
				afVO.setaID(rs.getString("a_id"));
				afVO.setAfTopic(rs.getString("af_topic"));
				afVO.setLocal(rs.getString("gu_name"));
				afVO.setAfStatus(rs.getString("af_status"));
				afVO.setpCode(rs.getString("product"));
				afVO.setPostedDate(rs.getString("posted_date"));
				afVO.setExpiryDate(rs.getString("expiry_date"));

				list.add(afVO);

			} // end while

		} finally {
			dc.close(rs, pstmt, con);
		}

		return list;
	} // selectAllFforum

	/**
	 * 광고게시글 상세조회 method
	 * 
	 * @param afNum 광고 게시글 번호
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public AdForumVO selectAdForum(String afNum) throws SQLException, NamingException {
		AdForumVO afVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			query.append(" 	select a_id, p_code, af_topic, af_main, ").append(
					" 		to_char(posted_date,'yyyy-mm-dd') posted_date, to_char(expiry_date,'yyyy-mm-dd') expiry_date, ")
					.append(" 	af_status, main_img").append("  from ad_forum af ").append("  where af_num = ? ");

			pstmt = con.prepareStatement(query.toString());

			pstmt.setString(1, afNum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				afVO = new AdForumVO();
				afVO.setAfTopic(rs.getString("af_topic"));
				afVO.setMainImg(rs.getString("main_img"));
				afVO.setaID(rs.getString("a_id"));
				afVO.setpCode(rs.getString("p_code"));
				afVO.setAfStatus(rs.getString("af_status"));
				afVO.setAfMain(rs.getString("af_main"));
				afVO.setPostedDate(rs.getString("posted_date"));
				afVO.setExpiryDate(rs.getString("expiry_date"));

			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return afVO;
	}

	/**
	 * 광고게시글 추가 이미지 조회 method
	 * 
	 * @param afNum 광고 게시글 번호
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public String selectAdImg(String afNum) throws SQLException, NamingException {
		String imgs = "";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			query.append(" select LISTAGG(img,',') within group(order by af_num) as img").append(" 	   from ad_img")
					.append("          where af_num =? ").append("  group by af_num ");

			pstmt = con.prepareStatement(query.toString());

			pstmt.setString(1, afNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				imgs = rs.getString("img");
			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return imgs;
	} // selectAdImg

	/**
	 * 유저 게시판 전체 조회 method
	 * 
	 * @param cID 유저 ID
	 * @param gu  지역
	 * @param pr  카테고리
	 * @param st  상태
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public List<CForumVO> selectAllCforum(String cID, String gu, String pr, String st)
			throws SQLException, NamingException {

		List<CForumVO> list = new ArrayList<CForumVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();
			// ID로 검색했을 때
			if ((cID != null && !cID.equals("")) && (gu == null || gu.equals("")) && (pr == null || pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select cf_num, c_id, gu_name, product, cf_topic, write_date, cf_status ")
						.append("      from admin_c_forum").append("    where c_id like ? order by cf_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + cID + "%");

			}
			// 지역으로 조회했을 때
			else if ((cID == null || cID.equals("")) && (gu != null && !gu.equals("")) && (pr == null || pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select cf_num, c_id, gu_name, product, cf_topic, write_date, cf_status ")
						.append("      from admin_c_forum").append("    where gu_name = ? order by cf_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);

			}
			// 카테고리로 검색했을 때
			else if ((cID == null || cID.equals("")) && (gu == null || gu.equals("")) && (pr != null && !pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select cf_num, c_id, gu_name, product, cf_topic, write_date, cf_status ")
						.append("      from admin_c_forum").append("    where product = ? order by cf_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, pr);

			}
			// 상태로 검색했을 때
			else if ((cID == null || cID.equals("")) && (gu == null || gu.equals("")) && (pr == null || pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select cf_num, c_id, gu_name, product, cf_topic, write_date, cf_status ")
						.append("      from admin_c_forum").append("    where cf_status = ? order by cf_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, st);

			}
			// ID, 지역으로 검색했을 때
			else if ((cID != null && !cID.equals("")) && (gu != null && !gu.equals("")) && (pr == null || pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select cf_num, c_id, gu_name, product, cf_topic, write_date, cf_status ")
						.append("      from admin_c_forum")
						.append("    where c_id like ? and gu_name =  ? order by cf_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + cID + "%");
				pstmt.setString(2, gu);

			}
			// ID, 카테고리로 검색했을 때
			else if ((cID != null && !cID.equals("")) && (gu == null || gu.equals("")) && (pr != null && !pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select cf_num, c_id, gu_name, product, cf_topic, write_date, cf_status ")
						.append("      from admin_c_forum")
						.append("    where c_id like ? and product = ? order by cf_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + cID + "%");
				pstmt.setString(2, pr);

			}
			// ID, 상태로 검색했을 때
			else if ((cID != null && !cID.equals("")) && (gu == null || gu.equals("")) && (pr == null || pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select cf_num, c_id, gu_name, product, cf_topic,write_date, cf_status ")
						.append("      from admin_c_forum")
						.append("    where c_id like ? and cf_status = ? order by cf_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + cID + "%");
				pstmt.setString(2, st);

			}
			// 지역, 카테고리로 검색했을 때
			else if ((cID == null || cID.equals("")) && (gu != null && !gu.equals("")) && (pr != null && !pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select cf_num, c_id, gu_name, product, cf_topic, write_date, cf_status ")
						.append("      from admin_c_forum")
						.append("    where gu_name =  ? and product = ? order by cf_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, pr);

			}
			// 지역, 상태로 검색했을 때
			else if ((cID == null || cID.equals("")) && (gu != null && !gu.equals("")) && (pr == null || pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select cf_num, c_id, gu_name, product, cf_topic, write_date, cf_status ")
						.append("      from admin_c_forum")
						.append("    where gu_name = ? and cf_status = ? order by cf_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, st);

			}
			// 카테고리, 상태로 검색했을 때
			else if ((cID == null || cID.equals("")) && (gu == null || gu.equals("")) && (pr != null && !pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select cf_num, c_id, gu_name, product, cf_topic, write_date, cf_status ")
						.append("      from admin_c_forum")
						.append("    where product = ? and cf_status = ? order by cf_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, pr);
				pstmt.setString(2, st);

			}
			// ID, 지역, 카테고리로 검색했을 때
			else if ((cID != null && !cID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select cf_num, c_id, gu_name, product, cf_topic, write_date, cf_status ")
						.append("      from admin_c_forum")
						.append("    where c_id like ? and gu_name = ? and  product = ? order by cf_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + cID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, pr);

			}
			// ID, 카테고리, 상태로 검색했을 때
			else if ((cID != null && !cID.equals("")) && (gu == null || gu.equals("")) && (pr != null && !pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select cf_num, c_id, gu_name, product, cf_topic, write_date, cf_status ")
						.append("      from admin_c_forum")
						.append("    where c_id like ? and gu_name = ? cf_status = ? order by cf_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + cID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, st);

			}
			// 지역, 카테고리, 상태로 검색했을 때
			else if ((cID == null || cID.equals("")) && (gu != null && !gu.equals("")) && (pr != null && !pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select cf_num, c_id, gu_name, product, cf_topic, write_date, cf_status ")
						.append("      from admin_c_forum")
						.append("    where gu_name = ? and product = ?  and cf_status = ? order by cf_num ");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, pr);
				pstmt.setString(3, st);

			}
			// ID, 지역, 카테고리, 상태로 검색했을 때
			else if ((cID != null && !cID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select cf_num, c_id, gu_name, product, cf_topic, write_date, cf_status ")
						.append("      from admin_c_forum")
						.append("    where c_id like ? and  gu_name = ? and product = ? and cf_status = ? order by cf_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + cID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, pr);
				pstmt.setString(4, st);

			}
			// 검색 조건이 없을 때
			else {

				query.append("  select cf_num, c_id, gu_name, product, cf_topic, write_date, cf_status ")
						.append("from admin_c_forum order by cf_num");

				pstmt = con.prepareStatement(query.toString());
			}

			rs = pstmt.executeQuery();

			CForumVO cfVO = null;

			while (rs.next()) {

				cfVO = new CForumVO();
				cfVO.setCfNum(rs.getString("cf_num"));
				cfVO.setcID(rs.getString("c_id"));
				cfVO.setCfTopic(rs.getString("cf_topic"));
				cfVO.setLocal(rs.getString("gu_name"));
				cfVO.setCfStatus(rs.getString("cf_status"));
				cfVO.setpCode(rs.getString("product"));
				cfVO.setWriteDate(rs.getString("write_date"));

				list.add(cfVO);

			} // end while

		} finally {
			dc.close(rs, pstmt, con);
		}

		return list;
	} // selectAllFforum

	/**
	 * 유저 게시글 상세조회 method
	 * 
	 * @param cfNum 유저 게시글 번호
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public CForumVO selectCForum(String cfNum) throws SQLException, NamingException {
		CForumVO cfVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			pstmt = con.prepareStatement("select * from admin_c_forum where cf_num = ? ");

			pstmt.setString(1, cfNum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cfVO = new CForumVO();
				cfVO.setCfTopic(rs.getString("cf_topic"));
				cfVO.setCfMain(rs.getString("cf_main"));
				cfVO.setcID(rs.getString("c_id"));
				cfVO.setLocal(rs.getString("gu_name"));
				cfVO.setpCode(rs.getString("product"));
				cfVO.setWriteDate(rs.getString("write_date"));
				cfVO.setCfStatus(rs.getString("cf_status"));
				cfVO.setMainImg(rs.getString("main_img"));

			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return cfVO;
	}

	/**
	 * HashTag 조회 method
	 * 
	 * @param cfNum 유저 게시글 번호
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public String selectHash(String cfNum) throws SQLException, NamingException {
		String hashes = "";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			query.append(" SELECT cf_num, LISTAGG(hash,',') WITHIN GROUP(ORDER BY cf_num) AS hash ")
					.append(" FROM hashtag where cf_num = ? ").append(" GROUP BY cf_num ");

			pstmt = con.prepareStatement(query.toString());

			pstmt.setString(1, cfNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				hashes = rs.getString("hash");
			}

		} finally {
			dc.close(rs, pstmt, con);
		}
		return hashes;
	}

	/**
	 * 유저 게시글 추가 이미지 조회 method
	 * 
	 * @param cfNum
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public String selectCImg(String cfNum) throws SQLException, NamingException {
		String imgs = "";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			query.append(" select LISTAGG(img,',') within group(order by cf_num) as img").append(" 	   from c_img")
					.append("          where cf_num =? ").append("  group by cf_num ");

			pstmt = con.prepareStatement(query.toString());

			pstmt.setString(1, cfNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				imgs = rs.getString("img");
			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return imgs;
	} // selectAdImg

}
