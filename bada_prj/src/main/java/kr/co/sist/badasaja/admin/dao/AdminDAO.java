package kr.co.sist.badasaja.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.vo.AdImgVO;
import kr.co.sist.badasaja.vo.CuVO;
import kr.co.sist.badasaja.vo.OperatorVO;

public class AdminDAO {

	private static AdminDAO aDAO;

	private AdminDAO() {

	}

	public static AdminDAO getInstance() {
		if (aDAO == null) {
			aDAO = new AdminDAO();
		}

		return aDAO;
	}

	public boolean selectAdminLogin(OperatorVO oVO) throws SQLException, NamingException {
		boolean flag = false;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			query.append("  select o_id,  o_pass  from  operator where o_id = ? and o_pass = ?");

			pstmt = con.prepareStatement(query.toString());

			pstmt.setString(1, oVO.getoID());
			pstmt.setString(2, oVO.getoPass());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				flag = true;
			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return flag;
	} // selectAdminLogin

	public List<CuVO> selectAllCustomer(String c_id, String gu, String st) throws SQLException, NamingException {
		List<CuVO> list = new ArrayList<CuVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();
		try {

			con = dc.getConn();

			pstmt = con.prepareStatement("select c_id, nickname, c_status, sign_date, access_date from customer order by c_id");

			rs = pstmt.executeQuery();

			CuVO cuVO = null;
			while (rs.next()) {
				cuVO = new CuVO();
				cuVO.setcID(rs.getString("c_id"));
				cuVO.setNickName(rs.getString("nickname"));
			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return list;
	}

	public boolean checkAID(String aID) throws SQLException, NamingException {

		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			pstmt = con.prepareStatement("select a_id from advertiser where a_id = ?");

			pstmt.setString(1, aID);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				flag = true;
			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return flag;
	} // checkAID

	public List<CuVO> selectAllCoustomer(String cID, String gu, String st) throws SQLException, NamingException {
		List<CuVO> list = new ArrayList<CuVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();

			StringBuilder query = new StringBuilder();

			if ((cID != null && !cID.equals("")) && (gu == null || gu.equals("")) && (st == null || st.equals(""))) {

				query.append("   select c_id, gu_name,  nickname, birth, gender, tel, profile, email, c_status,")
						.append("        to_char(sign_date,'yyyy-mm-dd') sign_date,  to_char(access_date,'yyyy-mm-dd') access_date, ipaddress   ")
						.append("        from customer c ").append("        inner join local l ")
						.append("        on c.gu_code = l.gu_code").append("        where c_id like ? order by c_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + cID + "%");

			} else if ((cID == null || cID.equals("")) && (gu != null && !gu.equals(""))
					&& (st == null || st.equals(""))) {
				query.append("   select c_id, gu_name,  nickname, birth, gender, tel, profile, email, c_status,")
						.append("        to_char(sign_date,'yyyy-mm-dd') sign_date,  to_char(access_date,'yyyy-mm-dd') access_date, ipaddress   ")
						.append("        from customer c ").append("        inner join local l ")
						.append("        on c.gu_code = l.gu_code").append("        where gu_name = ? order by c_id");

				pstmt = con.prepareStatement(query.toString());
				pstmt.setString(1, gu);

			} else if ((cID == null || cID.equals("")) && (gu == null || gu.equals(""))
					&& (st != null && !st.equals(""))) {
				query.append("   select c_id, gu_name,  nickname, birth, gender, tel, profile, email, c_status,")
						.append("        to_char(sign_date,'yyyy-mm-dd') sign_date,  to_char(access_date,'yyyy-mm-dd') access_date, ipaddress   ")
						.append("        from customer c ").append("        inner join local l ")
						.append("        on c.gu_code = l.gu_code").append("        where c_status = ? order by c_id");

				pstmt = con.prepareStatement(query.toString());
				pstmt.setString(1, st);
			} else if ((cID != null && !cID.equals("")) && (gu != null && !gu.equals(""))
					&& (st == null || st.equals(""))) {
				query.append("   select c_id, gu_name,  nickname, birth, gender, tel, profile, email, c_status,")
						.append("        to_char(sign_date,'yyyy-mm-dd') sign_date,  to_char(access_date,'yyyy-mm-dd') access_date, ipaddress   ")
						.append("        from customer c ").append("        inner join local l ")
						.append("        on c.gu_code = l.gu_code").append("        where c_id like ? and gu_name = ? order by c_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + cID + "%");
				pstmt.setString(2, gu);

			} else if ((cID != null && !cID.equals("")) && (gu == null || gu.equals(""))
					&& (st != null && !st.equals(""))) {
				query.append("   select c_id, gu_name,  nickname, birth, gender, tel, profile, email, c_status,")
						.append("        to_char(sign_date,'yyyy-mm-dd') sign_date,  to_char(access_date,'yyyy-mm-dd') access_date, ipaddress   ")
						.append("        from customer c ").append("        inner join local l ")
						.append("        on c.gu_code = l.gu_code").append("        where c_id like ? and c_status = ? order by c_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + cID + "%");
				pstmt.setString(2, st);

			} else if ((cID == null || cID.equals("")) && (gu != null && !gu.equals(""))
					&& (st != null && !st.equals(""))) {
				query.append("   select c_id, gu_name,  nickname, birth, gender, tel, profile, email, c_status,")
						.append("        to_char(sign_date,'yyyy-mm-dd') sign_date,  to_char(access_date,'yyyy-mm-dd') access_date, ipaddress   ")
						.append("        from customer c ").append("        inner join local l ")
						.append("        on c.gu_code = l.gu_code")
						.append("        where gu_name = ? and c_status = ? order by c_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, gu);
				pstmt.setString(2, st);

			} else if ((cID != null && !cID.equals("")) && (gu != null && !gu.equals(""))
					&& (st != null && !st.equals(""))) {
				query.append("   select c_id, gu_name,  nickname, birth, gender, tel, profile, email, c_status,")
						.append("        to_char(sign_date,'yyyy-mm-dd') sign_date,  to_char(access_date,'yyyy-mm-dd') access_date, ipaddress   ")
						.append("        from customer c ").append("        inner join local l ")
						.append("        on c.gu_code = l.gu_code")
						.append("        where c_id like ? and gu_name = ? and c_status = ? order by c_id");

				pstmt = con.prepareStatement(query.toString());

				pstmt.setString(1, "%" + cID + "%");
				pstmt.setString(2, gu);
				pstmt.setString(3, st);

			} else {

				query.append("   select c_id, gu_name,  nickname, birth, gender, tel, profile, email, c_status,")
						.append("        to_char(sign_date,'yyyy-mm-dd') sign_date,  to_char(access_date,'yyyy-mm-dd') access_date, ipaddress   ")
						.append("        from customer c ").append("        inner join local l ")
						.append("        on c.gu_code = l.gu_code order by c_id");

				pstmt = con.prepareStatement(query.toString());

			}

			rs = pstmt.executeQuery();

			CuVO cuVO = null;
			while (rs.next()) {

				cuVO = new CuVO();
				cuVO.setcID(rs.getString("c_id"));
				cuVO.setGuName(rs.getString("gu_name"));
				cuVO.setNickName(rs.getString("nickname"));
				cuVO.setBirth(rs.getString("birth"));
				cuVO.setGender(rs.getString("gender"));
				cuVO.setTel(rs.getString("tel"));
				cuVO.setProfile(rs.getString("profile"));
				cuVO.setEmail(rs.getString("email"));
				cuVO.setcStatus(rs.getString("c_status"));
				cuVO.setSignDate(rs.getString("sign_date"));
				cuVO.setAccessDate(rs.getString("access_date"));
				cuVO.setIpAddress(rs.getString("ipaddress"));

				list.add(cuVO);
			}

		} finally {
			dc.close(rs, pstmt, con);
		}

		return list;
	}
	
	public CuVO selectCostomerInfo(String cID) throws SQLException, NamingException {
		
		CuVO cVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {

			con = dc.getConn();
			
			pstmt = con.prepareStatement("select * from customer_info where c_id = ?");
			
			pstmt.setString(1, cID);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cVO = new CuVO();
				cVO.setcID(rs.getString("c_id"));
				cVO.setForumCount(rs.getInt("forum_count"));
				cVO.setReportCount(rs.getInt("report_count"));
				cVO.setGuName(rs.getString("gu_name"));
				cVO.setNickName(rs.getString("nickname"));
				cVO.setBirth(rs.getString("birth"));
				cVO.setGender(rs.getString("gender"));
				cVO.setTel(rs.getString("tel"));
				cVO.setProfile(rs.getString("profile"));
				cVO.setEmail(rs.getString("email"));
				cVO.setcStatus(rs.getString("c_status"));
				cVO.setSignDate(rs.getString("sign_date"));
				cVO.setAccessDate(rs.getString("access_date"));
				cVO.setIpAddress(rs.getString("ipaddress"));
			}

		} finally {
			dc.close(rs, pstmt, con);
		}
		return cVO;
	}
	
	public void updateStatus(String cID, String ust) throws SQLException, NamingException {
		
		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dc = DbConnection.getInstance();
		
		try {
			
			con = dc.getConn();
			
			pstmt = con.prepareStatement(" update customer set c_status = ? where c_id = ? ");
			
			pstmt.setString(1, ust);
			pstmt.setString(2, cID);
			
			pstmt.executeUpdate();
			
		} finally {
			dc.close(null, pstmt, con);
		}
	}
}
