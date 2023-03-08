<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>

<link href="${path}/resources/css/booking/index.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
body {
	background-image:
		url(${ pageContext.request.contextPath }/resources/img/m_list_bg.png);
}
.bg {
	background-color: #121116a6;
	padding-bottom: 90px;
}
</style>
<script>
//btn1loc
	$(document).ready(function() {
		
		//지역클릭시
		$("#btn1loc").click(function(){
			var form= {
					t_loc: $('#btn1loc').val()
			}
			 $.ajax({ //jquery ajax
			    type:"get", //get방식으로 가져오기
			    url:"theaterloc", //값을 가져올 경로
			    data: form, //html, xml, text, script, json, jsonp 등 다양하게 쓸 수 있음
			    success: function(data){   //요청 성공시 실행될 메서드
			    		var btnTag = "<button type='button' id='btn1city' class='btncity'><span class='movieloc'>"+data[0]+"</span></button><br/>"
			    		 	btnTag +="<button type='button' id='btn2city' class='btncity'><span class='movieloc'>"+data[1]+"</span></button><br/>"
			    		 	btnTag +="<button type='button' id='btn2city' class='btncity'><span class='movieloc'>"+data[2]+"</span></button><br/>"
			    	$("#theatercity").html(btnTag);
			    	console.log(data);
			        console.log("통신성공");
			    },
			    error:function(){		 //요청 실패시 에러 확인을 위함
			        console.log("통신에러");
			    }
			}) 
		}); //btn1loc 끝
		
		
		
		//영화관 클릭시 시간 출력
		$(document).on("click",".btncity",function(){
				let t = $(this).text();
				$("#text2").val(t);
				$("#text2").removeAttr("disabled");
			alert(t);
			
			 $.ajax({ //jquery ajax
				    type:"get", //get방식으로 가져오기
				    url:"getTime", //값을 가져올 경로
				    dataType:"json",
				    data: {
				    	title : $("#text1").val(),
				    	name : $("#text2").val()
				    }, //html, xml, text, script, json, jsonp 등 다양하게 쓸 수 있음
				    success: function(data){   //요청 성공시 실행될 메서드
				    	/* let jsonInfo = JSON.stringify(data);
				    	alert(jsonInfo); */
				    	$("#timeList").empty();
				    	
				    	
				    	if(data=='') {
				    		var value = "<button type='button'><span class='movietime'>상영관이 없습니다.</span></button><br/>"
				    			$("#timeList").append(value);
				    		$(".tg").empty();
				    	}
				    	
				    	
				    	$.each(data, function(index, item) { // 데이터 =item
				    			
				    		    var btnTag =  "<button type='button' id='btn"+index+"time'><span class='movietime'>"+item.time+"</span></button><br/>"
					    		$("#timeList").append(btnTag);
				    	
						});
				        console.log("통신성공");
				    },
				    error:function(){		 //요청 실패시 에러 확인을 위함
				        console.log("통신에러");
				    }
				});	//ajax 끝 
		});// btn1cit
		
		
		
		//영화시간 클릭시 좌석값 불러오기
		$(document).on("click",".movietime",function(){
		let t = $(this).text();
		$("#text3").val(t);
		$("#text3").removeAttr("disabled");
		alert(t);
		var cnt = 0;
		$("#person").removeAttr('disabled');
		$.ajax({ //jquery ajax
		    type:"get", //get방식으로 가져오기
		    url:"getSeat", //값을 가져올 경로
		    data: {
		    	movie_title : $("#text1").val(),
		    	cinema_name : $("#text2").val(),
		    	movie_time : $("#text3").val()
		    }, //html, xml, text, script, json, jsonp 등 다양하게 쓸 수 있음
		    success: function(data){   //요청 성공시 실행될 메서드
				//$(".tr1").empty();	
		    	for(var i=1; i<6; i++){
		    		$(".tr"+i+"").empty();
		    	}
		    	
		    	var jsonInfo = JSON.stringify(data);
		    	alert(jsonInfo); //추후삭제
		    	
		    	
    			
		    	$.each(data, function(index, item){
		    		console.log(item);
		    		cnt++;
		    		
		    		
		    		if(cnt>=0 && cnt<6) {
		    			$(".tr1").append("<td class='tg-0pky'><button type='button' name='btnA' id='btn"+cnt+"' class='seatBtn'>"+item.r_seat_no+"</button></td>");			    			
		    		}else if(cnt>=6 && cnt <11) {
		    			$(".tr2").append("<td class='tg-0pky'><button type='button' name='btnA1' id='btn"+cnt+"' class='seatBtn'>"+item.r_seat_no+"</button></td>");
		    		}else if(cnt>=11 && cnt <16) {
		    			$(".tr3").append("<td class='tg-0pky'><button type='button' name='btnA1' id='btn"+cnt+"' class='seatBtn'>"+item.r_seat_no+"</button></td>");
		    		}else if(cnt>=16 && cnt <21){
		    			$(".tr4").append("<td class='tg-0pky'><button type='button' name='btnA1' id='btn"+cnt+"' class='seatBtn'>"+item.r_seat_no+"</button></td>");
		    		}else {
		    			$(".tr5").append("<td class='tg-0pky'><button type='button' name='btnA1' id='btn"+cnt+"' class='seatBtn'>"+item.r_seat_no+"</button></td>");
		    		} 
		    		if(item.seat_status==1 || item.seat_status!=0) {
		    			$(".seatBtn").css("background-color", "grey");
		    			return true;
		    		}
		    		
		    	});
		        console.log("통신성공");
		    },
		    error:function(){		 //요청 실패시 에러 확인을 위함
		        console.log("통신에러");
		    }
		});	//ajax 끝 
			
	});// //영화시간 클릭시 좌석값 불러오기 .movietime끝
		
	
		
		
		$(document).on("click",".seatBtn",function(){
			var t = $(this).text();
			$("#text4").val(t);
			$("#text4").removeAttr("disabled");
			$(".btnSubmit").append('<input type="submit" value="예약하기" style="width:80px; height: 30px; background: none; font-size: 15px; margin-left: 1%;">');
		});
		
		
		//경기도
		$("#btn2loc").click(function(){
			var form= {
					t_loc: $('#btn2loc').val()
			}	
			//영화관 ajax
			 $.ajax({ //jquery ajax
			    type:"get", //get방식으로 가져오기
			    url:"theaterloc", //값을 가져올 경로
			    data: form, //html, xml, text, script, json, jsonp 등 다양하게 쓸 수 있음
			    success: function(data){   //요청 성공시 실행될 메서드
			    	  	//for(var i=0; i<data.length; i++) {
			    	  		var btnTag = "<button type='button' id='btn1city' class='btncity'><span class='movieloc'>"+data[0]+"</span></button><br/>"
			    		 		btnTag +="<button type='button' id='btn2city' class='btncity'><span class='movieloc'>"+data[1]+"</span></button><br/>"
			    		 		btnTag +="<button type='button' id='btn3city' class='btncity'><span class='movieloc'>"+data[2]+"</span></button>"
			    	  		
			    	  	//}
			    	  	$("#theatercity").html(btnTag);
			    	console.log(data);
			        console.log("통신성공");
			    },
			    error:function(){		 //요청 실패시 에러 확인을 위함
			        console.log("통신에러");
			    }
			}) //ajax끝 
		});	//btn2loc 끝
		
		
	});//ready
	
