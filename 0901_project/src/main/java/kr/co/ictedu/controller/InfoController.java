package kr.co.ictedu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.ictedu.dto.InfoDto;


@Controller
public class InfoController {
	private static Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	
	@ResponseBody
	@RequestMapping(value = "crawling.do", method = {RequestMethod.GET, RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String getCrawling() {
		logger.info("크롤링" + new Date());
		Document doc;
		String gson = "";
		
		try {
			
			 doc = Jsoup.connect("http://www.cgv.co.kr/movies/").get();
			/* Elements */
			 Elements ranks = doc.select(".rank");
			 logger.info("rank" + ranks); 
			 
			 Elements imgs = doc.select(".thumb-image > img");
			 logger.info("imgs" + imgs); 
			 
			 Elements movieAges = doc.select(".cgvIcon");
			 logger.info("cgvIcon" + movieAges); 
			 
			 Elements movieTitles = doc.select("div.box-contents strong.title");
			 logger.info("titles" + movieTitles); 
			 
			 Elements movieRates = doc.select(".percent span");
			 logger.info("percents" + movieRates); 
			 
			 Elements movieOpenDates = doc.select(".txt-info strong");
			 logger.info("percents" + movieOpenDates); 
			
			 List<InfoDto> list = new ArrayList<InfoDto>();
			 
			 for(int i = 0; i < ranks.size(); i++) {
				
				 String rank = ranks.get(i).text();
				 String img = imgs.get(i).attr("src");
				 String movieAge = movieAges.get(i).text();
				 String movieTitle = movieTitles.get(i).text();
				 String movieRate = movieRates.get(i).text();
				 String movieOpenDate = movieOpenDates.get(i).text();
				 int seq = i;
				 InfoDto cgvInfoDto = new InfoDto(rank, img, movieAge, movieTitle, movieRate, movieOpenDate, seq);
				 
				 logger.info(cgvInfoDto.toString());
				 list.add(cgvInfoDto);
			 }
			 	gson = new Gson().toJson(list);
			 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return gson;
	}
}
