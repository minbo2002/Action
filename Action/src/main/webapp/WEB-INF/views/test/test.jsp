<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>test</title>
</head>
<body>

		<c:forEach var="n" begin="0" end="2" step="1">
				<input type="hidden" id="movie_list_${n}">
				<input type="hidden" id="movie_rank_box_one">
				<input type="hidden" id="movie_openDt_${n}"> 
				<input type="hidden" id="movie_movieNm_${n}"> 
				<input type="hidden" id="ticket${n}">
					<div id="movie_rank_poster_${n}">
						<div class="poster_box">
							<img id="movie_rank_poster_${n}_img">
						</div>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12 wow fadeInLeft"
						data-wow-delay="0.5s">
						<div class="movie_title_box">
							<div>
								<c:choose>
									<c:when test="${n eq 0 }">
										<p style="width: 40px; float: left;" id="movie_rank_rank_${n}"></p>
										<img style="width: 25px; height: 32px;"
											src="${ pageContext.request.contextPath }/resources/img/maedal_one.png">
									</c:when>

									<c:when test="${n eq 1 }">
										<div style="width: 40px; float: left;"
											id="movie_rank_rank_${n}"></div>
										<img style="width: 25px; height: 32px;"
											src="${ pageContext.request.contextPath }/resources/img/maedal_two.png">
									</c:when>

									<c:when test="${n eq 2 }">
										<div style="width: 40px; float: left;"
											id="movie_rank_rank_${n}"></div>
										<img style="width: 25px; height: 32px;"
											src="${ pageContext.request.contextPath }/resources/img/maedal_three.png">
									</c:when>

									<c:otherwise>
										<div style="width: 40px; float: left;"
											id="movie_rank_rank_${n}"></div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<br> <br> <br> <br>
					<div class="fact-item text-center">
						<span id="movie_rank_movieNm_${n}" style="font-size: 25px;"></span>
						<div class="movie_rank_infos">
							<div id="movie_rank_salesShare_${n}"></div>
							<div id="movie_rank_audiAcc_${n}"></div>
						</div>
						<input type="hidden" id="movie_rank_openDt_${n}"> <input
							type="hidden" id="movie_trailer_src_${n}">
					</div>
		</c:forEach>

</body>
</html>