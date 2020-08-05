package DWM.controller;

import java.io.IOException;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DWM.action.MyAction;
import DWM.biz.MemberBiz;
import DWM.vo.MemberInfoVO;
import DWM.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberBiz biz;
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
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("home/login");
		return mav;
	}

	@RequestMapping(path = "/login.do")
	public ModelAndView login(MemberVO vo) {
		String result = biz.login(vo);
		ModelAndView mav = new ModelAndView("home/login_result", "myresult", result);
		return mav;
	}
}
