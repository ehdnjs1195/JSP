package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	private static FileDao dao;
	private FileDao() {}
	public static FileDao getInstance() {
		if(dao==null) {
			dao=new FileDao();
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
						+ " from board_file";
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
	
	//파일 정보를 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "delete from board_file"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			//?에 값 바인딩하기
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
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	//파일 다운로드 횟수를 증가시키는 메소드
	public boolean addDownCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update board_file"
					+ " set downCount = downCount+1"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			//?에 값 바인딩하기
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
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//인자로 전달되는 파일번호에 해당하는 파일 정보를 리턴해주는 메소드
	public FileDto getData(int num) {
		FileDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "select writer, title, saveFileName, orgFileName, fileSize, downCount, to_char(regdate, 'yyyy\"년\"mm\"월\"dd\"일\" hh24\"시\"mi\"분\"') as regdate"
					+ " from board_file"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto=new FileDto();
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
				dto.setDownCount(rs.getInt("downCount"));
				dto.setRegdate(rs.getString("regdate"));
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
		return dto;
	}
	
	//업로드된 파일의 정보를 DB에 저장하는 메소드
	public boolean insert(FileDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "insert into board_file"
					+ " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
					+ " values(board_file_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			//?에 값 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5, dto.getFileSize());
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
	
	//파일 목록을 리턴하는 메소드
	public List<FileDto> getList(FileDto dto){
		List<FileDto> list=new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "select * from"
					+ " (select result1.*, rownum as rnum from "
					+ " (select num,writer,title,orgFileName,fileSize,downCount,to_char(regdate, 'yyyy\"년\"mm\"월\"dd\"일\" hh24\"시\"mi\"분\"') as regdate"
					+ " from board_file"
					+ " order by num desc) result1)"
					+ " where rnum between ? and ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				FileDto tmp=new FileDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setOrgFileName(rs.getString("orgFileName"));
				tmp.setFileSize(rs.getLong("fileSize"));
				tmp.setDownCount(rs.getInt("downCount"));
				tmp.setRegdate(rs.getString("regdate"));
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
