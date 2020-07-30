package DWM.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
			mav = new ModelAndView("freeboard/main");
		}else {
			mav = new ModelAndView("freeboard/write");
		}
		return mav;
	}

}
