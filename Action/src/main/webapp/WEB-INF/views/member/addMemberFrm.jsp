<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- style --%>
<meta charset="UTF-8">
   <style type="text/css">
   th{
      width: 50px;
   }
   <style>
   body {
     color: #666;
     font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
   }
   table {
     border-collapse: separate;
     border-spacing: 0;
     width: 2000px;
     margin: auto;
   }
   th,   td {
     padding: 6px 15px;
   }
   th {
     background: #42444e;
     color: #fff;
     text-align: center;
   }
   tr:first-child th:first-child {
     border-top-left-radius: 6px;
   }
   tr:first-child th:last-child {
     border-top-right-radius: 6px;
   }
   td {
     border-right: 1px solid #c6c9cc;
     border-bottom: 1px solid #c6c9cc;
   }
   td:first-child {
     border-left: 1px solid #c6c9cc;
   }
   tr:nth-child(even) td {
     background:   #C0C0C0;
   }
   tr:last-child td:first-child {
     border-bottom-left-radius: 6px;
   }
   tr:last-child td:last-child {
     border-bottom-right-radius: 6px;
   }
   #searchDiv, #tableDiv {
      text-align: center;
   }
   .writeSpan1 {
      position: relative;
      left: 160px;
   }
   .writeSpan2 {
      position: relative;
      left: 1010px;
   }
   </style>

<title>회원가입</title>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 상세주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = '';
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
            }
        }).open();
    }
</script>

<%--id중복, 비밀번호 확인 유효성 검사 처리 --%>
<script type="text/javascript">
	$(function() {
		var idCheck = false;
		var pwCheck = false;
	});
</script>


</head>
<body>
<section class="bg">
<!-- M_NO, M_ID, M_PW, M_NAME, GENDER, EMAIL, ADDR, GRADE -->
<h2>회원가입 양식</h2>

<form name="form1" method="post" action="/member/insert.do">
		
		<table border="1" style="width: 400px">
			<tr>
				<td>아이디</td>
				<td><input name="memId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="memName"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><label><input type="radio" name="gender" value="0"/>남자</label>
					<label><input type="radio" name="gender" value="1"/>여자</label></td>
			</tr>
							
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email"></td>
				
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name ="postcode" id="postcode" placeholder="우편번호" readonly>
					<input type="button"  onclick="execDaumPostcode()" value="우편번호 찾기" readonly><br>
					<input type="text" name="address" id="address" placeholder="주소" readonly><br>
					<input type="text" name="extraAddress" id="extraAddress" placeholder="상세주소" >
				</td>
			</tr>	
			<tr>
				<td colspan="2" align="center"><input type="submit" value="회원가입하기"></td>
			</tr>
		</table>
					
					
	</form>
	</section>
</body>
</html>