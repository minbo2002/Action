
package com.mycom.movielist;

public class Common {

	public static final String VIEW_PATH = "";

	//게시판별 관리를 편하게 하기 위한 클래스
	//Movie
	public static class Movie{
		public static final String VIEW_PATH = "movie/";
		//한 페이지당 보여줄 게시물 수
		public final static int BLOCKLIST = 10;

		//한 화면에 보여지는 페이지 메뉴 수
		//◀  1 2 3 4 5  ▶
		public final static int BLOCKPAGE = 5;
	}
}








