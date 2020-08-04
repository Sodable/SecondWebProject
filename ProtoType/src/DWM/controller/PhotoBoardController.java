package DWM.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import DWM.biz.PhotoBoardBiz;
import DWM.vo.PhotoBoardVO;

@Controller
@RequestMapping("/photoboard")
public class PhotoBoardController {

	@Autowired
	private PhotoBoardBiz photoboardbiz;

	@RequestMapping(path = "/view")
	public ModelAndView view(@RequestParam("date") String date, @RequestParam("pagenum") int pagenum) {
		if(pagenum==0) {
			pagenum=1;
		}
		
		if(date.equals("today")) {
			Date datenow = new Date();
			SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd");
			date = today.format(datenow);
		}
		
		int itemnum=0;
		List<PhotoBoardVO> photolist = photoboardbiz.list(date,pagenum);
		System.out.println(photolist.isEmpty());
		if(!photolist.isEmpty()) {
			itemnum = photolist.size();
		}
//		long itemnum = photoboardbiz.getItemnum(date);
		
		ModelAndView mav = new ModelAndView("photoboard/main");
		mav.addObject("photolist", photolist);
		mav.addObject("itemnum", itemnum);
		mav.addObject("pagenum", pagenum);
		mav.addObject("date", date);
		return mav;
	}

	@RequestMapping(path = "/write")
	public ModelAndView write(@ModelAttribute("photoBoardVO") PhotoBoardVO photoBoardVO) {
		ModelAndView mav = new ModelAndView("photoboard/write");
		return mav;
	}

	@RequestMapping(path = "/write.do", method = RequestMethod.POST)
	public ModelAndView writeDo(@ModelAttribute("photoBoardVO") PhotoBoardVO photoBoardVO) {
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
			mav = view("today",1);
		} else {
			mav = new ModelAndView("photoboard/write");
		}
		return mav;
	}
//	
//	
//	@RequestMapping(path="/viewbody",method = RequestMethod.GET)
//	public ModelAndView viewbody(@Param(value = "count") int count) {
//		List<FreeBoardVO> body = freeboardbiz.viewbody(count);
//		ModelAndView mav = new ModelAndView("freeboard/viewbody","viewbody",body);
//		return mav;
//	}
//	
//	@RequestMapping(path="/write")
//	public ModelAndView write() {
//		ModelAndView mav = new ModelAndView("freeboard/write");
//		return mav;
//	}
//

//	@RequestMapping(path="/rewriteview", method = RequestMethod.GET )
//	public ModelAndView reWrite(@Param(value = "count") int count) {
//		List<FreeBoardVO> body = freeboardbiz.viewbody(count);
//		ModelAndView mav = new ModelAndView("freeboard/rewrite","viewbody",body);
//		return mav;
//	}
//	
//	@RequestMapping(path="/rewrite.do", method = RequestMethod.POST)
//	public ModelAndView reWriteDo(@ModelAttribute FreeBoardVO vo) {
//		int res = freeboardbiz.reWriteDo(vo);
//		ModelAndView mav = null;
//		if(res>0) {
//			mav = viewbody(vo.getCount());
//		}else {
//			//예외 상황
//			mav = viewbody(vo.getCount());
//		}
//		return mav;
//	}
//	
//	@RequestMapping(path="/deleteview", method = RequestMethod.GET )
//	public ModelAndView deleteView(@Param(value = "count") int count) {
//		int res = freeboardbiz.deleteView(count);
//		ModelAndView mav = null;
//		if(res>0) {
//			mav = view();
//		}else {
//			//삭제 실패 예외처리
//			mav = view();
//		}
//		return mav;
//	}

}
