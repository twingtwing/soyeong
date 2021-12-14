package co.kids.prj.lodging.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kids.prj.lodging.service.LodgingServiceImpl;
import co.kids.prj.lodging.service.LodgingVO;

@Controller
public class LodgingController {
	@Autowired
	LodgingServiceImpl lodgingDao;
	
	@PostMapping("/quickBook.do")
	public String quickBook(LodgingVO vo, Model model) {
		model.addAttribute("lists", lodgingDao.LodgingSelectList(vo));
		return "reservation/houseList";
	}
	@RequestMapping("hostInsertForm.do")
	public String hostInsertForm() {
		return "host/hostInsertForm";
	}
}
