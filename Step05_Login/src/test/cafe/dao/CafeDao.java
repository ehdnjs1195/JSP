package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {	//싱글톤
	private static CafeDao dao;
	
	private CafeDao() {}
	
	public static CafeDao getInstance() {
		if(dao==null) {
			dao=new CafeDao();
		}
		return dao;
	}
	//글 전체의 갯수를 리턴하는 메소드
	public int getCount() {
		int rowCount=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "select MAX(ROWNUM) as count"	//rownum중에 가장 큰것.(글의 개수)
					+ " from board_cafe";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 
			rs = pstmt.executeQuery();
			while (rs.next()) {
				rowCount=rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				//connection pool 에 반납하기 
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return rowCount;
	}
	
	//새글을 저장하는 메소드
	public boolean insert(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into board_cafe"
					+ " (num, writer, title, content, viewCount, regdate)"
					+ " values(board_cafe_seq.nextval, ?, ?, ?,0,sysdate)";		//viewCount는 insert할 때 넣지 않으면 default 값으로 0이 들어간다.
			pstmt = conn.prepareStatement(sql);
			//?에 값 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
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
	
	//글 목록을 리턴하는 메소드   	(ctrl + shift + o : auto import)
	public List<CafeDto> getList(CafeDto dto){
		List<CafeDto> list=new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql="SELECT * " + 
					" FROM" + 
					" (SELECT result1.*, ROWNUM AS rnum" + 
					" FROM" + 
					" (SELECT num,writer,title,viewCount,regdate" + 
					" FROM board_cafe" + 
					" ORDER BY num DESC) result1)" + 
					" WHERE rnum BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				//select 된 row 의 정보를 CafeDto 객체에 담아서
				CafeDto tmp=new CafeDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
				//ArrayList 객체에 누적시킨다.
				list.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				//connection pool 에 반납하기 
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
}
