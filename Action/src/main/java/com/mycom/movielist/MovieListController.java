package com.mycom.movielist;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovieListController {



	@Autowired
	HttpServletRequest request;

	
	@RequestMapping ("/movieReleaseList" ) 
	public String movieReleaseList() {
		return "movie/movie_list";
	}
	
	@RequestMapping ("/sample" ) 
	public String sample() {
		return "boxoffice/sample1";
	}
	
	@RequestMapping("/movieInfoDetail")
	public String list(Model model, Integer page, String movieId, String movieSeq, String m_name) {

		model.addAttribute("m_name", m_name);
		model.addAttribute("movieId", movieId);
		model.addAttribute("movieSeq", movieSeq);

		return "movie/movie_detail";
	}
	
	@RequestMapping("/movieInfoDetailRank")
	public String MovieInfoDetail(Model model, Integer page, String releaseDts, String title, String trailer) {

		model.addAttribute("releaseDts", releaseDts);
		model.addAttribute("title", title);
		model.addAttribute("trailer", trailer);

		return "movie/movie_detail";
	}

}
