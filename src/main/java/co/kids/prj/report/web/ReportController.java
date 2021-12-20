package co.kids.prj.report.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kids.prj.report.service.ReportServiceImpl;
import co.kids.prj.report.service.ReportVO;

@Controller
public class ReportController {
	@Autowired
	ReportServiceImpl reportDao;
	
	
	@RequestMapping("reportInsert.do")
	@ResponseBody
	public void reportInsert(ReportVO vo, HttpSession session) {
		String id = (String) session.getAttribute("id");
		vo.setReporter(id);
		
		reportDao.reportInsert(vo);		
	}
	

}