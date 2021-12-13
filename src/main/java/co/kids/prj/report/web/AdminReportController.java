package co.kids.prj.report.web;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
