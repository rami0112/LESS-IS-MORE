package rest.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rest.member.dao.MemberDao;
import rest.member.exception.NotFoundException;
import rest.member.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;

	public MemberVO selectMember(MemberVO memberVO) {
		MemberVO memberDB = memberDao.selectMember(memberVO);
		if (memberDB == null) {
			throw new NotFoundException();
		}
		return memberDB;
	}

	public int insertMember(MemberVO memberVO) {
		return memberDao.insertMember(memberVO);
	}
	
	public int updateMember(MemberVO memberVO) {
		return memberDao.updateMember(memberVO);
	}
	
	public int deleteMember(MemberVO memberVO) {
		return memberDao.deleteMember(memberVO);
	}
}
