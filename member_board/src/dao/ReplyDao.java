package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBConn;
import vo.Member;
import vo.Reply;

public class ReplyDao {

//	CRUD
	public void insert(Reply reply) {
		Connection conn = DBConn.getConnection();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"INSERT INTO TBL_REPLY(RNO, TITLE, CONTENT, ID, BNO) VALUES (SEQ_REPLY.NEXTVAL, ?, ?, ?, ?)");
			int idx = 1;
			pstmt.setString(idx++, reply.getTitle());
			pstmt.setString(idx++, reply.getContent());
			pstmt.setString(idx++, reply.getId());
			pstmt.setLong(idx++, reply.getBno());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Reply> list(Long bno) {
		Connection conn = DBConn.getConnection();
		List<Reply> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"SELECT RNO, TITLE, CONTENT, TO_CHAR(REGDATE, 'YY/MM/DD') AS REGDATE,\r\n" + 
					"ID, BNO FROM TBL_REPLY WHERE RNO > 0 AND BNO = ?");
			pstmt.setLong(1, bno);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int idx = 1;
				Long rno = rs.getLong(idx++);
				String title = rs.getString(idx++);
				String content = rs.getString(idx++);
				String regDate = rs.getString(idx++);
				String id = rs.getString(idx++);
				
				Reply reply = new Reply(rno, title, content, regDate, id, bno);
				list.add(reply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
//	public Reply read(Long bno) {
//		Connection conn = DBConn.getConnection();
//		Reply reply = null;
//		try {
//			PreparedStatement pstmt = conn.prepareStatement("SELECT BNO, TITLE, CONTENT, REGDATE, ID, CATEGORY FROM TBL_BOARD WHERE BNO = ?");
//			pstmt.setLong(1, bno);
//			ResultSet rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				int idx = 1;
//				board = new Board(
//						rs.getLong(idx++),
//						rs.getString(idx++),
//						rs.getString(idx++),
//						rs.getDate(idx++),
//						rs.getString(idx++),
//						rs.getLong(idx++),
//						null
//				);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return board;
//	}

	public void delete(Long rno) {
		Connection conn = DBConn.getConnection();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"DELETE TBL_REPLY WHERE RNO = ?");
			pstmt.setLong(1, rno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Reply select(Long rno) {
		Connection conn = DBConn.getConnection();
		Reply reply = null;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(
					"SELECT TITLE, CONTENT, TO_CHAR(REGDATE, 'YY/MM/DD') AS REGDATE,\r\n" + 
					"ID, BNO FROM TBL_REPLY WHERE RNO = ?");
			pstmt.setLong(1, rno);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int idx = 1;
				String title = rs.getString(idx++);
				String content = rs.getString(idx++);
				String regDate = rs.getString(idx++);
				String id = rs.getString(idx++);
				Long bno = rs.getLong(idx++);
				
				reply = new Reply(rno, title, content, regDate, id, bno);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reply;
	}
	
	public static void main(String[] args) {
		ReplyDao dao = new ReplyDao();
		List<Reply> list = dao.list(188416L);
		for(Reply r : list) {
			System.out.println(r);
		}
	}
	
}
