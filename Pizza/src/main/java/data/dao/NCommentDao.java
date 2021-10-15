package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.NCommentDto;
import mysql.db.DbConnect;

public class NCommentDao {
	DbConnect db=new DbConnect();
	
	public void insertNComment(NCommentDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql = "insert into answer (num,myid,content,writeday) values (?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getNum());
			pstmt.setString(2, dto.getMyid());
			pstmt.setString(3, dto.getContent());
			
			//실행
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public List<NCommentDto> getAllNComment(String num)
	{
		List<NCommentDto> list=new Vector<NCommentDto>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "select * from answer where num=? order by idx";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				NCommentDto dto=new NCommentDto();
				dto.setIdx(rs.getString("idx"));
				dto.setNum(rs.getString("num"));
				dto.setMyid(rs.getString("myid"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				//list에 추가
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
	
	public void deleteNComment(String idx)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql = "delete from answer where idx=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, idx);
			
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
