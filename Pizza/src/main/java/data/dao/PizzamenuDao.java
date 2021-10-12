package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import data.dto.PizzamenuDto;
import mysql.db.DbConnect;

public class PizzamenuDao {
	DbConnect db=new DbConnect();
	
	//insert
		public void insertPizza(PizzamenuDto dto) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			String sql="insert into pizzamenu (pname,price,content,photoname) values (?,?,?,?)";
		
			try {
				pstmt=conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, dto.getPname());
				pstmt.setString(2, dto.getPrice());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4, dto.getPhotoname());
				//실행
				pstmt.execute();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
	//출력
		public ArrayList<PizzamenuDto> getAllDatas(){
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select * from pizzamenu order by num desc";
			
			ArrayList<PizzamenuDto> list=new ArrayList<PizzamenuDto>();
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
				PizzamenuDto dto=new PizzamenuDto();
				dto.setNum(rs.getString("num"));
				dto.setPname(rs.getString("pname"));
				dto.setPrice(rs.getString("price"));
				dto.setContent(rs.getString("content"));
				dto.setPhotoname(rs.getString("photoname"));
				//list에 추가
				list.add(dto);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt,conn);
			}
			return list;
		}

}

