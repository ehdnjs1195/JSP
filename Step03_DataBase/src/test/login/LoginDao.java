package test.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.util.DbcpBean;

public class LoginDao {
	private static LoginDao dao;
	private LoginDao() {}
	public static LoginDao getInstance() {
		if(dao==null) {
			dao=new LoginDao();
		}
		return dao;
	}
	public LoginDto getData(String id) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		LoginDto dto=null;
		try {
			conn=new DbcpBean().getConn();
			String sql="select id, password, nickname"
					+ " from login"
					+ " where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto=new LoginDto();
				dto.setId(id);
				dto.setPwd(rs.getString("password"));
				dto.setNick(rs.getString("nickname"));
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
		return dto;
	}
}
