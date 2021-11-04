package service;

import java.util.List;

import dao.BoardDao;
import vo.Attach;
import vo.Board;
import vo.Criteria;

public class BoardServiceImpl implements BoardService{

	private BoardDao dao = new BoardDao();
	@Override
	public Long write(Board board) {
//		글 작성 > 글 번호 반환
		Long bno = dao.insert(board);
		
//		각 첨부파일에 글 번호 부여
		for(Attach attach : board.getAttaches()) {
			attach.setBno(bno);
//			첨부파일 작성
			dao.writeAttach(attach);
		}
		
		
		return bno;
	}
	
	@Override
	public Board read(Long bno) {
		Board board = dao.read(bno);
		board.setAttaches(dao.readAttach(bno));
		return board;
	}
	
	public String findOriginBy(String uuid) {
		return dao.findOriginBy(uuid);
	}
	
	@Override
	public int getCount(Criteria cri) {
		return dao.getCount(cri);
	}
	
	@Override
	public List<Board> list() {
		return dao.list();
	}
	
	@Override
	public List<Board> list(Criteria cri) {
		List<Board> list = dao.list(cri);
		list.forEach(b -> b.setAttaches(dao.readAttach(b.getBno())));
		return list; 
	}

	@Override
	public void modify(Board board) {
		dao.update(board);
	}

	@Override
	public void remove(Long bno) {
		dao.delete(bno);
	}

	@Override
	public List<Attach> readAttachByPath(String path) {
		return dao.readAttachByPath(path);
	}

}
