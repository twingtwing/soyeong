package co.kids.prj.member.web;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import co.kids.prj.member.service.MemberServiceImpl;
import co.kids.prj.member.service.MemberVO;

@Controller
public class MemberController {
	@Autowired private MemberServiceImpl memberDao;

	@Autowired private JavaMailSender mailSender;

	//회원가입폼 이동
	@GetMapping("joinForm.do")
	public String joinForm() {
		return "member/joinForm";
	}

	//중복 id 체크(비밀번호 찾기 id찾을때도 사용함)
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

	//비밀번호 찾기 페이지 이동
	@GetMapping("/findPw.do")
	public String findPw() {
		return "member/findPw";
	}

	//이메일 인증(비밀번호 찾기) -> 나중에 회원가입에도 이용하기
	@PostMapping("/emailVerify.do")
	@ResponseBody
	public int emailVerify(@Param("email") String email) {
		Random r = new Random();
		int num = r.nextInt(999999);

		String fromEamil = "soyoungbnb@gmail.com";
		String toEamil = email;//comma넣으면 여러개 가능함

		String subject ="[알림] 비밀번호변경 인증 이메일 입니다";
		String content ="<h3>[비밀번호 변경 인증 번호]</h3>\n<p>인증번호 : "+num+"</p>";

		MimeMessage mail = mailSender.createMimeMessage();
		MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
		
		try {
			mailHelper.setFrom(fromEamil);
			mailHelper.setTo(toEamil);
			mailHelper.setSubject(subject);
			mailHelper.setText(content,true);//true는 html을 사용한다는 의미 -> img도 보낼수 있음
			
			mailSender.send(mail);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return num;
	}
	
	//새 비밀번호 페이지 이동
	@PostMapping("/newPw.do")
	public String newPw(@Param("id") String id,Model model) {
		model.addAttribute("newId", id);
		return "member/newPw";
	}
	
	//새 비밀번호 처리
	@PostMapping("/changePw.do")
	public String changePw(MemberVO vo) {
		String result ="N";
		return result;
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
		//session name값 변경하기
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

	//비밀번호 확인 처리(탈퇴 전, host신청)
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

	//호스트 신청 페이지 이동
	@GetMapping("/memberAuthor.do")
	public String memberAuthor() {
		return "member/memberAuthor";
	}

	//호스트 신청 처리
	@PostMapping("/memberHostUpdate.do")
	@ResponseBody
	public String memberAuthorUpdate(MemberVO vo,HttpSession session) {
		String result = "N";
		vo.setId((String)session.getAttribute("id"));
		vo.setAuthor("HOST");
		int r = memberDao.memberAuthorUpdate(vo);
		if(r>0) {
			result = "Y";
			session.setAttribute("author", "HOST");
		}
		return result;
	}

	//host 상세페이지
	@GetMapping("/memberSales.do")
	public String memberSales() {
		//??
		return "member/memberSales";
	}

}