</script> 

<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-0pky{border-color:inherit;text-align:left;vertical-align:top}
.tg button {background-color: rgba(0,0,0,0); border: none;}
</style>

</head>
<%--
mv.addObject("movieList", movieList);
model.addAttribute("t_loc", list);
model.addAttribute("loc", list);
 --%>
<body>
	
	
<section>
	<hr/>
	<%-- <h1>1. <pre>상대경로 = ${pageContext.request.requestURI}</pre></h1> --%>
	<div class="bodyFrame">영화예매 
 <div class="currentMovie">
 	<!-- <div class="time_Calendar">시간 -->
		<div class="movieChoice">
			<div class=movieFrame> 
				<div class="movieName" style="overflow: auto; width: 26%; height:400px;">
					<br/><p>영화<br/>
					<c:forEach var="list" items="${movieList}">
					 <button type="button" name="btn1movie" id="btn1movie" class="btnmovie"><span class="movie" id="movie1">${list.movie_title}</span></button><span>(${list.movie_grade})</span> <br/>
					 </c:forEach>
	 			</div>
	 			<div class="theater" style="width: 20%; height:400px;">
	 			<br/><p/>극장<br/> 
	 				<div class="theaterloc" style="overflow: auto; width:40%; ">
	 				<c:forEach var="list" items="${theaterList}"></c:forEach>
	 					<button type="button" name="t_loc" id="btn1loc" value="서울"><span class="movie">서울</span></button> <br/>
					 	<button type="button" name="t_loc" id="btn2loc" value="경기도"><span class="movie">경기</span></button> <br/>
					 	
					 </div>
					 <div class="theatercity" id="theatercity">
						<!-- <button type="button" name="btn1city" id="btn1city"><span class="movieloc" id="result"></span></button> <br/> -->
					 </div>
	 			</div>
	 			<div class="reserveTime" id="reserveTime" style="overflow: auto; width: 10%; height:400px;">
	 				<br/><p>시간<br/> 
	 					<ul id="timeList">
	 					</ul>
	 			</div>
	 				<div class="seat">
	 					<br/><p>상영관
	 					<br/><br/>
	 					<span class="screen" style="margin-left: 20%; margin-top: 100%;">SCREEN</span>
	 					<table class="tg" style="margin-left: 13%; margin-top: 3%;" >
						<tr class="tr1" style="font-size: 20px;">
						
						  </tr>
						    						  
						  <tr class="tr2">
						 
						  </tr>
						  <tr class="tr3">
						   
						  </tr>
						  <tr class="tr4">
						   
						  </tr> 
						  <tr class="tr5">
						  </tr>
						</table>
	 				</div> 
	 			<form action="${path}/ticket?" method="get">
	 			<div class="chooseMovie">
	 				<span>영화 : <input type="text" name="movie_title" id="text1"  style="width:100px; height: 30px; background: none;" disabled="disabled"/></span>
	 				<span>극장 : <input type="text" name="cinema_name" id="text2"  style="width:110px; height: 30px; background: none;" disabled="disabled"/></span>
	 				<span>관람시간 : <input type="text" name="movie_time" id="text3"  style="width:60px; height: 30px; background: none;" disabled="disabled"/></span>
	 				<span class=spans>좌석 : <input type="text" name="seat_number" id="text4" style="width:40px; height: 30px; background: none;" disabled="disabled" /></span>
	 				<span><input type="text" id="text5" style="width:40px; height: 30px; background: none;" disabled="disabled"/></span>
	 				<span style="padding-top: 13px; padding-left: 5px; width: 200px;">인원수:</span>
	 				  		<select id="person" name="person" style="background: none; font-size: 20px; height: 30px;" disabled="disabled">
						        <option value="0">관람인원</option>
						        <option value="1">1명</option>
						        <option value="2">2명</option>
						        <option value="3">3명</option>
						    </select>
	 				<span id="btnSubmit"><!-- <input type="submit" value="예약하기" style="width:80px; height: 30px; background: none; font-size: 15px; margin-left: 1%;"> --> </span> 
	 			</div>
	 			</form>
	 			
	 		</div>
		</div>
	 <!-- </div> -->
