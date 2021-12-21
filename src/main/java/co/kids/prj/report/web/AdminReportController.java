package co.kids.prj.report.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.kids.prj.report.service.ReportServiceImpl;
import co.kids.prj.report.service.ReportVO;

@Controller
public class AdminReportController {
	@Autowired
	ReportServiceImpl reportDao;

	@GetMapping("/reportPage.do")
	public String reportPage(Model model) {
		return "admin/report/reportList";
	}
	
	@GetMapping("/reportList.do")
	@ResponseBody
	public void reportList(HttpServletResponse response) throws IOException {
		Gson gson = new GsonBuilder().create();		 
		response.getWriter().print(gson.toJson(reportDao.reportSelectList()));
	}
	
	
	/* 신고 검색 */
	@RequestMapping("/reportSearch.do")
	@ResponseBody
	public List<ReportVO> reportSearch(ReportVO vo) {
		if(vo.getRptitle().length() == 0) {vo.setRptitle(null);}
		return reportDao.reportSearch(vo);
	}

	/* 신고 상세 보기 */
	@GetMapping("/reportSelect.do")
	public String reportSelect(ReportVO vo, @RequestParam(value = "rpno") int rpno, Model model) {
		vo = reportDao.reportSelect(rpno);
		model.addAttribute("report", vo);
		return "admin/report/reportSelect";
	}

	@ResponseBody
	@PostMapping("/reportClear.do")
	public String reportClear(@RequestParam(value = "rpno") int rpno) {
		reportDao.reportClear(rpno);
		return "ok";
	}
	
	//신고횟수
	@GetMapping("/reportCount.do")
	@ResponseBody
	public int reportCount(ReportVO vo) {
		return reportDao.reportCount(vo);
	}
}
