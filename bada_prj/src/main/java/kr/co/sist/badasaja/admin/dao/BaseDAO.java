package kr.co.sist.badasaja.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import kr.co.sist.badasaja.vo.LocalVO;
import kr.co.sist.badasaja.vo.ProductVO;

public class BaseDAO {

	private static BaseDAO bDAO;

	private BaseDAO() {
		// TODO Auto-generated constructor stub
	}

	public static BaseDAO getInstance() {

		if (bDAO == null) {
			bDAO = new BaseDAO();
		} // end if

		return bDAO;

	} // getInstance

	public List<ProductVO> selectProductList() throws SQLException, NamingException {
		List<ProductVO> list = new ArrayList<ProductVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();

			pstmt = con.prepareStatement("select p_code, product from product");

			rs = pstmt.executeQuery();
			
			ProductVO pVO = null;
			
			while(rs.next()) {
				pVO = new ProductVO(rs.getString("p_code"), rs.getString("product"));
				
				list.add(pVO);
			}

		} finally {
			dc.close(rs, pstmt, con);
		}
		return list;
	}
	
	public List<LocalVO> selectLocalList() throws SQLException, NamingException {
		List<LocalVO> list = new ArrayList<LocalVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();

			pstmt = con.prepareStatement("select gu_code, gu_name from local");

			rs = pstmt.executeQuery();
			
			LocalVO lVO = null;
			
			while(rs.next()) {
				lVO = new LocalVO(rs.getInt("gu_code"), rs.getString("gu_name"));
				
				list.add(lVO);
			}

		} finally {
			dc.close(rs, pstmt, con);
		}
		return list;
	}

}
