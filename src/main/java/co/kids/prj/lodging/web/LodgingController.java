package co.kids.prj.lodging.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import co.kids.prj.reservation.service.ReservLodVO;
import co.kids.prj.reservation.service.ReservationImpl;
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
	private ReservationImpl reservDao;

	@Autowired
	private String saveDir;

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
	public String hostManage(ReservLodVO vo, Model model, HttpSession session, HttpServletRequest request) {
		session = request.getSession();
		vo.setId((String) session.getAttribute("id"));
		if (vo.getRuse() == null) {
			LodgingVO lodvo = new LodgingVO();
			lodvo.setId(vo.getId());
			lodvo.setRuse("A");
			model.addAttribute("lodges", lodgingDao.LodgingSelectMyList(lodvo));
		} else {
			model.addAttribute("lodges", reservDao.hostSortList(vo));
		}
		return "host/hostManage";
	}

	@RequestMapping("hostInsertForm.do")
	public String hostInsertForm(Model model, LodgingVO vo) {
		vo = lodgingDao.LodgingNum();
		if (vo == null) {
			model.addAttribute("lodNum", 1);
		} else {
			model.addAttribute("lodNum", vo.getRno());
		}
		return "host/hostInsertForm";
	}

	@RequestMapping("lodgingResister.do")
	public String lodgingResister(LodgingVO vo, LodgingPhotoVO pvo, HttpServletRequest request,
			@RequestParam(value = "image", required = false) MultipartFile file, MultipartHttpServletRequest multi) {
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

		// 다중파일업로드
		List<MultipartFile> fileList = multi.getFiles("image");

		for (int i = 0; i < fileList.size(); i++) {
			String oriFileName = fileList.get(i).getOriginalFilename();
			String safeFile = saveDir + UUID.randomUUID().toString() + oriFileName;
			pvo.setOrifile(oriFileName);
			pvo.setPfile(safeFile);
			pvo.setRno(Integer.parseInt(request.getParameter("rno")));
			pvo.setId(request.getParameter("id"));

			try {
				fileList.get(i).transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			lodPhotoDao.insertPhoto(pvo);
			if (i == 0) {
				vo.setRphoto("/upload/" + safeFile.substring(saveDir.length()));
			}
		}

		lodgingDao.LodgingInsert(vo);
		return "redirect:hostManage.do";
		// 단일파일업로드
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
	}

	@PostMapping("/houseList.do")
	public String houseList(LodgingVO vo, Model model, HttpServletResponse response) {
		List<LodgingVO> lists = lodgingDao.LodgingSearchList(vo);
		if (lists.size() < 1) {
			model.addAttribute("msg", "검색 결과가 없습니다.");
		} else {
			model.addAttribute("lists", lists);
			model.addAttribute("searchKey",vo.getSearchKey());
		}
		/*
		 * for (LodgingVO list : lists) { File file = new File(list.getRphoto()); byte[]
		 * buffer = new byte[1024]; int length = 0; try { BufferedInputStream ins = new
		 * BufferedInputStream(new FileInputStream(file)); BufferedOutputStream outs =
		 * new BufferedOutputStream(response.getOutputStream()); while ((length =
		 * ins.read(buffer)) != -1) { outs.write(buffer,0,length); } outs.flush();
		 * ins.close(); } catch (Exception e) { e.printStackTrace(); } }
		 */
		return "reservation/houseList";

	}

	@RequestMapping("/detailedInfo.do")
	public String detailedInfo(LodgingVO vo, Model model) {
		vo = lodgingDao.LodgingSelect(vo);
		model.addAttribute("hotelDetail", vo);
		List<ReviewVO> list = reviewDao.reviewSelectList(vo.getRno());
		model.addAttribute("reviews", list);
		double sum = 0;
		if (list.size() > 0) {
			for (ReviewVO star : list) {
				sum = sum + star.getRvstar();
			}
		}
		if (sum / list.size() > 0) {
			double avg = sum / list.size();
			avg = Math.round(avg * 100) / 100.0;
			model.addAttribute("avg", avg + " / 5 점");
		} else {
			model.addAttribute("avg", "아직 후기가 없어요 !");
		}
		LodgingPhotoVO pvo = new LodgingPhotoVO();
		pvo.setRno(vo.getRno());
		model.addAttribute("imgs", lodPhotoDao.selectPhoto(pvo));

		return "reservation/detailedInfo";
	}

	@RequestMapping("lodgingInfo.do")
	public String lodgingInfo(LodgingVO vo, HttpServletRequest request) {
		vo.setRno(Integer.parseInt(request.getParameter("rno")));
		request.setAttribute("thislodge", lodgingDao.LodgingSelect(vo));
		return "host/lodgingInfo";
	}

	@RequestMapping("lodgingUpdateForm.do")
	public String lodgingUpdateForm(LodgingVO vo, HttpServletRequest request) {
		vo.setRno(Integer.parseInt(request.getParameter("rno")));
		request.setAttribute("thislodge", lodgingDao.LodgingSelect(vo));
		return "host/lodgingUpdateForm";
	}

	@RequestMapping("updataFormAjax.do")
	@ResponseBody
	public LodgingVO updataFormAjax(LodgingVO vo, HttpServletRequest request) {
		vo.setRno(Integer.parseInt(request.getParameter("rno")));
		return lodgingDao.LodgingSelect(vo);
	}

	@RequestMapping("lodgingDelete.do")
	public String lodgingDelete(LodgingVO vo, HttpServletRequest request) {
		vo.setRno(Integer.parseInt(request.getParameter("rno")));
		int i = vo.getRno();
		lodgingDao.LodgingDelete(i);
		return "redirect:hostManage.do";
	}

	@RequestMapping("lodgingUpdate.do")
	public String lodgingUpdate(LodgingVO vo, HttpServletRequest request) {
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
		vo.setRno(Integer.parseInt(request.getParameter("rno")));
		lodgingDao.LodgingUpdateInfo(vo);
		return "forward:lodgingInfo.do";
	}

	@PostMapping("/updateState.do")
	@ResponseBody
	public String updateState(LodgingVO vo) {
		if (lodgingDao.LodgingUpdateState(vo) != 0) {
			return "ok";
		} else {
			return "ng";
		}
	}

}
