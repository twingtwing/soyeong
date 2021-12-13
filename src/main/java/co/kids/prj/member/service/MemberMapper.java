package co.kids.prj.member.service;

import java.util.List;

public interface MemberMapper {
	List<MemberVO> memberSelectList();
	MemberVO memberSelect(MemberVO vo);
	int memberInsert(MemberVO vo);
	int memberUpdate(MemberVO vo);
	int memberAuthorUpdate(MemberVO vo);
	int memberDelete(MemberVO vo); // 비밀번호 확인 필요
}
