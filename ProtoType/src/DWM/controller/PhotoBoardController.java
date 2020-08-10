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

import DWM.action.MyAction;
import DWM.biz.MemberBiz;
import DWM.biz.PhotoBoardBiz;
import DWM.vo.MemberInfoVO;
import DWM.vo.PhotoBoardVO;

@Controller
@RequestMapping("/photoboard")
public class PhotoBoardController {

	@Autowired
	private PhotoBoardBiz photoboardbiz;
	@Autowired
	private MemberBiz memberbiz ;
	private MyAction myaction;

	@RequestMapping(path = "/view")
	public ModelAndView view(@RequestParam("date") String date, @RequestParam("pagenum") int pagenum) {
		if (pagenum == 0) {
			pagenum = 1;
		}

		if (date.equals("today")) {
			Date datenow = new Date();
			SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd");
			date = today.format(datenow);
		}

		int itemnum = 0;
		List<PhotoBoardVO> photolist = photoboardbiz.list(date, pagenum);
		System.out.println(photolist.isEmpty());
		if (!photolist.isEmpty()) {
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
	public ModelAndView write(@ModelAttribute("photoBoardVO") PhotoBoardVO photoBoardVO, String id) {
		// -- input date 実特
		String[] input = new String[3];
		Date datenow = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		input[0] = sdf.format(datenow).trim();
//		System.out.println(id);
		MemberInfoVO vo = memberbiz.getLocale(id);
		input[1] = vo.getLocale().split(" ")[3].trim();
		input[2] = vo.getLocale().split(" ")[4].trim();
		// -- input date 実特

		System.out.println("date : " + input[0] + " x : " + input[1] + " y : " + input[2]);
		List<String[]> weather = myaction.getWeatherNow(input);

		ModelAndView mav = new ModelAndView("photoboard/write","weather",weather);
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
			mav = view("today", 1);
		} else {
			mav = new ModelAndView("photoboard/write");
		}
		return mav;
	}

}
