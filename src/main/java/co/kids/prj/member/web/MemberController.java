package co.kids.prj.member.web;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import co.kids.prj.member.service.MemberServiceImpl;
import co.kids.prj.member.service.MemberVO;

@Controller
public class MemberController {
	@Autowired
	MemberServiceImpl memberDao;

	//회원가입폼 이동
	@GetMapping("joinForm.do")
	public String joinForm() {
		return "member/joinForm";
	}

	//중복 id 체크
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

	//회원가입 처리
	@PostMapping("/join.do")
	public String join(MemberVO vo, HttpSession session) {
		vo.getGender();
		memberDao.memberInsert(vo);
		session.setAttribute("id", vo.getId());
		session.setAttribute("author", vo.getAuthor());
		session.setAttribute("name", vo.getName());
		return "redirect:home.do";
	}

	//회원정보 수정페이지 이동
	@GetMapping("/memberUpdateForm.do")
	public String memberUpdateForm() {
		return "member/memberUpdateForm";
	}

	//회원정보 수정 처리
	@PostMapping("/memberUpdate.do")
	public String memberUpdate(MemberVO vo) {
		memberDao.memberUpdate(vo);
		return "redirect:home.do";
	}

	//로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home.do";
	}
	
	//로그인
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
	
	//회원탈퇴 페이지 이동
	@GetMapping("/memberDelete.do")
	public String memberDelete() {
		return "member/memberDelete";
	}
	
	//탈퇴전 비밀번호 확인 처리
	@PostMapping("/pwCheck.do")
	@ResponseBody
	public String pwCheck(MemberVO vo,HttpSession session) {
		String result = "N";
		vo.setId((String)session.getAttribute("id"));
		vo = memberDao.memberSelect(vo);
		if(vo != null) {result = "Y";}
		return result;
	}
	
	//회원탈퇴
	@PostMapping("/memberWithdraw.do")
	@ResponseBody
	public String memberWithdraw(MemberVO vo,HttpSession session) {
		String result = "N";
		vo.setId((String)session.getAttribute("id"));
		int r = memberDao.memberDelete(vo);
		if(r>0) {
			session.invalidate();
			result = "Y";
		};
		return result;
	}
	
	@GetMapping("/detailVisit.do")
	public String detailVisit() {
		return "member/detailVisit";
	}
	
	//비밀번호 찾기
	@GetMapping("/findPasswordForm.do")
	public String findPasswordForm() {
		return "member/findPasswordForm";
	}
	
	//멤버 상세 페이지 이동하기
	@GetMapping("/memberProfile.do")
	public String memberProfile(Model model, MemberVO vo,HttpSession session) {
		vo.setId((String)session.getAttribute("id"));
		model.addAttribute("member", memberDao.memberSelect(vo) );
		return "member/memberProfile";
	}
	
	//host 상세페이지
	@GetMapping("/memberSales.do")
	public String memberSales() {
		//??
		return "member/memberSales";
	}

}
