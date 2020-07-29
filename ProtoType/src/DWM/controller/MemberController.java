package DWM.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DWM.biz.MemberBiz;
import DWM.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberBiz biz;
	
	@RequestMapping(path = "/Insert.do")
	public ModelAndView insert(MemberVO vo) {
		String result=biz.insert(vo);
		ModelAndView mav = new ModelAndView("result","myresult",result);
		return mav;
	}
}
