package kr.co.ictedu.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		return "main";//jsp file name

	}//home
	
	@RequestMapping(value = "/plan", method = RequestMethod.GET)
	public String planhome(Model model) {

		return "planmain";//jsp file name

	}//planhome
	
}
