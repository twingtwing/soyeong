package co.kids.prj.notice.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kids.prj.notice.service.NoticeServiceImpl;
import co.kids.prj.notice.service.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	NoticeServiceImpl noticeDao;
	
	/* 공지사항 전체 리스트 */
	@RequestMapping("/noticeList.do")
	public String noticeList() {
		return "notice/noticeList";
	}
	
	/* 글 등록 폼 */
	@RequestMapping("noticeForm.do")
	public String noticeForm() {
		return "notice/noticeForm";
	}
	
	/* 글 등록하기 */
	@RequestMapping(value = "/noticeWrite.do")
	public String noticeWrite(@ModelAttribute("noticeVO") NoticeVO noticeVO, Model model) throws Exception{
		noticeDao.noticeInsert(noticeVO);
		return "redirect:/notice/noticeList";
	}
	
	/* 글 조회 */
	@RequestMapping("/noticeRead.do")
	public String noticeRead(@ModelAttribute("NoticeVO") NoticeVO noticeVO, Model model, HttpServletRequest request) throws Exception{
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		noticeVO.setBno(bno);
		
		noticeDao.noticeSelect(noticeVO);
        model.addAttribute("result", noticeVO);
		
		return "notice/noticeRead";
	}
	

}
