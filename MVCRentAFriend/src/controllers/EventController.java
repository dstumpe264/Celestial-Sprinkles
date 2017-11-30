package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.EventDAO;

@Controller
public class EventController {
	@Autowired
	private EventDAO dao;
	
	@RequestMapping(path="createEvent.do", method=RequestMethod.GET)
	public ModelAndView createHome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createevent.jsp");
		return mv;
	}
	@RequestMapping(path="attendEvent.do", method=RequestMethod.GET)
	public ModelAndView attendHome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("attend.jsp");
		return mv;
	}
	
}