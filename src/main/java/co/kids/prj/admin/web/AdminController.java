package co.kids.prj.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminController {
	@RequestMapping("/admin.do")
	public String admin() {
		return "admin/adminmain/main";
	}

	
	@RequestMapping("/adminMemberList.do")
	public String adminMemberList() {
		return "admin/adminmain/memberList";
	}
}
