package service;

import java.util.List;

import vo.Reply;

public interface ReplyService {

//	댓글쓰기
	void write(Reply reply);
//	목록조회
	List<Reply> list(Long bno);
//	댓글조회
//	Reply read(Long bno);
//	단일조회
	Reply get(Long rno);
//	글삭제
	void remove(Long rno);
	
}
