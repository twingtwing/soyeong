package co.kids.prj;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kids.prj.lodging.service.LodgingServiceImpl;
import co.kids.prj.lodging.service.LodgingVO;
import co.kids.prj.sns.service.NaverLoginService;

@Controller
public class HomeController {
	@Autowired private NaverLoginService naverLoginVO;
	@Autowired private LodgingServiceImpl lodgingDao;
	
	@RequestMapping("/home.do")
	public String home(HttpSession session,Model model,LodgingVO vo) {
		//naver api url
		String naverAuthUrl = naverLoginVO.getAuthorizationUrl(session);
		session.setAttribute("naverUrl", naverAuthUrl);
		
		//숙소 리스트
		vo.setSearchKey("");
		vo.setRcategory("A");
		vo.setRguest(0);
		vo.setRuse("Y");
		List<LodgingVO> list = lodgingDao.LodgingSelectList(vo);
		if(list.size() < 8) {
			model.addAttribute("list", list);
		}else {
			for (int i = list.size()-1; i > 7; i--) {
				list.remove(i);
			}
			model.addAttribute("list", list);
		}
		return "home/main";
	}
	
}
