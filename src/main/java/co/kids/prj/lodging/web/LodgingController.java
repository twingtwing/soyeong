package co.kids.prj.lodging.web;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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
			response.getWriter().write(gson.toJson(lodgingDao.LodgingListByTag(vo)));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
