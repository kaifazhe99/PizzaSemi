package ajaxboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mysql.db.DbConnect;

public class AjaxBoardDao {
	DbConnect db=new DbConnect();

	//insert
	public void insertBoard(AjaxBoardDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="insert into ajaxboard (writer,subject,content,avata,writeday) values (?,?,?,?,now())";

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getAvata());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}

	//출력
	public ArrayList<AjaxBoardDto> getAllDatas()
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from ajaxboard order by num desc";

		ArrayList<AjaxBoardDto> list=new ArrayList<AjaxBoardDto>();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				AjaxBoardDto dto=new AjaxBoardDto();
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setAvata(rs.getString("avata"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				//list 에 추가
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	//한개의 데이타 반환
	public AjaxBoardDto getData(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from ajaxboard where num=?";
		AjaxBoardDto dto=new AjaxBoardDto();

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {				
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setAvata(rs.getString("avata"));
				dto.setWriteday(rs.getTimestamp("writeday"));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}

	//삭제
	public void deleteBoard(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="delete from ajaxboard where num=?";

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1,num);

			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}

	//update
	public void updateBoard(AjaxBoardDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="update ajaxboard set writer=?,avata=?,subject=?,content=? where num=?";

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getAvata());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getNum());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}
}














