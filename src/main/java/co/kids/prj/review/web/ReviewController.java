package co.kids.prj.review.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kids.prj.lodging.service.LodgingServiceImpl;
import co.kids.prj.lodging.service.LodgingVO;
import co.kids.prj.reservation.service.ReservLodVO;
import co.kids.prj.reservation.service.ReservationImpl;
import co.kids.prj.review.service.ReviewServiceImpl;
import co.kids.prj.review.service.ReviewVO;


@Controller
public class ReviewController {
	@Autowired ReviewServiceImpl rvDao;
	@Autowired ReservationImpl rservDao;
	@Autowired LodgingServiceImpl lodgingDao;

	@GetMapping("/reviewForm.do")
	public String reviewForm(Model model,ReservLodVO vo) {
		model.addAttribute("reservInfo",rservDao.reservLodgSelect(vo));
		return "review/reviewForm";
	}
	
	@PostMapping("/reviewInsert.do")
	public String reviewInsert(ReviewVO vo, Model model) {
		rvDao.reviewInsert(vo);
		LodgingVO lodgingVO = new LodgingVO();
		lodgingVO.setRno(vo.getRno());	
		model.addAttribute("hotelDetail", lodgingDao.LodgingSelect(lodgingVO));
		model.addAttribute("reviews",rvDao.reviewSelectList(vo.getRno()));
		return "reservation/detailedInfo";
	}
	
	@GetMapping("/reviewCheckdup.do")
	@ResponseBody
	public String reviewCheckdup(ReviewVO vo) {
		if(rvDao.reviewCheckDup(vo)==null) {
			return "ok";
		} else {
			return "ng";
		}
	}

}
