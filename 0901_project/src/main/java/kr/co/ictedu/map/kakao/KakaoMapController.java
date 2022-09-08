package kr.co.ictedu.map.kakao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import kr.co.ictedu.util.dto.MemberDTO;

@Controller
@RequestMapping(value = "/map/kakao")
public class KakaoMapController {

	private static final Logger logger = LoggerFactory.getLogger(KakaoMapController.class);

	@Autowired
	private KakaoMapService service;
	
	@RequestMapping( value = "/step4", method = RequestMethod.GET )
	public String step4(Model model) {
		List<MemberDTO> list = null;
		list = service.selectAllMember();
		model.addAttribute("list", new Gson().toJson(list));
		return "map/kakao/step4";//jsp file name
	}//step4

	@RequestMapping(value = "/step3", method = RequestMethod.GET)
	public String step3(Model model) {

		List<MemberDTO> list = null;
		list = service.selectAllMember();
		model.addAttribute( "list", new Gson().toJson(list) );

		return "map/kakao/step3";//jsp file name

	}//step3

	@RequestMapping(value = "/step2", method = RequestMethod.GET)
	public String step2(Model model) {

		return "map/kakao/step2";//jsp file name

	}//step2

	@RequestMapping(value = "/step1", method = RequestMethod.GET)
	public String step1(Model model) {

		return "map/kakao/step1";//jsp file name

	}//step1

}//class







