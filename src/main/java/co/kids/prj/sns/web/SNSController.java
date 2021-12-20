package co.kids.prj.sns.web;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import co.kids.prj.member.service.MemberService;
import co.kids.prj.member.service.MemberVO;
import co.kids.prj.sns.service.KakaoLoginService;
import co.kids.prj.sns.service.NaverLoginService;

@Controller
public class SNSController {
	@Autowired private NaverLoginService naverLoginService;
	@Autowired private KakaoLoginService kakaoLoginService;
	
	@Autowired private MemberService memberDao;

	@RequestMapping(value ="/naverLogin.do",method = { RequestMethod.GET, RequestMethod.POST })
	public String naverLogin(Model model, MemberVO vo ,@RequestParam Map<String, Object> paramMap, @RequestParam String code, 
			@RequestParam String state, HttpSession session) throws IOException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginService.getAccessToken(session, code, state);
		
		//로그인 사용정보
		String apiResult = naverLoginService.getUserProfile(oauthToken);
		
		//json
		JSONParser parser = new JSONParser();
		Object obj = null;
		
		try {
			obj = parser.parse(apiResult);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		JSONObject jsonObj = (JSONObject) obj;
		
		//파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		
		//id,name,gender,tel 정보를 가져옴
		String id = (String)response_obj.get("email");
		vo.setId(id);
		vo.setName((String)response_obj.get("nickname"));
		vo.setGender((String)response_obj.get("gender"));
		vo.setTel((String)response_obj.get("mobile"));

		//null이 나올수 있으므로 vo객체를 두개 만듦
		MemberVO member = memberDao.memberSelect(vo);
		
		if(member == null) {
			//회원가입 안됨
			vo.setNaver("C");
			model.addAttribute("member", vo);
			return "member/snsJoinForm";
		}else if(member.getNaver() == null) {
			//연동안됨 + 다른 sns부분이 null이어야하므로 일부러 select해온  member을 안함
			vo.setNaver("Y");
			memberDao.joinSNS(vo);
		}
		
		//회원가입 과 연동 모두 되어 있음
		session.setAttribute("id", member.getId());
		session.setAttribute("author", member.getAuthor());
		session.setAttribute("name", member.getName());
		
		return "redirect:home.do";
	}
	
	@RequestMapping(value ="/ajaxKakao.do",method = { RequestMethod.GET, RequestMethod.POST })
	public String ajaxKakao() {
		StringBuffer loginUrl = new StringBuffer();
		loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
		loginUrl.append("0bc9a42bdb4d7b26534db62b84cc84ed");
		loginUrl.append("&redirect_uri=");
		loginUrl.append("http://localhost:80/prj/kakaoLogin.do");
		loginUrl.append("&response_type=code");
		return "redirect:"+loginUrl.toString();
	}
	
	@GetMapping("/kakaoLogin.do")
	public String kakaoLogin(Model model,MemberVO vo,@RequestParam String code, HttpSession session) {
		System.out.println(code);
		
		String access_token = kakaoLoginService.getAccessToken(code);
		
		//id,name,gender
		Map<String, Object> result = kakaoLoginService.getUserInfo(access_token);
		
		vo.setId((String)result.get("id"));
		vo.setName((String)result.get("name"));
		vo.setGender(((String)result.get("gender")).substring(0,1).toUpperCase());
		
		//로그아웃 처리 시 필요
		session.setAttribute("access_token", access_token);
		
		//로그인 및 회원가입 처리
		MemberVO member = memberDao.memberSelect(vo);
		
		if(member == null) {
			vo.setKakao("C");
			model.addAttribute("member", vo);
			return "member/snsJoinForm";
		}else if(member.getKakao() == null) {
			vo.setKakao("Y");
			memberDao.joinSNS(vo);
		}
		
		//회원가입 과 연동 모두 되어 있음
		session.setAttribute("id", member.getId());
		session.setAttribute("name", member.getName());
		session.setAttribute("author", member.getAuthor());
		
		return "redirect:home.do";
	}
	
}
