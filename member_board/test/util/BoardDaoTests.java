package util;

import java.util.List;

import dao.BoardDao;
import vo.Board;
import vo.Criteria;

public class BoardDaoTests {

	BoardDao dao = new BoardDao();

	public static void main(String[] args) {
		BoardDaoTests tests = new BoardDaoTests();
		
		tests.testRead();
		tests.testList();
	}
	
	public void testRead() {
		Board board = dao.read(4L);
		System.out.println(board);
	}
	
	public void testList() {
		dao.list(new Criteria(2, 10)).forEach(System.out::println);
	}
	
}
