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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import co.kids.prj.member.service.MemberService;
import co.kids.prj.member.service.MemberVO;
import co.kids.prj.sns.service.NaverLoginService;

@Controller
public class SNSController {
	@Autowired private NaverLoginService naverLoginService;
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
		
		String id = (String)response_obj.get("email");
		
		vo.setId(id);
		vo.setName((String)response_obj.get("nickname"));
		vo.setGender((String)response_obj.get("gender"));
		vo.setTel((String)response_obj.get("mobile"));

		MemberVO member = new MemberVO();
		//null이 나올수 있으므로 vo객체를 두개 만듦
		member = memberDao.memberSelect(vo);
		
		if(member == null) {
			//회원가입 안됨
			vo.setNaver("C");
			model.addAttribute("member", vo);
			return "member/snsJoinForm";
		}else if(member.getNaver() == null) {
			//연동안됨 + 다른 sns부분이 null이어야하므로 일부러 select해온  member을 안함
			System.out.println(vo.getGoogle());
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
	public String kakaoLogin() {
		StringBuffer loginUrl = new StringBuffer();
		loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
		loginUrl.append("52d162b606356f641b23619827039e8d");
		loginUrl.append("&redirect_uri=");
		loginUrl.append("http://localhost:80/prj/kakaoLogin.do");
		loginUrl.append("&response_type=code");
		return "redirect:"+loginUrl.toString();
	}
	
	@GetMapping("/kakaoLogin.do")
	public String kakaoLogin(@RequestParam String code, HttpSession session) {
		return null;
	}
	
}
