<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript">



	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}


</script>
</head>
<body>
<section class ="bg">

   <div>
           <h1>아이디 찾기</h1>
           <p>가입 시 입력한 이메일을 입력해주세요!</p>
       </div>
       <form class="member" action="/member/findId" method="POST">
           <div>
               <input type="email" id="email"  name="email" placeholder="Enter Email Address">
           </div>
      
           <div>
               <input type="text" id="memName"  name="memName" placeholder="Enter Your Name">
           </div>
      
      
           <button type="submit"> 아이디찾기</button>
       </form>
     
       <a href="/member/login.do">로그인</a>
          <div>
           <a href="/">메인페이지</a>
    	 </div>
     </section>
</body>
</html>