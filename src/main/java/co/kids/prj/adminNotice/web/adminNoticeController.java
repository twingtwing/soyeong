package co.kids.prj.adminNotice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.kids.prj.notice.service.NoticeService;

@Controller
public class adminNoticeController {
	@Autowired
	private NoticeService noticeDao;

	/* 공지사항 전체 리스트 */
	@RequestMapping("/adminNoticeList.do")
	public String noticeList(Model model) throws JsonProcessingException {
		ObjectMapper ob = new ObjectMapper();
		String notices = ob.writeValueAsString(noticeDao.noticeSelectList());
		model.addAttribute("notices", notices);
		return "admin/adminnotice/adminNoticeList";
	}
	
}
