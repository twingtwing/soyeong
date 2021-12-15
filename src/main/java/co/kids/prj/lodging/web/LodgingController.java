package co.kids.prj.lodging.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.kids.prj.lodging.service.LodgingServiceImpl;
import co.kids.prj.lodging.service.LodgingVO;
import co.kids.prj.lodgingPhoto.service.LodgingPhotoServiceImpl;
import co.kids.prj.lodgingPhoto.service.LodgingPhotoVO;
import co.kids.prj.review.service.ReviewServiceImpl;
import co.kids.prj.review.service.ReviewVO;

@Controller
public class LodgingController {
	@Autowired
	private LodgingServiceImpl lodgingDao;
	@Autowired 
	private LodgingPhotoServiceImpl lodPhotoDao;
	@Autowired
	private ReviewServiceImpl reviewDao;
	
	@Autowired
	private String saveDir;
	
	@PostMapping("/quickBook.do")
	public String quickBook(LodgingVO vo, Model model) {
		model.addAttribute("lists", lodgingDao.LodgingSelectList(vo));
		return "reservation/houseList";
	}


	@PostMapping("/hotelSort.do")
	@ResponseBody
	public void hotelSort(LodgingVO vo, HttpServletResponse response) {
		Gson gson = new GsonBuilder().create();
		try {
			response.getWriter().write(gson.toJson(lodgingDao.LodgingSelectList(vo)));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("hostManage.do")
	public String hostManage() {
		return "host/hostManage";
	}
	
	@RequestMapping("hostInsertForm.do")
	public String hostInsertForm(Model model, LodgingVO vo) {
		vo = lodgingDao.LodgingNum();
		model.addAttribute("lodNum", vo.getRno());
		return "host/hostInsertForm";
	}
	
	@RequestMapping("lodgingResister.do")
	public String lodgingResister(LodgingVO vo, LodgingPhotoVO pvo, HttpServletRequest request, @RequestParam(value="image", required= false) MultipartFile file, MultipartHttpServletRequest multi) {
		vo.setId(request.getParameter("id"));
		vo.setRcategory(request.getParameter("type1"));
		vo.setRtype(request.getParameter("type2"));
		vo.setRname(request.getParameter("title"));
		vo.setRguest(Integer.parseInt(request.getParameter("pnum")));
		vo.setRcheckin(request.getParameter("checkin"));
		vo.setRcheckout(request.getParameter("checkout"));
		vo.setRbed(Integer.parseInt(request.getParameter("bed")));
		vo.setRbath(Integer.parseInt(request.getParameter("bath")));
		vo.setRtel(request.getParameter("tel"));
		vo.setRaddress(request.getParameter("address"));
		vo.setRcontent(request.getParameter("subject"));
		vo.setFee(Integer.parseInt(request.getParameter("onedayfee")));
		vo.setAm1(request.getParameter("am1"));
		vo.setAm2(request.getParameter("am2"));
		vo.setAm3(request.getParameter("am3"));
		
		List<MultipartFile> fileList = multi.getFiles("image");
		for(MultipartFile mf : fileList) {
			String oriFileName = mf.getOriginalFilename();
			
			String safeFile = saveDir +  oriFileName;
			pvo.setOrifile(oriFileName);
			pvo.setPfile(safeFile);
			pvo.setRno(Integer.parseInt(request.getParameter("rno")));
			pvo.setId(request.getParameter("id"));
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			lodPhotoDao.insertPhoto(pvo);
		}
		
//		String fileName = file.getOriginalFilename();
//		vo.setRphoto(fileName);
//		int comma = fileName.lastIndexOf(".");
//		String pFileName = fileName.substring(0, comma)+"_Q_" + UUID.randomUUID().toString()+fileName.substring(comma);
//		File target = new File(saveDir, pFileName);
//		new File(saveDir).mkdir();
//		try {
//			FileCopyUtils.copy(file.getBytes(), target);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		lodgingDao.LodgingInsert(vo);
		return "redirect:hostManage.do";
	}

	@PostMapping("/houseList.do")
	public String houseList(LodgingVO vo, Model model) {
		model.addAttribute("lists",lodgingDao.LodgingSelectList(vo));
		
		return "reservation/houseList";
	}
	

	@RequestMapping("/detailedInfo.do")
	public String detailedInfo(LodgingVO vo, Model model) {
		vo = lodgingDao.LodgingSelect(vo);
		model.addAttribute("hotelDetail", vo);
		model.addAttribute("reviews",reviewDao.reviewSelectList(vo.getRno()));
		return "reservation/detailedInfo";
	}
	

}