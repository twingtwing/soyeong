package co.kids.prj;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kids.prj.sns.service.NaverLoginService;

@Controller
public class HomeController {
	@Autowired NaverLoginService naverLoginVO;
	
	@RequestMapping("/home.do")
	public String home(HttpSession session) {
		//naver api url
		String naverAuthUrl = naverLoginVO.getAuthorizationUrl(session);
		session.setAttribute("naverUrl", naverAuthUrl);
		return "home/main";
	}
	
}
