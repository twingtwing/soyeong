package co.kids.prj.lodging.web;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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


	@PostMapping("/hotelSort.do")
	@ResponseBody
	public void hotelSort(LodgingVO vo, HttpServletResponse response) {
		Gson gson = new GsonBuilder().create();
		try {
			response.getWriter().write(gson.toJson(lodgingDao.LodgingSelectList(vo)));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("hostInsertForm.do")
	public String hostInsertForm() {
		return "host/hostInsertForm";
	}

	@PostMapping("/houseList.do")
	public String houseList(LodgingVO vo, Model model) {
		model.addAttribute("lists",lodgingDao.LodgingSelectList(vo));
		return "reservation/houseList";
	}
	
	@RequestMapping("/detailedInfo.do")
	public String detailedInfo(LodgingVO vo, Model model) {
		vo = lodgingDao.LodgingSelect(vo);
		model.addAttribute("hotelDetail", vo);
		return "reservation/detailedInfo";
	}
	

}
