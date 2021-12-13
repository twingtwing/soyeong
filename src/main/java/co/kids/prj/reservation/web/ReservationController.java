package co.kids.prj.reservation.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {

	@RequestMapping("myReserv.do")
	public String myReserv() {
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

	
}
