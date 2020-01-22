package test.cafe.comment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.comment.dto.CommentDto;
import test.util.DbcpBean;

public class CommentDao {
	private static CommentDao dao;
	private CommentDao() {}
	public static CommentDao getInstance() {
		if(dao==null) {
			dao=new CommentDao();
		}
		return dao;
	}
	public boolean insert(CommentDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into board_cafe_comment"
					+ " (num, writer, content, regdate, ip,writeNum)"
					+ " values(board_cafe_comment_seq.nextval, ?, ?, sysdate, ?,?)";
			pstmt = conn.prepareStatement(sql);
			//?에 값 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getIp());
			pstmt.setInt(4, dto.getWriteNum());
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
	
	public List<CommentDto> getList(CommentDto dto){
		List<CommentDto> list=new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "select num, writer, content, to_char(regdate, 'yy\"년\"mm\"월\"dd\"일\" hh24\"시\"mi\"분\"') as regdate, ip, writeNum, rownum as rnum"
					+ " from board_cafe_comment"
					+ " where writeNum=?"
					+ " order by num asc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getWriteNum());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommentDto tmp=new CommentDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setContent(rs.getString("content"));
				tmp.setRegdate(rs.getString("regdate"));
				tmp.setIp(rs.getString("ip"));
				tmp.setWriteNum(rs.getInt("writeNum"));
				tmp.setRnum(rs.getInt("rnum"));
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
