package kr.co.sist.badasaja.admin.dao;

import java.sql.Connection;  
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbConnection {

	private static DbConnection dc;
	/**
	 * 클래스 외부에서 객체화 하는것을 막는다.
	 */
	private DbConnection() {
		
	}
	/**
	 * Dbconnection 객체를 반환하는일
	 * @return
	 */
	public static DbConnection getInstance() {
		if(dc==null) {
			
			dc=new DbConnection();
		}
		return dc;
	}
	public Connection getConn() throws SQLException, NamingException {
		Connection con =null;
		
		//1. JDNI 사용객체 생성
		Context ctx = new InitialContext();
		//2. JDNI 객체를 사용하여 DBCP를 찾기
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/dbcp");
		//3. Connection 얻기
		 con = ds.getConnection();
		
		
		return con; 
	}//getConn.
	
	
	public Statement getStatment() throws SQLException, NamingException {
		Statement stmt= null;
		stmt=getConn().createStatement();
		return stmt;
	}
	
	
	/**
	 * DBMS 연결종료
	 * @param re
	 * @param stmt
	 * @param con
	 * @throws SQLException
	 */
	public void close(ResultSet rs,Statement stmt , Connection con)throws SQLException{
		if(rs!=null) {rs.close();}
		if(stmt!=null) {stmt.close();}
		if(con!=null) {con.close();}
	}

	
}
