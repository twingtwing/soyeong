package co.kids.prj.lodging.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LodgingController {
	
	@PostMapping("/quickBook.do")
	public String quickBook() {
		return "reservation/houseList";
	}
}
