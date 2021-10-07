package oracle.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	static final String ORACLEDRIVER="oracle.jdbc.driver.OracleDriver";
	//static final String ORACLEDRIVER="oracle.jdbc.OracleDriver";//둘다 된다
	
	//오라클 클라우드에 19c 추가한사람만 추가
	static final String ORACLE_CLOUD="jdbc:oracle:thin:@bitcamp_high?TNS_ADMIN=d:/OracleCloud";
	
	//로칼로 오라클 연결할 모든 사람 추가
	static final String ORACLE_LOCAL="jdbc:oracle:thin:@localhost:1521:xe";
	
	//생성자
	public DbConnect() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName(ORACLEDRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("오라클 드라이버 실패:"+e.getMessage());
		}
	}
	
	public Connection getLocalOracle()
	{
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(ORACLE_LOCAL, "angel", "a1234");
		} catch (SQLException e) {
			System.out.println("로칼 오라클 연결 실패:"+e.getMessage());
		}
		return conn;
	}
	
	public Connection getCloudOracle()
	{
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(ORACLE_CLOUD, "admin", "Moon2549466**");
		} catch (SQLException e) {
			System.out.println("로칼 오라클 연결 실패:"+e.getMessage());
		}
		return conn;
	}
	
	//close 메서드는 총 4개, 오버로딩 메서드
	public void dbClose(ResultSet rs,Statement stmt,Connection conn)
	{
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {}
	}
	
	public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn)
	{
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {}
	}
	public void dbClose(Statement stmt,Connection conn)
	{
		try {			
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {}
	}
	
	public void dbClose(PreparedStatement pstmt,Connection conn)
	{
		try {			
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {}
	}
}













