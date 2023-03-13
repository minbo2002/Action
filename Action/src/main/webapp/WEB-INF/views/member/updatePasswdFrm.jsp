<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script type="text/javascript">



	var msg = "${msg}";
		 
		if (msg != "") {
			alert(msg);
		}


</script>
</head>
<body>
<section class ="bg">

   <div class="text-center">
           <h1>비밀번호 변경</h1>
           <p>이메일을 입력해주세요!</p>
       </div>
       <form class="member" action="/member/updatePasswd" method="POST">
           <div>
               <input type="text" id="memId"  name="memId" placeholder="Enter Your Id">
           </div>
      
           <div>
               <input type="text" id="memName"  name="memName" placeholder="Enter Your Name">
           </div>
           
           <div>
               <input type="email" id="email"  name="email" placeholder="Enter Your Email">
           </div>
           
      
           <button type="submit">비밀번호 변경 </button>
       </form>
       <hr>
     
       <a href="/member/login.do">로그인 </a>
           <hr>
          <div class="text-center">
           <a class="small" href="/">메인페이지</a>
     </div>
     </section>
</body>
</html>