package co.kids.prj.reservation.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import co.kids.prj.reservation.service.ReservationImpl;

import co.kids.prj.lodging.service.LodgingServiceImpl;
import co.kids.prj.lodging.service.LodgingVO;

import co.kids.prj.reservation.service.ReservationVO;

@Controller
public class ReservationController {
	@Autowired 
	private LodgingServiceImpl lodgingDao;
	@Autowired
	private ReservationImpl rDao;
	
	@RequestMapping("myReserv.do")
	public String myReserv(HttpServletRequest request, HttpSession session, ReservationVO vo) {
		session = request.getSession();
		vo.setId((String) session.getAttribute("id"));
		request.setAttribute("cards",  rDao.reservSelectList(vo));
		return "reservation/myReservation";
	}

//	@RequestMapping("detailedInfo.do")
//	public String detailedInfo() {
//		return "reservation/detailedInfo";
//	}
	
	@RequestMapping("simpleInfo.do")
	public void simpleInfo(HttpServletRequest request, ReservationVO vo) {
		System.out.println("----");
		vo.setBookno(Integer.parseInt(request.getParameter("bookno")));
		request.setAttribute("thisBook", rDao.reservSelect(vo));
	}
	

	@GetMapping("/bookingForm.do")
	public String booking(HttpServletRequest request,Model model) {
		LodgingVO lodgingVO = new LodgingVO();
		int day = Integer.parseInt(request.getParameter("day"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		lodgingVO.setRno(rno);
		lodgingVO = lodgingDao.LodgingSelect(lodgingVO);
		model.addAttribute("hotel", lodgingVO);
		int fee = lodgingVO.getFee();
		model.addAttribute("price",fee*day);
		model.addAttribute("serviceFee", (int)(fee*0.1));
		model.addAttribute("serviceTax",(int)(fee*0.01));
		model.addAttribute("total", (int)(fee*day+fee*0.1+fee*0.01));
		model.addAttribute("rcheckin",request.getParameter("rcheckin"));
		model.addAttribute("rcheckout",request.getParameter("rcheckout"));
		model.addAttribute("bookkid",request.getParameter("bookkid"));
		model.addAttribute("bookadult",request.getParameter("bookadult"));
		return "reservation/bookingForm";
	}

	@PostMapping("/booking.do")
	public String booking(ReservationVO vo) {
		rDao.reservInsert(vo);
		return "redirect:home.do"; // 예약하고 마이페이지로 가면되나?
	}
	
}