</div>
</div>


	</section>	
	
	<script>
	function Btnreset() {
		$(".seatBtn").removeAttr("disabled"); 
	}
	
	$(document).ready(function(){
 		$(".btnmovie").click(function(){
	 			let t = $(this).text();
	 		 	$("#text1").val(t);
	 		 	$("#text1").removeAttr("disabled");
 		});//.btnmovie
 	});
	 	
	 	//좌석 클릭시 색상 변경
	 	$(document).ready(function() {
	 		var count =0;
	 		$(document).on("change","#person",function() {
	 			var cnt = $("#person").val();
	 			alert("선택인원:"+cnt);
	 		//
	 		
	 		  // 버튼을 클릭할 때마다 실행되는 함수
	 		  $(document).on("click",".seatBtn",function() {
	 		    // 버튼이 현재 색상을 가지고 있는지 확인합니다.
	 		    if ($(this).css("background-color") === "rgb(255, 0, 0)") {
	 		    	$(".seatBtn").removeAttr("disabled");
	 		    	count--;
	 		    	alert("해제카운트:"+count);
	 		    	
	 		    	
	 		      // 현재 빨간색이면 원래 색상으로 변경합니다.
	 		     
	 		      $("#text4").val('');
	 		      $(this).css("background-color", "");
	 		    } else {
	 		    		count++;
	 		    		alert("클릭카운트:"+count);
	 		    		if(cnt==count) {
		 		    		$(".seatBtn").attr("disabled", true);
		 		    		//$(".seatBtn").removeAttr("disabled");
		 		    		count++;
	 		    		}
	 		 		      // 그렇지 않으면 빨간색으로 변경합니다.
	 		 		      $(this).css("background-color", "red");
	 		    }
	 		  });
	 		});
	 		});//ready

	 	</script>
	

	
</body>
</html>