package DWM.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DWM.biz.BoardBiz;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardBiz boardbiz;
	
}
