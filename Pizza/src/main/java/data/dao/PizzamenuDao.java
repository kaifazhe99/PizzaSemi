package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import data.dto.EtcmenuDto;
import data.dto.PizzamenuDto;
import data.dto.SidemenuDto;
import mysql.db.DbConnect;

public class PizzamenuDao {
	DbConnect db=new DbConnect();
	
	//insert
		public void insertPizza(PizzamenuDto dto) {
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			String sql="insert into pizzamenu (myid,pname,price,content,photoname) values (?,?,?,?,?)";
		
			try {
				pstmt=conn.prepareStatement(sql);
				//���ε�
				pstmt.setString(1, dto.getMyid());
				pstmt.setString(2, dto.getPname());
				pstmt.setString(3, dto.getPrice());
				pstmt.setString(4, dto.getContent());
				pstmt.setString(5, dto.getPhotoname());
				//����
				pstmt.execute();
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
	//���
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
				//list�� �߰�
				list.add(dto);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt,conn);
			}
			return list;
		}
		
		//num �� �ش��ϴ� dto ��ȯ
				public PizzamenuDto getData(String num)
				{
					PizzamenuDto dto=new PizzamenuDto();
					Connection conn=db.getConnection();
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					String sql="select * from pizzamenu where num=?";

					try {
						pstmt=conn.prepareStatement(sql);
						//���ε�
						pstmt.setString(1, num);
						rs=pstmt.executeQuery();
						if(rs.next())
						{				
							dto.setNum(rs.getString("num"));
							dto.setMyid(rs.getString("myid"));
							dto.setPname(rs.getString("pname"));
							dto.setPrice(rs.getString("price"));
							dto.setContent(rs.getString("content"));
							dto.setPhotoname(rs.getString("photoname"));
						}			
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						db.dbClose(rs,pstmt, conn);
					}
					return dto;
				}
				
		//����
		public void updatePizzamenu(PizzamenuDto dto)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			String sql="update pizzamenu set pname=?,price=?,content=?,photoname=? where num=?";

			try {
				pstmt=conn.prepareStatement(sql);
				//���ε�
				pstmt.setString(1, dto.getPname());
				pstmt.setString(2, dto.getPrice());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4, dto.getPhotoname());
				pstmt.setString(5, dto.getNum());
				//����
				pstmt.execute();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//����
		public void deletePizzamenu(String num)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			String sql="delete from pizzamenu where num=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
					//���ε�
				pstmt.setString(1, num);
	
				//����
				pstmt.execute();
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					db.dbClose(pstmt, conn);
				}
			}
		
		//���̵�޴����
			public ArrayList<SidemenuDto> getSideDatas(){
				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String sql="select * from sidemenu order by num desc";
				
				ArrayList<SidemenuDto> list=new ArrayList<SidemenuDto>();
				try {
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
					SidemenuDto dto=new SidemenuDto();
					dto.setNum(rs.getString("num"));
					dto.setSname(rs.getString("sname"));
					dto.setPrice(rs.getString("price"));
					dto.setPhotoname(rs.getString("photoname"));
					//list�� �߰�
					list.add(dto);
					}
				}catch(SQLException e) {
					e.printStackTrace();
				}finally {
					db.dbClose(rs, pstmt,conn);
				}
				return list;
			}
			
			//�����Ÿ�޴����
			public ArrayList<EtcmenuDto> getEtcDatas(){
				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String sql="select * from etcmenu order by num desc";
				
				ArrayList<EtcmenuDto> list=new ArrayList<EtcmenuDto>();
				try {
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
					EtcmenuDto dto=new EtcmenuDto();
					dto.setNum(rs.getString("num"));
					dto.setEname(rs.getString("ename"));
					dto.setPrice(rs.getString("price"));
					dto.setPhotoname(rs.getString("photoname"));
					//list�� �߰�
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

