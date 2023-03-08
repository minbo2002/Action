<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 구매</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 	
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/layout/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/store/storeSelect.css" rel="stylesheet">
</head>
<body>
<section>
<form action="../pay/marketPay" id="frm" method="post">
	<div id="container">
		<div id="content">
			<div class="detailtop_wrap">
				<div class="detail_inner">
					<div class="product_box">
<!-- ------------------------------------------ -->
						<div class="product_left">
							<div class="product_img">
								<img alt="${select.store_name}" src="../resources/upload/store/${select.store_img}">
							</div>
						</div>
<!-- ------------------------------------------ -->
						<div class="product_right">
							<h2 class="detail_title">${select.store_name}</h2>
							<input type="hidden" value="${select.store_name}" name="sname">
							
							<div class="info">
								<strong class="price">
									<fmt:formatNumber value="${select.store_price}" pattern="###,###,###" />
									<span class="won">원</span>
									<input type="hidden" value="${select.store_price}" name="sprice">
								</strong>
							</div>
<!-- ------------------------------------------ -->							
							<table border="1" class="table_info">
								<tbody>
									<tr id="store_note">
										<th>상품 구성</th>
										<td>
											<ul class="table_store_note">
												<li>
													${select.store_note}
												</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th class="last">구매 제한</th>
										<td class="last">
											<ul class="table_store_note">
												<li>
													제한 없음
												</li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
<!-- ------------------------------------------ -->							
							<div class="quantity">
								<a href="javascript:void(0)" class="aMinus"><img alt="수량감소" src="../resources/img/store/btn_quantity_minus.jpg"></a>
								<input type="text" class="numCount" value="${param.camount}" readonly="readonly" name="camount">
								<a href="javascript:void(0)" class="aPlus"><img alt="수량증가" src="../resources/img/store/btn_quantity_plus.jpg"></a>
							</div>
							
							<div class="total">
								<strong>총 상품 금액</strong>
								<em>
									<span class="totalPrice">
										<fmt:formatNumber value="${select.store_price}" pattern="###,###,###" />
									</span>
									원
								</em>
							</div>
							
							<script type="text/javascript">
							if('${param.camount}' == ""){
							$('.numCount').val(1);
								
							}
								//,찍어주는 정규식 함수
								function addComma(price) {
								  var regexp = /\B(?=(\d{3})+(?!\d))/g;
								  return price.toString().replace(regexp, ',');
								}
								//수량 감소
								$('.aMinus').click(function() {
									var num = $('.numCount').val();
									var minusNum = num - 1;
									var price = ${select.store_price};
									
									if(minusNum <= 0){
										$('.numCount').val(1);
									}else {
										$('.numCount').val(minusNum);
										price = ${select.store_price} * minusNum;
									}
									
									price = addComma(price);
									$('.totalPrice').text(price);
								});
								
								//수량 증가
								$('.aPlus').click(function() {
									var num = $('.numCount').val();
									num++;
									$('.numCount').val(num);
									
									var price = ${select.store_price} * num;
									price = addComma(price);
									$('.totalPrice').text(price);
								});
								
							</script>
<!-- ------------------------------------------ -->							
							<div class="btn_wrap">
								<a href="./storeList?store_package=${select.store_package}" class="btn_list">상품 리스트</a>
								<button type="button" class="btn_buy">구매하기</button>
							</div>
						</div>
<!-- ------------------------------------------ -->
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
</section>

<script type="text/javascript">
	
	//구매하기 버튼 눌렀을 때
	$('.btn_buy').click(function() {
		$('#frm').submit();
	});
</script>


</body>
</html>