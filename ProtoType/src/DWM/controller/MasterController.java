package DWM.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import DWM.biz.FreeBoardBiz;
import DWM.biz.MasterBiz;
import DWM.biz.MemberBiz;
import DWM.biz.PhotoBoardBiz;
import DWM.vo.FreeBoardVO;
import DWM.vo.MemberVO;
import DWM.vo.OnlineMemberVO;
import DWM.vo.PhotoBoardVO;

@Controller
@RequestMapping("/master")
public class MasterController {
	
	@Autowired
	private MasterBiz masterbiz;
	@Autowired
	private MemberBiz memberbiz;
	@Autowired
	private FreeBoardBiz freebiz;
	@Autowired
	private PhotoBoardBiz photobiz;
	
	@RequestMapping(path="/main")
	public ModelAndView main() {
		return new ModelAndView("master/main");
	}
	
	@RequestMapping(path="/memberlist")
	public ModelAndView memberlist() {
		List<MemberVO> memberlist = masterbiz.memberlist();
		return new ModelAndView("master/memberlist","memberlist",memberlist);
	};
	
	@RequestMapping(path="/memberanaly")
	public ModelAndView memberanaly(@RequestParam("pagenum") int pagenum) {
		
		Date datenow = new Date();
		SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd");
		String date = today.format(datenow);
		
		List<OnlineMemberVO> memberlist = masterbiz.memberanaly(date);
		int todaytotalnum = masterbiz.todaytotalnum(date);
		
		ModelAndView mav= new ModelAndView("master/memberanaly","memberlist",memberlist);
		mav.addObject("pagenum", pagenum);
		mav.addObject("todaytotalnum", todaytotalnum);
		return mav;
	};
	
	@RequestMapping(path="/memberdelete")
	public ModelAndView memberdelete(@RequestParam("id") String id) {
		int n = memberbiz.delete(id);
		ModelAndView res = memberlist();
		if(n>0) {
		}else {
			//삭제 실패 
		}
		return res;
	};
	
	@RequestMapping(path="/membersearch", method = RequestMethod.POST)
	public ModelAndView membersearch(@RequestParam("id") String id) {
		MemberVO member = masterbiz.membersearch(id);
		return new ModelAndView("master/membersearch","member",member);
	};
	
	@RequestMapping(path="/freelist")
	public ModelAndView freelist() {
		List<FreeBoardVO> freelist = freebiz.list();
		return new ModelAndView("master/freelist","freelist",freelist);
	};
	
	@RequestMapping(path="/freedelete")
	public ModelAndView freedelete(@RequestParam("count") int count) {
		int n = freebiz.deleteView(count);
		ModelAndView res = freelist();
		if(n>0) {
		}else {
			//삭제 실패 
		}
		return res;
	};
	
	@RequestMapping(path="/photolist")
	public ModelAndView photolist() {
		List<PhotoBoardVO> photolist = photobiz.list();
		return new ModelAndView("master/photolist","photolist",photolist);
	};
	
	@RequestMapping(path="/photodelete")
	public ModelAndView photodelete(@RequestParam("count") int count) {
		int n = photobiz.delete(count);
		ModelAndView res = photolist();
		if(n>0) {
		}else {
			//삭제 실패 
		}
		return res;
	};
	
}
