package DWM.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import DWM.biz.FreeBoardBiz;
import DWM.vo.FreeBoardVO;

@Controller
@RequestMapping("/freeboard")
public class FreeBoardController {

	@Autowired
	private FreeBoardBiz freeboardbiz;

	@RequestMapping(path = "/view", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam("pagenum") int pagenum) {
		// 페이지 디폴트
		if (pagenum == 0) {
			pagenum = 1;
		} //
		int itemnum = 0;
		List<FreeBoardVO> freelist = freeboardbiz.list();
		if (!freelist.isEmpty()) {
			itemnum = freelist.size();
		}
		ModelAndView mav = new ModelAndView("freeboard/main");
		mav.addObject("freelist", freelist);
		mav.addObject("itemnum", itemnum);
		mav.addObject("pagenum", pagenum);
		return mav;
	}

	@RequestMapping(path = "/viewbody", method = RequestMethod.GET)
	public ModelAndView viewbody(@Param(value = "count") int count) {
		List<FreeBoardVO> body = freeboardbiz.viewbody(count);
		ModelAndView mav = new ModelAndView("freeboard/viewbody", "viewbody", body);
		return mav;
	}

	@RequestMapping(path = "/write")
	public ModelAndView write() {
		ModelAndView mav = new ModelAndView("freeboard/write");
		return mav;
	}

	@RequestMapping(path = "/write.do", method = RequestMethod.POST)
	public ModelAndView writeDo(@ModelAttribute FreeBoardVO vo) {
		int res = freeboardbiz.write(vo);
		ModelAndView mav = null;
		if (res > 0) {
			mav = view(1);
		} else {
			mav = new ModelAndView("freeboard/write");
		}
		return mav;
	}

	@RequestMapping(path = "/rewriteview", method = RequestMethod.GET)
	public ModelAndView reWrite(@Param(value = "count") int count) {
		List<FreeBoardVO> body = freeboardbiz.viewbody(count);
		ModelAndView mav = new ModelAndView("freeboard/rewrite", "viewbody", body);
		return mav;
	}

	@RequestMapping(path = "/rewrite.do", method = RequestMethod.POST)
	public ModelAndView reWriteDo(@ModelAttribute FreeBoardVO vo) {
		int res = freeboardbiz.reWriteDo(vo);
		ModelAndView mav = null;
		if (res > 0) {
			mav = viewbody(vo.getCount());
		} else {
			// 예외 상황
			mav = viewbody(vo.getCount());
		}
		return mav;
	}

	@RequestMapping(path = "/deleteview", method = RequestMethod.GET)
	public ModelAndView deleteView(@Param(value = "count") int count) {
		int res = freeboardbiz.deleteView(count);
		ModelAndView mav = null;
		if (res > 0) {
			mav = view(1);
		} else {
			// 삭제 실패 예외처리
			mav = view(1);
		}
		return mav;
	}

	@RequestMapping(path = "/search")
	public ModelAndView search(@RequestParam("type") String type, @RequestParam("search") String search, @RequestParam("pagenum") int pagenum) {
		// 페이지 디폴트
		if (pagenum == 0) {
			pagenum = 1;
		} //
		int itemnum = 0;
		List<FreeBoardVO> searchlist = freeboardbiz.searchlist(type, search);
		if (!searchlist.isEmpty()) {
			itemnum = searchlist.size();
		}

		ModelAndView mav = new ModelAndView("freeboard/searchresult");
		mav.addObject("freelist", searchlist);
		mav.addObject("itemnum", itemnum);
		mav.addObject("pagenum", pagenum);
		mav.addObject("type", type);
		mav.addObject("search", search);
		return mav;
	}

}
