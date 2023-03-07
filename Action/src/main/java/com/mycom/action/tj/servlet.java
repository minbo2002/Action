package com.mycom.action.tj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public servlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("movieCd"));
		String[] movieCd = request.getParameterValues("movieCd");
		ControlJson cj = new ControlJson();
		cj.main2(movieCd);
	}

	

}
