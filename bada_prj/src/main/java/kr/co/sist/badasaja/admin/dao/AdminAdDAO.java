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
import kr.co.sist.badasaja.vo.AdvertiserVO;
import kr.co.sist.badasaja.vo.BannerVO;
 
public class AdminAdDAO {

	private static AdminAdDAO adDAO;

	private AdminAdDAO() {
		// TODO Auto-generated constructor stub
	}

	public static AdminAdDAO getInstance() {

		if (adDAO == null) {
			adDAO = new AdminAdDAO();
		} // end if

		return adDAO;

	} // getInstance

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

			if ((aID != null && !aID.equals("")) && (gu == null || gu.equals("")) && (pr == null || pr.equals(""))
					&& (st == null || st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner").append("    where a_id like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				
			} else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr == null || pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner").append("    where gu_name like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);

			} else if ((aID == null || aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner").append("    where product like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, pr);

			} else if ((aID == null || aID.equals("")) && (gu == null || gu.equals("")) && (pr == null || pr.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner").append("    where b_status like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, st);

			} else if ((aID != null && !aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr == null || pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner").append("    where a_id like ? and gu_name like  ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);

			} else if ((aID != null && !aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner").append("    where a_id like ? and product like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, pr);

			} else if ((aID != null && !aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr == null || pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner").append("    where a_id like ? and b_status like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, st);

			} else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner").append("    where gu_name like  ? and product like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, pr);

			} else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr == null || pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner").append("    where gu_name like ? and product like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, st);

			} else if ((aID == null || aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner").append("    where gu_name like ? and product like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, pr);
				pstmt.setString(2, st);

			} else if ((aID != null && !aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st == null || st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where a_id like ? and gu_name like ? and  product like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, pr);

			} else if ((aID != null && !aID.equals("")) && (gu == null || gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where ai_id like ? and gu_name like ? b_status like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, st);

			} else if ((aID == null || aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where and  gu_name like ? and product like ?  and b_status like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, pr);
				pstmt.setString(3, st);

			} else if ((aID != null && !aID.equals("")) && (gu != null && !gu.equals(""))
					&& (pr != null && !pr.equals("")) && (st != null && !st.equals(""))) {

				query.append(" select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("      from admin_banner")
						.append("    where a_id like ? and  gu_name like ? and product like ? and b_status like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, pr);
				pstmt.setString(4, st);

			} else {

				query.append("  select b_num, a_id, gu_name, product, a_url, posted_date, expiry_date, b_status ")
						.append("from admin_banner");

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

	public List<AdvertiserVO> selectAllAdvertiser(String aID, String local) throws SQLException, NamingException {

		List<AdvertiserVO> list = new ArrayList<AdvertiserVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			if ((aID != null && !aID.equals("")) && (local == null || local.equals(""))) {
				query.append(" 	select a_id, a_name, gu_name,").append(
						" 	to_char(CONTRACT_DATE,'yyyy-mm-dd') contract_date, to_char(EXPIRY_DATE,'yyyy-mm-dd') expiry_date")
						.append(" 	from advertiser av").append(" 	inner join local l")
						.append(" 	on av.gu_code = l.gu_code").append("   where av.a_id like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");

			} else if ((aID == null || aID.equals("")) && (local != null && !local.equals(""))) {
				query.append(" 	select a_id, a_name, gu_name,").append(
						" 	to_char(CONTRACT_DATE,'yyyy-mm-dd') contract_date, to_char(EXPIRY_DATE,'yyyy-mm-dd') expiry_date")
						.append(" 	from advertiser av").append(" 	inner join local l")
						.append(" 	on av.gu_code = l.gu_code").append("   where l.gu_name like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, local);
			} else if ((aID != null && !aID.equals("")) && (local != null && !local.equals(""))) {
				query.append(" 	select a_id, a_name, gu_name,").append(
						" 	to_char(CONTRACT_DATE,'yyyy-mm-dd') contract_date, to_char(EXPIRY_DATE,'yyyy-mm-dd') expiry_date")
						.append(" 	from advertiser av").append(" 	inner join local l")
						.append(" 	on av.gu_code = l.gu_code").append("   where av.a_id like ? and l.gu_name like ?");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + aID + "%");
				pstmt.setString(2, local);
			} else {

				query.append(" 	select a_id, a_name, gu_name,").append(
						" 	to_char(CONTRACT_DATE,'yyyy-mm-dd') contract_date, to_char(EXPIRY_DATE,'yyyy-mm-dd') expiry_date")
						.append(" 	from advertiser av").append(" 	inner join local l")
						.append(" 	on av.gu_code = l.gu_code");

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

	public void insertAdForum(AdForumVO afVO) throws SQLException, NamingException {

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			query.append("insert into ad_forum(af_num, a_id, p_code, af_topic, af_main, af_status, main_img)")
					.append(" values('ad'||PRO1.AD_FORUM_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)");

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

	public void inserFImg(String imgs) throws SQLException, NamingException {

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			query.append("insert into ad_img(af_num, img)").append(" values('ad'||PRO1.AD_FORUM_SEQ.CURRVAL, ?)");

			pstmt = con.prepareStatement(query.toString());

			pstmt.setString(1, imgs);

			pstmt.executeUpdate();

		} finally {
			dc.close(null, pstmt, con);
		}
	}

}
