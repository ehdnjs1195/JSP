package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

//Dao는 하나만 만들 예정
// 이유: Dao는 객체 하나당 Connection 하나를 생성하는데 connection의 객체가 유한하기 때문이다. =>getInstance를 통해 만들어진 객체를 가져가 사용하도록 한다.
public class MemberDao {
	//1. 자신의 참조값을 담을 static 필드
	private static MemberDao dao;
	//2. 외부에서 객체 생성할 수 없도록 생성자의 접근 지정자를 private 로 
	private MemberDao() {}
	//3. 자신의 참조값을 리턴해주는 공개(public) static 메소드
	public static MemberDao getInstance() {
		//최초 호출될때는 dao 필드는 null 이다.
		if(dao==null) {
			dao=new MemberDao(); //객체 생성해서 static 참조값을 필드에 저장 (최초 한 번 호출되었을 때 객체를 생성하고 그 이후로는 이미 만들어진 객체를 사용하도록 한다.)
		}
		return dao; //static 필드에 있는 참조값 리턴해주기
	}
	
	//회원 전체 목록을 리턴하는 메소드
	public List<MemberDto> getList(){
		//회원목록을 담을 객체 생성
		List<MemberDto> list=new ArrayList<>();
		//필요한 객체를 담을 지역변수 만들기
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체 가져오기. (connection 객체 하나를 connection pool에서 갖고온다 생각하면 된다.)
			conn=new DbcpBean().getConn();	
			String sql="select num,name,addr from member"
					+ " order by num desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberDto dto=new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();	//connection pool에 객체 반납하기.  close() 메소드를 호출하면 자동반납된다.
			}catch(Exception e) {}
		}
		return list;
	}
	//회원 한 명의 정보 추가
	public boolean insert(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into member"
					+ " (num, name, addr)"
					+ " values(member_seq.nextval, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			//?에 값 바인딩하기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	//회원 한 명의 정보 수정
	public boolean update(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update member"
					+ " set name=?, addr=?"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) { //성공
			return true;
		} else { //실패
			return false;
		}
	}
	//회원 한 명의 정보 삭제
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "delete from member"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) { //성공
			return true;
		} else { //실패
			return false;
		}
	}
	//회원 한 명의 정보 리턴
	public MemberDto getData(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//리턴해줄 data
		MemberDto dto=null;
		try {
			conn=new DbcpBean().getConn();
			String sql="select name, addr"
					+ " from member"
					+ " where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto=new MemberDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		// MemberDto 객체 리턴해 주기
		return dto;
	}
}




