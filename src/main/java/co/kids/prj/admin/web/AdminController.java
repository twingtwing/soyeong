package co.kids.prj.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminController {
	@RequestMapping("/admin.do")
	public String admin() {
		return "admin/testmain/main";
	}

	@RequestMapping("/whitepage.do")
	public String whitepage() {
		return "admin/testmain/whitepage";
	}
	
	@RequestMapping("/adminMemberList.do")
	public String adminMemberList() {
		return "admin/testmain/memberList";
	}
}
