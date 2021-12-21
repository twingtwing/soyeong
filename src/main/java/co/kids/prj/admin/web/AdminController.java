package co.kids.prj.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kids.prj.admin.service.AdminServiceImpl;
import co.kids.prj.admin.service.AdminVO;


@Controller
public class AdminController {
	
	@Autowired
	AdminServiceImpl adminDao;
	
	@RequestMapping("/admin.do")
	public String admin() {
		return "admin/adminmain/main";
	}
	
	@RequestMapping("ajaxyearago.do")
	@ResponseBody
	public String ajaxyearago() {
		String year = adminDao.yearAgoSelect();
		return year;
	}
	
	@RequestMapping("ajaxYearData.do")
	@ResponseBody
	public int[] ajaxYearData() {
		int users = adminDao.yearUsers();
		int sales = adminDao.yearSales();
		int reservs = adminDao.yearReservations();
		int reviews = adminDao.yearReviews();
		int arr[]= {users, sales, reservs, reviews};
		return arr;
	}
	@RequestMapping("ajaxHostRank.do")
	@ResponseBody
	public List<AdminVO> ajaxHostRank(Model model){
		List<AdminVO> hosttop = adminDao.hostTop10();
		return hosttop;
	}
	
	@RequestMapping("ajaxMonthlyChart.do")
	@ResponseBody
	public List<AdminVO> ajaxMonthlyChart() {
		List<AdminVO> monthselect = adminDao.monthSelect();
		
		return monthselect;
	}
}
