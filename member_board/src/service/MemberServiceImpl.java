package service;

import java.util.List;

import dao.MemberDao;
import vo.Member;

public class MemberServiceImpl implements MemberService{
	private MemberDao dao = new MemberDao();

	@Override
	public List<Member> getMembers() {
		return dao.getMembers();
	}

	@Override
	public boolean login(String id, String pwd) {
		return dao.login(id, pwd);
	}

	@Override
	public void join(Member member) {
		dao.join(member);
	}

	@Override
	public Member findBy(String id) {
		return dao.findBy(id);
	}
	
}
