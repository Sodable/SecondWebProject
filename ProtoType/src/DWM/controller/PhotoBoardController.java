package DWM.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import DWM.action.MyAction;
import DWM.biz.MemberBiz;
import DWM.biz.PhotoBoardBiz;
import DWM.validate.PhotoBoardValidator;
import DWM.vo.MemberVO;
import DWM.vo.PhotoBoardVO;

@Controller
@RequestMapping("/photoboard")
public class PhotoBoardController {

	@Autowired
	private PhotoBoardBiz photoboardbiz;
	@Autowired
	private MemberBiz memberbiz;
	private MyAction myaction = new MyAction();
	@Autowired
	private PhotoBoardValidator photoboardvalidator;

	@RequestMapping(path = "/view")
	public ModelAndView view(@RequestParam("date") String date, @RequestParam("pagenum") int pagenum,
			@RequestParam("id") String id) {
		// 페이지 디폴트
		if (pagenum == 0) {
			pagenum = 1;
		} //

		// 날짜 설정
		if (date.equals("today")) {
			Date datenow = new Date();
			SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd");
			date = today.format(datenow);
		} //

		// 게시물 받아오기
		int itemnum = 0;
		List<PhotoBoardVO> photolist = photoboardbiz.list(date, pagenum);
//		System.out.println(photolist.isEmpty());
		if (!photolist.isEmpty()) {
			itemnum = photolist.size();
		}
//		long itemnum = photoboardbiz.getItemnum(date);
		//

		// top3 게시물 받아오기
		List<PhotoBoardVO> top3list = photoboardbiz.top3list(date);
		//

		// 닉네임 받아오기
		Map<String, String> nickname = new HashMap<>();
		for (PhotoBoardVO vo : photolist) {
			nickname.put(vo.getId(), memberbiz.getNickname(vo.getId()));
		} //

		// 추천한 게시물 받아오기
		List<PhotoBoardVO> likelist = photoboardbiz.likelist(id);
		//

		// 뷰로 보낼 객체
		ModelAndView mav = new ModelAndView("photoboard/main");
		mav.addObject("photolist", photolist);
		mav.addObject("top3list", top3list);
		mav.addObject("likelist", likelist);
		mav.addObject("nickname", nickname);
		mav.addObject("itemnum", itemnum);
		mav.addObject("pagenum", pagenum);
		mav.addObject("date", date);
		return mav;
	}

	@RequestMapping(path = "/top3")
	public ModelAndView top3() {
		Date datenow = new Date();
		SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd");
		String date = today.format(datenow);

		// top3 게시물 받아오기
		List<PhotoBoardVO> top3list = photoboardbiz.top3list(date);
		//

		// 닉네임 받아오기
		Map<String, String> nickname = new HashMap<>();
		for (PhotoBoardVO vo : top3list) {
			nickname.put(vo.getId(), memberbiz.getNickname(vo.getId()));
		} //

		// 뷰로 보낼 객체
		ModelAndView mav = new ModelAndView("photoboard/top3");
		mav.addObject("top3list", top3list);
		mav.addObject("nickname", nickname);
		mav.addObject("date", date);
		return mav;
	}

	@RequestMapping(path = "/write", method = RequestMethod.POST)
	public ModelAndView write(@ModelAttribute("photoBoardVO") PhotoBoardVO photoBoardVO,
			@RequestParam("id") String id) {
		// -- input date 셋팅
		String[] input = new String[3];
		Date datenow = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		input[0] = sdf.format(datenow).trim();
//		System.out.println(id);
		MemberVO vo = memberbiz.getLocale(id);
		input[1] = vo.getLocale().split(" ")[3].trim();
		input[2] = vo.getLocale().split(" ")[4].trim();
		// -- input date 셋팅

//		System.out.println("date : " + input[0] + " x : " + input[1] + " y : " + input[2]);
		List<String[]> weather = myaction.getWeatherNow(input);

		ModelAndView mav = new ModelAndView("photoboard/write", "weather", weather);
		return mav;
	}

	@RequestMapping(path = "/write.do", method = RequestMethod.POST)
	public ModelAndView writeDo(@ModelAttribute("photoBoardVO") PhotoBoardVO photoBoardVO, BindingResult result) {

		// 1. 유효성 검사
		photoboardvalidator.validate(photoBoardVO, result);
		if (result.hasErrors()) {
			return write(photoBoardVO, photoBoardVO.getId());
		}

		MultipartFile file = photoBoardVO.getImagefile();
		String filename = file.getOriginalFilename();

		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			inputStream = file.getInputStream();
			String path = "C:\\Users\\Playdata\\git\\SecondWebProject\\ProtoType\\WebContent\\upload\\photoboard";

			File newFile = new File(path + "/" + filename);
			if (!newFile.exists()) {
				newFile.createNewFile();
			}

			outputStream = new FileOutputStream(newFile);
			int read = 0;
			byte[] b = new byte[(int) file.getSize()];
			while ((read = inputStream.read(b)) != -1) {
				outputStream.write(b, 0, read);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		photoBoardVO.setPb_file(filename);
		int res = photoboardbiz.writeDo(photoBoardVO);
		ModelAndView mav = null;
		if (res > 0) {
			mav = view("today", 1, photoBoardVO.getId());
		} else {
			mav = new ModelAndView("photoboard/write");
		}
		return mav;
	}

	@RequestMapping(path = "/recommand", method = RequestMethod.GET)
	public ModelAndView recommand(@RequestParam("date") String date, @RequestParam("pagenum") int pagenum,
			@RequestParam("count") int count, @RequestParam("id") String id) {
		int res = photoboardbiz.recommand(count, id);
		if (res > 0) {
			// 성공 시
		} else {
			// 실패 시
		}
		return view(date, pagenum, id);
	}

	@RequestMapping(path = "/recommandcancel", method = RequestMethod.GET)
	public ModelAndView recommandcancel(@RequestParam("date") String date, @RequestParam("pagenum") int pagenum,
			@RequestParam("count") int count, @RequestParam("id") String id) {
		int res = photoboardbiz.recommandcancel(count, id);
		if (res > 0) {
			// 성공 시
		} else {
			// 실패 시
		}
		return view(date, pagenum, id);
	}

	@RequestMapping(path = "/viewbody", method = RequestMethod.GET)
	public ModelAndView viewbody(@RequestParam("count") int count) {
		PhotoBoardVO photo = photoboardbiz.viewbody(count);
		ModelAndView mav = new ModelAndView("photoboard/viewbody", "photo", photo);
		return mav;
	}

	@RequestMapping(path = "/delete", method = RequestMethod.GET)
	public ModelAndView deleteView(@RequestParam("date") String date, @RequestParam("pagenum") int pagenum,
			@RequestParam("id") String id, @RequestParam("count") int count) {
		int res = photoboardbiz.delete(count);
		ModelAndView mav = null;
		if (res > 0) {
			mav = view(date, pagenum, id);
		} else {
			// 삭제 실패 예외처리
			mav = view(date, pagenum, id);
		}
		return mav;
	}

}
