package DWM.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import DWM.action.LoginListener;
import DWM.action.MyAction;
import DWM.biz.MemberBiz;
import DWM.validate.MemberValidator;
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

	@RequestMapping(path = "/mymain")
	public ModelAndView mymain() {
		ModelAndView mav = new ModelAndView("home/mypage_main");
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
	
	@RequestMapping(path = "/regiloc")
	public ModelAndView insert_loc() {
		ModelAndView mav = new ModelAndView("home/insert_loc");
		return mav;
	}

	@RequestMapping(path = "/regimore.do")
	public ModelAndView insert_more(MemberVO vo) {
		String result = biz.insert_more(vo);
		ModelAndView mav = new ModelAndView("home/insert_result", "myresult", result);
		return mav;
	}
	
	@RequestMapping(path = "/regiloc.do")
	public ModelAndView insert_loc(MemberVO vo) {
		String[] xy = new String[] {"-1","-1"};
		try {
			xy = action.getXY(vo.getLocale());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("좌표를 못찾았다");
		}
		vo.setLocale(vo.getLocale()+" "+xy[0]+" "+xy[1]);
		String result = biz.insert_loc(vo);
		ModelAndView mav = new ModelAndView("home/insert_result", "myresult", result);
		return mav;
	}

	@RequestMapping(path = "/login")
	public ModelAndView login(@ModelAttribute MemberVO login) {
		ModelAndView mav = new ModelAndView("home/login","login",login);
		return mav;
	}

	@RequestMapping(path = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("login") MemberVO login, BindingResult result,
				HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

		//1. 유효성 검사
		memberValidator.validate(login, result);
		if(result.hasErrors()) {
			return new ModelAndView("home/login","login",login);
		}
		
		ModelAndView mav =null;
		String resultid = biz.login(login);
		if(resultid!=null) {
			String nickname = biz.getNickname(resultid);
			
			HttpSession session = req.getSession();
			LoginListener loginlistener = new LoginListener();
			loginlistener.setId(resultid);
			loginlistener.setNickname(nickname);
			session.setAttribute("loginlistener", loginlistener);
			session.setAttribute("id", resultid);
			session.setAttribute("nickname", nickname);
			mav = new ModelAndView("home/login_result", "myresult", resultid);
		}else {
			//로그인 실패
		}
		return mav;
	}
	
	@RequestMapping(path = "/logout")
	public ModelAndView logout(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {

        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

		HttpSession session = req.getSession();
		session.invalidate();
		
		return new ModelAndView("home/logout");
	}
	
	@RequestMapping(path = "/delete")
	public int delete(String id) {
		int n = biz.delete(id);
		return n;
	}
}
