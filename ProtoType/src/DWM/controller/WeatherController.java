package DWM.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import DWM.action.MyAction;
import DWM.biz.MemberBiz;
import DWM.vo.MemberVO;

@Controller
@RequestMapping("/weather")
public class WeatherController {
	
	@Autowired
	private MemberBiz memberbiz;
	private MyAction myaction = new MyAction();
	
	@RequestMapping("/now")
	public ModelAndView now(@Param("id") String id) {
		// -- input date 実特
		String[] input = new String[3];
		Date datenow = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		input[0]= sdf.format(datenow).trim();
//		System.out.println(id);
		MemberVO vo = memberbiz.getLocale(id);
		input[1]=vo.getLocale().split(" ")[3].trim();
		input[2]=vo.getLocale().split(" ")[4].trim();
		// -- input date 実特
		
//		System.out.println("date : "+input[0]+" x : "+input[1]+" y : "+input[2]);
		List<String[]> weather = myaction.getWeatherNow(input);
		
		ModelAndView mav = new ModelAndView("weather/weathernow","weather",weather);
		return mav;
	}
	
	@RequestMapping("/future")
	public ModelAndView future(@Param("id") String id) {
		// -- input date 実特
		String[] input = new String[3];
		Date datenow = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		input[0]= sdf.format(datenow).trim();
//		System.out.println(id);
		MemberVO vo = memberbiz.getLocale(id);
		input[1]=vo.getLocale().split(" ")[3].trim();
		input[2]=vo.getLocale().split(" ")[4].trim();
		// -- input date 実特
		
//		System.out.println("date : "+input[0]+" x : "+input[1]+" y : "+input[2]);
		List<String[]> weather = myaction.getWeatherFuture(input);
		
		ModelAndView mav = new ModelAndView("weather/weatherfuture","weather",weather);
		return mav;
	}
	
}
