
function load_list(){
	// 조회할 날짜를 계산

	var dt = new Date();
	//하루전 날짜 
	dt.setTime(new Date().getTime() - (1 * 24 * 60 * 60 * 1000));
	
    var m = dt.getMonth() + 1;
	if (m < 10) {
		var month = "0" + m;
	} else {
		var month = m + "";
	}

	var d = dt.getDate();
	var day='';
	if(d<10){
		var day = "0" + d;
	}else {
		var day = d + "";
	}

	

	var y = dt.getFullYear();
	var year = y + ""; 

	var result = year + month + day;
	
    //192.168.1.101:9090/vs/list.do
    var url ='http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json';
    //하루전 박스오피스순으로 출력(10위 까지만)
    var param = 'key=a7c6bfb2e16d4d1ae14730f90bc6726a&targetDt='+result+'&itemPerPage=10';
    sendRequest( url, param, resultFn, "GET" );
    
 }
 
 function resultFn(){
    if( xhr.readyState == 4 && xhr.status == 200 ){
       var data = xhr.responseText;
       var json=eval("[" + data + "]");
     	
       //id가 movie_select인 태그를 가져온다
       var movie_select =document.getElementById("movie_select")
       
      for(var i=0 ; i<json[0].boxOfficeResult.dailyBoxOfficeList.length ; i++){
    	 
    	  var div = document.createElement("div");
    	  var input = document.createElement("input");
    	  input.type="button";
    	  input.classList = "st";
    	  input.style.width="170px";
    	  input.id=json[0].boxOfficeResult.dailyBoxOfficeList[i].movieNm;
    	  input.value=json[0].boxOfficeResult.dailyBoxOfficeList[i].movieNm;//영화 이름
    	  input.onclick=function(e){
    		  movie(e.target.value, e.target);
    	  }
		  div.appendChild(input);
		  movie_select.appendChild(div);
      }
       select();
       
    }  
    
 }
 




