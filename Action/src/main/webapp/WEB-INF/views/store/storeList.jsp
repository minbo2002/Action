	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STORE</title>
<link href="${pageContext.request.contextPath}/resources/css/store/storeList.css" rel="stylesheet">
</head>
<body>
<!-- section -->
<section>
<form id="frm" method="post" action="../pay/marketPay">
	<div id="container">
		<div id="content">
			<!-- 상단이미지 -->
			<div class="store_top"></div>
			<div class="product_wrap">
				<div class="product_inner">
					<!-- 메뉴바 -->
					<div class="product_index">
						<div class="bg_fixedIndex">
							<ul class="tab_mallmenu">
								<li class="current" data-menuid="cgv_tab1" id="1">
									<span>패키지</span>
								</li>
								<li data-menuid="cgv_tab2" id="2">
									<span>영화관람권</span>
								</li>
								<li data-menuid="cgv_tab3" id="3">
									<span>콤보</span>
								</li>
								<li data-menuid="cgv_tab4" id="4">
									<span>팝콘</span>
								</li>
								<li data-menuid="cgv_tab5" id="5">
									<span>음료</span>
								</li>
								<li data-menuid="cgv_tab6" id="6">
									<span>스낵</span>
								</li>
							</ul>
						</div>
					</div>
<!-- ------------------------------------------------------------------ -->
					<div class="bg_white"></div>
					<!-- 품목 -->
					<div class="tab_content">
						<!-- 패키지 -->
						<div id="cgv_tab1" class="menuTab current">
							<ul class="product_molist">
								<c:import url="../store/store_result.jsp"></c:import>
							</ul>
						</div>
<!-- --------------------------------------------- -->
						<!-- 영화관람권 -->
						<div id="cgv_tab2" class="menuTab">
							<ul class="product_molist product_molist2"></ul>
						</div>
<!-- --------------------------------------------- -->
						<!-- 콤보 -->
						<div id="cgv_tab3" class="menuTab">
							<ul class="product_molist product_molist3"></ul>
						</div>
<!-- --------------------------------------------- -->
						<!-- 팝콘 -->
						<div id="cgv_tab4" class="menuTab">
							<ul class="product_molist product_molist4"></ul>
						</div>
<!-- --------------------------------------------- -->
						<!-- 음료 -->
						<div id="cgv_tab5" class="menuTab">
							<ul class="product_molist product_molist5"></ul>
						</div>
<!-- --------------------------------------------- -->
						<!-- 스낵 -->
						<div id="cgv_tab6" class="menuTab">
							<ul class="product_molist product_molist6"></ul>
						</div>
<!-- --------------------------------------------- -->
					</div>
					
					
					<button id="goTop">Top</button>
				<script type="text/javascript">
					$('#goTop').click(function() {
						$('html, body').animate({scrollTop : 0}, 400);
						return false;
					});
				</script>
					
				</div>
			</div>
		</div>
	</div>
	
</form>	
</section>

<script type="text/javascript">
////스크롤 이벤트
	$(window).scroll(function() {
		if($(window).scrollTop() > 730){
			$('.product_index').addClass("sticky");
		}else {
			$('.product_index').removeClass("sticky");
		}
		if($(window).scrollTop() > 50){
			$('#goTop').fadeIn();
		}else {
			$('#goTop').fadeOut();
		}
	});
/////* 클릭하면 메뉴 탭 및 내용 전환 */////////////
	$('ul.tab_mallmenu li').click(function() {
		var activeTab = $(this).attr('data-menuid');
		
		$('ul.tab_mallmenu li').removeClass('current');
		$('.menuTab').removeClass('current');
		$(this).addClass('current');
		$('#'+activeTab).addClass('current');
		
		/* 클릭하면 해당 메뉴의 내용 불러오기 */
		var store_package = $('ul.tab_mallmenu li.current').attr('id');
		var tempScrollTop = $(window).scrollTop();
		
		$.ajax({
			type: "GET",
			url: "storeList2",
			async: false,
			data: {
				store_package:store_package
			},
			success: function(data) {
				$(window).scrollTop(tempScrollTop);
				$('.product_molist'+store_package).html(data);
			}
		});
	});
	
//바로 구매 클릭했을 때
$('.btn_category_product_buy').click(function name() {
	$('#frm').submit();
});
</script>
</body>
</html>