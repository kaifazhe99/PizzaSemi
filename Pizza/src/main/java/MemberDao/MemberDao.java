package MemberDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import MemberDto.MemberDto;
import mysql.db.DbConnect;

public class MemberDao {
	DbConnect db=new DbConnect();
	
	//���̵� üũ
	public boolean isIdCheck(String id)
	{
		boolean isid=false;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from pimember where id=?";

		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, id);
			//����
			rs=pstmt.executeQuery();
			if(rs.next())//�ش���̵� ������ ��� true
				isid=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return isid;
	}

	//���̵� ���� �̸� ��ȯ
	public String getName(String id)
	{
		String name="";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from pimember where id=?";

		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, id);
			//����
			rs=pstmt.executeQuery();
			if(rs.next())
				name=rs.getString("name");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return name;
	}
	
	public String getMemberNum(String id)
	{
		String num="";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from pimember where id=?";

		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, id);
			//����
			rs=pstmt.executeQuery();
			if(rs.next())
				num=rs.getString("num");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return num;
	}
	
	//insert
	public void insertMember(MemberDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="insert into pimember (name,id,pass,hp,addr,email,gaipday) values (?,?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getAddr());
			pstmt.setString(6, dto.getEmail());
			//����
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//ȸ�� ���
	public List<MemberDto> getAllMembers()
	{
		List<MemberDto> list=new ArrayList<MemberDto>();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from pimember order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				MemberDto dto=new MemberDto();
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setHp(rs.getString("hp"));
				dto.setAddr(rs.getString("addr"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
				dto.setEmail(rs.getString("email"));
				dto.setPass(rs.getString("pass"));
				
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
	
	//ȸ�� dto ��ȯ
	public MemberDto getMember(String num)
	{
		MemberDto dto=new MemberDto();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from pimember where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setHp(rs.getString("hp"));
				dto.setAddr(rs.getString("addr"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
				dto.setEmail(rs.getString("email"));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	//��й�ȣ üũ
	public boolean isPassEqual(String num,String pass)
	{
		boolean b=false;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from pimember where num=? and pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				b=true;				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return b;
	}
	
	
	//����
	public void deleteMember(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="delete from pimember where num=?";
		
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
	
	//����
	public void updateMember(MemberDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="update pimember set name=?,hp=?,addr=?,email=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getHp());
			pstmt.setString(3, dto.getAddr());
			pstmt.setString(4, dto.getNum());
			//����
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//���̵�� ��й�ȣ üũ
	public boolean isIdPass(String id,String pass)
	{
		boolean b=false;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from pimember where id=? and pass=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				b=true;				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return b;
	}
	
	
}




















