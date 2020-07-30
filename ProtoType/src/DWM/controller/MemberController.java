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
	
	@RequestMapping(path = "/regi")
	public ModelAndView insert() {
		ModelAndView mav = new ModelAndView("home/insert");
		return mav;
	}
	
	@RequestMapping(path = "/Insert.do")
	public ModelAndView insert(MemberVO vo) {
		String result=biz.insert(vo);		
		ModelAndView mav = new ModelAndView("home/insert_result","myresult",result);
		return mav;
	}
	
	@RequestMapping(path = "/login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("home/login");
		return mav;
	}

	@RequestMapping(path = "/login.do")
	public ModelAndView login(MemberVO vo) {
		String result=biz.login(vo);
		ModelAndView mav = new ModelAndView("home/login_result","myresult",result);
		return mav;
	}
}
