package com.mycom.movielist;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovieListController {



	@Autowired
	HttpServletRequest request;

	@RequestMapping ("/movieReleaseList.do" )
	public String movieReleaseList() {
		return Common.Movie.VIEW_PATH + "movie_list";
	}
}
