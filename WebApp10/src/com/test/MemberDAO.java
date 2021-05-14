/*==================================
   MemberDAO.java
   - 데이터베이스 액션 처리 전용 객체 활용 
==================================*/

package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 데이터베이스 연결 → 생성자 형태로 정의
	public MemberDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터 입력 메소드
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
				+ " VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')"
				, dto.getName(), dto.getTel());
		
		Statement stmt = conn.createStatement();
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
	}
	
	// 리스트 전체 출력 메소드
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			
			result.add(dto);
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 인원 수 확인을 위한 메소드
	public int count() throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		stmt.close();

		return result;
	}
	
	// 데이터베이스 연결 종료 담당 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}
}
