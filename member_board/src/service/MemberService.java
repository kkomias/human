package service;

import java.util.List;

import vo.Member;

public interface MemberService {
//	할 일
	
	
//	회원가입
	void join(Member member);

//	로그인

//	id/pw 찾기

//	로그아웃

//	회원정보수정

//	탈퇴
	

//	회원 목록 조회
	List<Member> getMembers();

	boolean login(String id, String pwd);

	Member findBy(String id);
	
}
