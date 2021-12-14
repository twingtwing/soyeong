package co.kids.prj.reservation.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.velocity.runtime.directive.Parse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kids.prj.reservation.service.ReservationService;
import co.kids.prj.reservation.service.ReservationVO;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService rDao;
	
	@RequestMapping("myReserv.do")
	public String myReserv(HttpServletRequest request, HttpSession session, ReservationVO vo) {
		session = request.getSession();
		vo.setId((String) session.getAttribute("id"));
		request.setAttribute("cards",  rDao.reservSelectList(vo));
		return "reservation/myReservation";
	}

	@RequestMapping("detailedInfo.do")
	public String detailedInfo() {
		return "reservation/detailedInfo";
	}

	@RequestMapping("houseList.do")
	public String houseList() {
		return "reservation/houseList";
	}

	@RequestMapping("hostManage.do")
	public String hostManage() {
		return "host/hostManage";
	}
	
	@RequestMapping("simpleInfo.do")
	public void simpleInfo(HttpServletRequest request, ReservationVO vo) {
		System.out.println("----");
		vo.setBookno(Integer.parseInt(request.getParameter("bookno")));
		request.setAttribute("thisBook", rDao.reservSelect(vo));
	}
	

	
	@GetMapping("/booking.do")
	public String booking() {
		return "reservation/booking";
	}


	
}
