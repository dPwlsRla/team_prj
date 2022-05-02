package kr.co.sist.badasaja.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.vo.CReportVO;
import kr.co.sist.badasaja.vo.FReportVO;
import kr.co.sist.badasaja.vo.ReportVO;

public class AdminReportDAO {

	private static AdminReportDAO arDAO;

	private AdminReportDAO() {
		// TODO Auto-generated constructor stub
	}

	public static AdminReportDAO getInstance() {
		if (arDAO == null) {
			arDAO = new AdminReportDAO();
		} // end if

		return arDAO;
	}

	/**
	 * 신고 유형 조회 method
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public List<ReportVO> selectReport() throws SQLException, NamingException {
		List<ReportVO> list = new ArrayList<ReportVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			pstmt = con.prepareStatement(" select * from report order by r_code ");

			rs = pstmt.executeQuery();

			ReportVO rVO = null;
			while (rs.next()) {
				rVO = new ReportVO();
				rVO.setrCode(rs.getInt("r_code"));
				rVO.setrCategory(rs.getString("r_category"));

				list.add(rVO);
			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return list;
	}

	/**
	 * 게시글 신고 전체 조회 method
	 * 
	 * @param rID ID
	 * @param type 신고 유형
	 * @param st 상태
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public List<FReportVO> selectFReport(String rID, String type, String st) throws SQLException, NamingException {
		List<FReportVO> list = new ArrayList<FReportVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			// ID로 검색했을 때
			if ((rID != null && !rID.equals("")) && (type == null || type.equals(""))
					&& (st == null || st.equals(""))) {

				query.append("  	select cfr_num, cf_num, c_id, r_category , cfr_main, cfr_status, ").append(
						"   to_char(cfr_date, 'yyyy-mm-dd') cfr_date, to_char(cfr_report, 'yyyy-mm-dd') cfr_report")
						.append("           from f_report fr").append("           inner join report r")
						.append("           on fr.r_code = r.r_code ")
						.append("           where c_id like ? order by cfr_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + rID + "%");

			}
			// 신고 유형으로 검색했을 때
			else if ((rID == null || rID.equals("")) && (type != null && !type.equals(""))
					&& (st == null || st.equals(""))) {

				query.append("  	select cfr_num, cf_num, c_id, r_category , cfr_main, cfr_status, ").append(
						"   to_char(cfr_date, 'yyyy-mm-dd') cfr_date, to_char(cfr_report, 'yyyy-mm-dd') cfr_report")
						.append("           from f_report fr").append("           inner join report r")
						.append("           on fr.r_code = r.r_code ")
						.append("           where r_category = ? order by cfr_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, type);

			}
			// 상태로 검색했을 때
			else if ((rID == null || rID.equals("")) && (type == null || type.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append("  	select cfr_num, cf_num, c_id, r_category , cfr_main, cfr_status, ").append(
						"   to_char(cfr_date, 'yyyy-mm-dd') cfr_date, to_char(cfr_report, 'yyyy-mm-dd') cfr_report")
						.append("           from f_report fr").append("           inner join report r")
						.append("           on fr.r_code = r.r_code ")
						.append("           where cfr_status = ? order by cfr_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, st);

			}
			// ID, 유형으로 검색했을 때
			else if ((rID != null && !rID.equals("")) && (type != null && !type.equals(""))
					&& (st == null || st.equals(""))) {

				query.append("  	select cfr_num, cf_num, c_id, r_category , cfr_main, cfr_status, ").append(
						"   to_char(cfr_date, 'yyyy-mm-dd') cfr_date, to_char(cfr_report, 'yyyy-mm-dd') cfr_report")
						.append("           from f_report fr").append("           inner join report r")
						.append("           on fr.r_code = r.r_code ")
						.append("           where c_id like ? and r_category = ? order by cfr_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + rID + "%");
				pstmt.setString(2, type);

			}
			// ID, 상태로 검색했을 때
			else if ((rID != null && !rID.equals("")) && (type == null || type.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append("  	select cfr_num, cf_num, c_id, r_category , cfr_main, cfr_status, ").append(
						"   to_char(cfr_date, 'yyyy-mm-dd') cfr_date, to_char(cfr_report, 'yyyy-mm-dd') cfr_report")
						.append("           from f_report fr").append("           inner join report r")
						.append("           on fr.r_code = r.r_code ")
						.append("           where c_id like ? and cfr_status = ? order by cfr_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + rID + "%");
				pstmt.setString(2, st);

			}
			// 유형, 상태로 검색했을 때
			else if ((rID == null || rID.equals("")) && (type != null && !type.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append("  	select cfr_num, cf_num, c_id, r_category , cfr_main, cfr_status, ").append(
						"   to_char(cfr_date, 'yyyy-mm-dd') cfr_date, to_char(cfr_report, 'yyyy-mm-dd') cfr_report")
						.append("           from f_report fr").append("           inner join report r")
						.append("           on fr.r_code = r.r_code ")
						.append("           where r_category = ? and cfr_status = ? order by cfr_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, type);
				pstmt.setString(2, st);

			}
			// ID, 유형, 상태로 검색했을 때
			else if ((rID != null && !rID.equals("")) && (type != null && !type.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append("  	select reported_id, report_id, r_category , cr_main, ")
						.append("           cr_status, to_char(cr_date, 'yyyy-mm-dd') cr_date")
						.append("           from c_report cr").append("           inner join report r")
						.append("           on cr.r_code = r.r_code ")
						.append("           where report_id like ? and r_category = ? and cr_Status = ? order by cfr_num");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + rID + "%");
				pstmt.setString(2, type);
				pstmt.setString(3, st);

			}
			// 검색 조건이 없을 때
			else {

				query.append("  	select cfr_num, cf_num, c_id, r_category , cfr_main, cfr_status, ").append(
						"   to_char(cfr_date, 'yyyy-mm-dd') cfr_date, to_char(cfr_report, 'yyyy-mm-dd') cfr_report")
						.append("           from f_report fr").append("           inner join report r")
						.append("           on fr.r_code = r.r_code order by cfr_num ");

				pstmt = con.prepareStatement(query.toString());

			}

			rs = pstmt.executeQuery();

			FReportVO frVO = null;
			while (rs.next()) {
				frVO = new FReportVO();

				frVO.setCfrNum(rs.getString("cfr_num"));
				frVO.setCfNum(rs.getString("cf_num"));
				frVO.setcID(rs.getString("c_id"));
				frVO.setrCategory(rs.getString("r_category"));
				frVO.setCfrMain(rs.getString("cfr_main"));
				frVO.setCfrStatus(rs.getString("cfr_status").charAt(0));
				frVO.setCfrDate(rs.getString("cfr_date"));
				frVO.setCfrReport(rs.getString("cfr_report"));

				list.add(frVO);

			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return list;
	}

	/**
	 * 게시글 신고글 본문 조회 Method
	 * @param cfrNum 신고번호
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public String selectFrMain(String cfrNum) throws SQLException, NamingException {
		String main = "";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			pstmt = con.prepareStatement(" select cfr_main from f_report where cfr_num = ?");

			pstmt.setString(1, cfrNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				main = rs.getString("cfr_main");
			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return main;
	}

	/**
	 * 유저 신고 전체 조회 method
	 * @param rID 신고자 ID
	 * @param type 신고 유형
	 * @param st 상태
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public List<CReportVO> selectCReport(String rID, String type, String st) throws SQLException, NamingException {
		List<CReportVO> list = new ArrayList<CReportVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			// ID로 검색했을 때
			if ((rID != null && !rID.equals("")) && (type == null || type.equals(""))
					&& (st == null || st.equals(""))) {

				query.append("  	select reported_id, report_id, r_category , cr_main, ")
						.append("           cr_status, to_char(cr_date, 'yyyy-mm-dd') cr_date")
						.append("           from c_report cr").append("           inner join report r")
						.append("           on cr.r_code = r.r_code ")
						.append("           where reported_id like ? order by reported_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + rID + "%");

			}
			// 신고 유형으로 검색했을 때
			else if ((rID == null || rID.equals("")) && (type != null && !type.equals(""))
					&& (st == null || st.equals(""))) {

				query.append("  	select reported_id, report_id, r_category , cr_main, ")
						.append("           cr_status, to_char(cr_date, 'yyyy-mm-dd') cr_date")
						.append("           from c_report cr").append("           inner join report r")
						.append("           on cr.r_code = r.r_code ")
						.append("           where r_category = ? order by reported_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, type);

			}
			// 상태로 검색했을 때
			else if ((rID == null || rID.equals("")) && (type == null || type.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append("  	select reported_id, report_id, r_category , cr_main, ")
						.append("           cr_status, to_char(cr_date, 'yyyy-mm-dd') cr_date")
						.append("           from c_report cr").append("           inner join report r")
						.append("           on cr.r_code = r.r_code ")
						.append("           where cr_Status = ? order by reported_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, st);

			}
			// ID, 신고 유형으로 검색했을 때
			else if ((rID != null && !rID.equals("")) && (type != null && !type.equals(""))
					&& (st == null || st.equals(""))) {

				query.append("  	select reported_id, report_id, r_category , cr_main, ")
						.append("           cr_status, to_char(cr_date, 'yyyy-mm-dd') cr_date")
						.append("           from c_report cr").append("           inner join report r")
						.append("           on cr.r_code = r.r_code ")
						.append("           where reported_id like ? and r_category = ? order by reported_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + rID + "%");
				pstmt.setString(2, type);

			}
			// ID, 상태로 검색했을 때
			else if ((rID != null && !rID.equals("")) && (type == null || type.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append("  	select reported_id, report_id, r_category , cr_main, ")
						.append("           cr_status, to_char(cr_date, 'yyyy-mm-dd') cr_date")
						.append("           from c_report cr").append("           inner join report r")
						.append("           on cr.r_code = r.r_code ")
						.append("           where reported_id like ? and cr_Status = ? order by reported_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + rID + "%");
				pstmt.setString(2, st);

			}
			// 신고 유형, 상태로 검색했을 때
			else if ((rID == null || rID.equals("")) && (type != null && !type.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append("  	select reported_id, report_id, r_category , cr_main, ")
						.append("           cr_status, to_char(cr_date, 'yyyy-mm-dd') cr_date")
						.append("           from c_report cr").append("           inner join report r")
						.append("           on cr.r_code = r.r_code ")
						.append("           where r_category = ? and cr_Status = ? order by reported_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, type);
				pstmt.setString(2, st);

			}
			// ID, 신고 유형, 상태로 검색했을 때
			else if ((rID != null && !rID.equals("")) && (type != null && !type.equals(""))
					&& (st != null && !st.equals(""))) {

				query.append("  	select reported_id, report_id, r_category , cr_main, ")
						.append("           cr_status, to_char(cr_date, 'yyyy-mm-dd') cr_date")
						.append("           from c_report cr").append("           inner join report r")
						.append("           on cr.r_code = r.r_code ")
						.append("           where reported_id like ? and r_category = ? and cr_Status = ? order by reported_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + rID + "%");
				pstmt.setString(2, type);
				pstmt.setString(3, st);

			}
			// 검색조건이 없을 때
			else {

				query.append("  	select reported_id, report_id, r_category , cr_main, ")
						.append("           cr_status, to_char(cr_date, 'yyyy-mm-dd') cr_date")
						.append("           from c_report cr").append("           inner join report r")
						.append("           on cr.r_code = r.r_code order by reported_id ");

				pstmt = con.prepareStatement(query.toString());

			}

			rs = pstmt.executeQuery();

			CReportVO crVO = null;
			while (rs.next()) {
				crVO = new CReportVO();
				crVO.setReportedID(rs.getString("reported_id"));
				crVO.setReportID(rs.getString("report_id"));
				crVO.setrCategory(rs.getString("r_category"));
				crVO.setCrMain(rs.getString("cr_main"));
				crVO.setCrStatus(rs.getString("cr_status").charAt(0));
				crVO.setCrDate(rs.getString("cr_date"));

				list.add(crVO);
			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return list;
	}

	/**
	 * 계정 신고 상세 조회 method
	 * @param redID 신고자 ID
	 * @return
	 * @throws SQLException
	 * @throws NamingException
	 */
	public String selectCrMain(String redID) throws SQLException, NamingException {
		String main = "";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			pstmt = con.prepareStatement(" select cr_main from c_report where reported_id = ?");

			pstmt.setString(1, redID);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				main = rs.getString("cr_main");
			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return main;
	}

}
