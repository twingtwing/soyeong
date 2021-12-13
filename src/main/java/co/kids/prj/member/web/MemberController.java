package co.kids.prj.member.web;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import co.kids.prj.member.service.MemberServiceImpl;
import co.kids.prj.member.service.MemberVO;

@Controller
public class MemberController {
	@Autowired
	MemberServiceImpl memberDao;

	@GetMapping("joinForm.do")
	public String joinForm() {
		return "member/joinForm";
	}

	@ResponseBody
	@GetMapping("/idChk.do")
	public String idChk(@Param(value = "id") String id, MemberVO vo) {
		vo.setId(id);
		if (memberDao.memberSelect(vo) == null) {
			return "ok";
		} else {
			return "ng";
		}
	}

	@PostMapping("/join.do")
	public String join(MemberVO vo, HttpSession session) {
		vo.getGender();
		memberDao.memberInsert(vo);
		session.setAttribute("id", vo.getId());
		session.setAttribute("author", vo.getAuthor());
		session.setAttribute("name", vo.getName());
		return "redirect:home.do";
	}

	@GetMapping("/memberUpdateForm.do")
	public String memberUpdateForm() {
		return "member/memberUpdateForm";
	}

	@PostMapping("/memberUpdate.do")
	public String memberUpdate(MemberVO vo) {
		memberDao.memberUpdate(vo);
		return "redirect:home.do";
	}

	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home.do";
	}
	
	@ResponseBody
	@PostMapping("/login.do")
	public String login(MemberVO vo, HttpSession session) {
		vo = memberDao.memberSelect(vo);
		if (vo == null) {
			return "ng";
		} else {
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("author", vo.getAuthor());
			return "ok";
		}
	}
	
	@GetMapping("/detailVisit.do")
	public String detailVisit() {
		return "member/detailVisit";
	}
	
	@GetMapping("/findPasswordForm.do")
	public String findPasswordForm() {
		return "member/findPasswordForm";
	}
	
	//멤버 프로필
	@GetMapping("/memberProfile.do")
	public String memberProfile() {
		//멤버 프로필 + host권한 가지고 와야함
		return "member/memberProfile";
	}
	
	@GetMapping("/memberSales.do")
	public String memberSales() {
		//멤버 프로필 + host권한 가지고 와야함
		return "member/memberSales";
	}

}
