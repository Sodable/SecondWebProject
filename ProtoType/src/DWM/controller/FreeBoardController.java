package DWM.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import DWM.biz.FreeBoardBiz;
import DWM.vo.FreeBoardVO;

@Controller
@RequestMapping("/freeboard")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardBiz freeboardbiz;
	
	@RequestMapping(path="/view")
	public ModelAndView view() {
		List<FreeBoardVO> freelist = freeboardbiz.list();
		ModelAndView mav = new ModelAndView("freeboard/main");
		mav.addObject("freelist", freelist);
		return mav;
	}
	
	@RequestMapping(path="/viewbody",method = RequestMethod.GET)
	public ModelAndView viewbody(@Param(value = "count") int count) {
		List<FreeBoardVO> body = freeboardbiz.viewbody(count);
		ModelAndView mav = new ModelAndView("freeboard/viewbody","viewbody",body);
		return mav;
	}
	
	@RequestMapping(path="/write")
	public ModelAndView write() {
		ModelAndView mav = new ModelAndView("freeboard/write");
		return mav;
	}

	@RequestMapping(path="/write.do", method = RequestMethod.POST)
	public ModelAndView writeDo(@ModelAttribute FreeBoardVO vo) {
		int res = freeboardbiz.write(vo);
		ModelAndView mav = null;
		if(res>0) {
			mav = view();
		}else {
			mav = new ModelAndView("freeboard/write");
		}
		return mav;
	}
	
	@RequestMapping(path="/rewriteview", method = RequestMethod.GET )
	public ModelAndView reWrite(@Param(value = "count") int count) {
		List<FreeBoardVO> body = freeboardbiz.viewbody(count);
		ModelAndView mav = new ModelAndView("freeboard/rewrite","viewbody",body);
		return mav;
	}
	
	@RequestMapping(path="/rewrite.do", method = RequestMethod.POST)
	public ModelAndView reWriteDo(@ModelAttribute FreeBoardVO vo) {
		int res = freeboardbiz.reWriteDo(vo);
		ModelAndView mav = null;
		if(res>0) {
			mav = viewbody(vo.getCount());
		}else {
			//예외 상황
			mav = viewbody(vo.getCount());
		}
		return mav;
	}
	
	@RequestMapping(path="/deleteview", method = RequestMethod.GET )
	public ModelAndView deleteView(@Param(value = "count") int count) {
		int res = freeboardbiz.deleteView(count);
		ModelAndView mav = null;
		if(res>0) {
			mav = view();
		}else {
			//삭제 실패 예외처리
			mav = view();
		}
		return mav;
	}

}
