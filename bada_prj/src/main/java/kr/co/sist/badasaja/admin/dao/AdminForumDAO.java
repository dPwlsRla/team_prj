package kr.co.sist.badasaja.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.vo.AdForumVO;
import kr.co.sist.badasaja.vo.BannerVO;
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
			if ((aID != null && !aID.equals("")) && (gu == null || gu.equals("")) && (pr == null || pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum").append("    where a_id like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");

			} else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr == null || pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum").append("    where gu_name like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);

			} else if ((aID == null || aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum").append("    where product like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, pr);

			} else if ((aID == null || aID.equals("")) && (gu == null || gu.equals("")) && (pr == null || pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum").append("    where af_status like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, st);

			} else if ((aID != null && !aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr == null || pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum").append("    where a_id like ? and gu_name like  ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);

			} else if ((aID != null && !aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum").append("    where a_id like ? and product like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, pr);

			} else if ((aID != null && !aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr == null || pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum").append("    where a_id like ? and af_status like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, st);

			} else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum").append("    where gu_name like  ? and product like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, pr);

			} else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr == null || pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum").append("    where gu_name like ? and product like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, st);

			} else if ((aID == null || aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum").append("    where gu_name like ? and product like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, pr);
				pstmt.setString(2, st);

			} else if ((aID != null && !aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum")
						.append("    where a_id like ? and gu_name like ? and  product like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, pr);

			} else if ((aID != null && !aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum")
						.append("    where ai_id like ? and gu_name like ? af_status like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, st);

			} else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum")
						.append("    where and  gu_name like ? and product like ?  and af_status like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, pr);
				pstmt.setString(3, st);

			} else if ((aID != null && !aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("      from admin_ad_forum")
						.append("    where a_id like ? and  gu_name like ? and product like ? and af_status like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, pr);
				pstmt.setString(4, st);

			} else {

				query.append("  select af_num, a_id, gu_name, product, af_topic, posted_date, expiry_date, af_status ")
						.append("from admin_ad_forum");

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

	public AdForumVO selectAdForum(String afNum) throws SQLException, NamingException {
		AdForumVO afVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			query.append(" 	select a_id, product, af_topic, af_main, ").append(
					" 		to_char(posted_date,'yyyy-mm-dd') posted_date, to_char(expiry_date,'yyyy-mm-dd') expiry_date, ")
					.append(" 	af_status, main_img").append("  from ad_forum af ").append(" inner join product p ")
					.append(" on af.p_code = p.p_code").append("  where af_num = ? ");

			pstmt = con.prepareStatement(query.toString());

			pstmt.setString(1, afNum);
			rs = pstmt.executeQuery();


			if (rs.next()) {
				afVO = new AdForumVO();
				afVO.setAfTopic(rs.getString("af_topic"));
				afVO.setMainImg(rs.getString("main_img"));
				afVO.setaID(rs.getString("a_id"));
				afVO.setpCode(rs.getString("product"));
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

}
