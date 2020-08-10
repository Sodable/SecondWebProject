package DWM.controller;

import java.io.IOException;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import DWM.action.MyAction;
import DWM.biz.MemberBiz;
import DWM.validate.MemberValidator;
import DWM.vo.MemberInfoVO;
import DWM.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberBiz biz;
	@Autowired
	private MemberValidator memberValidator;
	private MyAction action = new MyAction();

	@RequestMapping(path = "/regi")
	public ModelAndView insert() {
		ModelAndView mav = new ModelAndView("home/insert");
		return mav;
	}

	@RequestMapping(path = "/Insert.do")
	public ModelAndView insert(MemberVO vo) {
		String result = biz.insert(vo);
		ModelAndView mav = new ModelAndView("home/insert_result", "myresult", result);
		return mav;
	}

	@RequestMapping(path = "/regimore")
	public ModelAndView insert_more() {
		ModelAndView mav = new ModelAndView("home/insert_more");
		return mav;
	}

	@RequestMapping(path = "/regimore.do")
	public ModelAndView insert_more(MemberInfoVO vo) {
		String[] xy = new String[] {"-1","-1"};
		try {
			xy = action.getXY(vo.getLocale());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("좌표를 못찾았다");
		}
		vo.setLocale(vo.getLocale()+" "+xy[0]+" "+xy[1]);
		String result = biz.insert_more(vo);
		ModelAndView mav = new ModelAndView("home/insert_result", "myresult", result);
		return mav;
	}

	@RequestMapping(path = "/login")
	public ModelAndView login(@ModelAttribute MemberVO login) {
		ModelAndView mav = new ModelAndView("home/login","login",login);
		return mav;
	}

	@RequestMapping(path = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("login") MemberVO login, BindingResult result) {
		//1. 유효성 검사
		memberValidator.validate(login, result);
		if(result.hasErrors()) {
			return new ModelAndView("home/login","login",login);
		}
		
		String resultid = biz.login(login);
		ModelAndView mav = new ModelAndView("home/login_result", "myresult", resultid);
		return mav;
	}
	
	@RequestMapping(path = "/logout")
	public ModelAndView logout() {
		return new ModelAndView("home/logout");
	}
}
