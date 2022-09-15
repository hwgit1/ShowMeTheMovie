package kr.co.ictedu.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String select(Model model) {

		return "order/select";//jsp file name

	}//home
	
}
