package co.kids.prj.adminNotice.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.kids.prj.notice.service.NoticeService;
import co.kids.prj.notice.service.NoticeVO;

@Controller
public class adminNoticeController {
	@Autowired
	private NoticeService noticeDao;

	/* 관리자 페이지 공지사항 전체 리스트 */
	@RequestMapping("/adminNoticeList.do")
	public String noticeList(Model model) throws JsonProcessingException {
		ObjectMapper ob = new ObjectMapper();
		String notices = ob.writeValueAsString(noticeDao.noticeSelectList());
		model.addAttribute("notices", notices);
		return "admin/adminnotice/adminNoticeList";
	}

	/* 관리자 페이지 공지사항 상세 보기 */
	@RequestMapping("/adminNoticeRead.do")
	public String adminNoticeRead(Model model, @Param("bno") int bno) {
		NoticeVO vo = new NoticeVO();
		vo.setBno(bno);
		model.addAttribute("notice", noticeDao.noticeSelect(vo));

		return "admin/adminnotice/adminNoticeRead";
	}
	
	/* 관리자 페이지 공지사항 검색 */

	@RequestMapping("/adminNoticeSearch.do")
	@ResponseBody
	public List<NoticeVO> adminNoticeSearch(NoticeVO vo) {
		if(vo.getBtitle().length() == 0) {vo.setBtitle(null);}
		return noticeDao.noticeSearch(vo);
	}

	/* 관리자 페이지 공지사항 등록 페이지로 이동 */
	@RequestMapping("/adminNoticeForm.do")
	public String adminNoticeForm() {
		return "admin/adminnotice/adminNoticeForm";
	}

	/* 관리자 페이지 공지사항 등록 처리 */
	@RequestMapping("/adminNoticeFormInsert.do")
	public String adminNoticeFormInsert(NoticeVO vo, HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		
		int res = noticeDao.noticeInsert(vo);
		
		if(res>0) {
			return "redirect:adminNoticeList.do";
		} else {
			return "redirect:adminNoticeForm.do";
		}
	}
	
	/* 관리자 페이지 공지사항 수정 폼으로 이동 */
	@RequestMapping("/adminNoticeUpdate.do")
	public String adminNoticeUpdate(Model model, @Param("bno") NoticeVO vo, int bno) {
		model.addAttribute("notice", noticeDao.noticeSelect(vo));
		return "admin/adminnotice/adminNoticeUpdate";
	}


	/* 관리자 페이지 공지사항 수정 처리 */
	@RequestMapping("/adminNoticeUpdateForm.do")
	@ResponseBody
	public String adminNoticeUpdate(NoticeVO vo) throws Exception {
		String result = "F";
		int res = noticeDao.noticeUpdate(vo);
		if(res>0) {result = "Y";}
		return result;


	}

	/* 관리자 페이지 공지사항 삭제하기 */
	@RequestMapping("/adminNoticeDelete.do")
	public String adminNoticeDelete(int bno) {

		int res = noticeDao.noticeDelete(bno);
		
		if(res>0) {
			return "redirect:adminNoticeList.do";
		} else {
			return "redirect:adminNoticeRead.do?bno="+bno;
		}
	}

}
