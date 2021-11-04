package service;

import java.util.List;

import dao.ReplyDao;
import vo.Reply;

public class ReplyServiceImpl implements ReplyService{

	private ReplyDao dao = new ReplyDao();
	
	@Override
	public void write(Reply reply) {
		dao.insert(reply);
	}
	
	@Override
	public List<Reply> list(Long bno) {
		return dao.list(bno);
	}
	
	@Override
	public Reply get(Long rno) {
		return dao.select(rno);
	}
	
//	@Override
//	public Board read(Long bno) {
//		Board board = dao.read(bno);
//		board.setAttaches(dao.readAttach(bno));
//		return board;
//	}
//	
	@Override
	public void remove(Long rno) {
		dao.delete(rno);
	}

}
