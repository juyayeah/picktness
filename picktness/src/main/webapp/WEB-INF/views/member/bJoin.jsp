<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>사업자 회원가입</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
    const chkAll = document.getElementById('chkAll');
    const checkboxes = document.querySelectorAll('.checkBox input[type="checkbox"]:not(#chkAll)');

    chkAll.addEventListener('click', function() {
        const isChecked = chkAll.checked;

        checkboxes.forEach(function(checkbox) {
            checkbox.checked = isChecked;
        });
    });
});
function openZipSearch() {
    new daum.Postcode({
    	oncomplete: function(data) {     
		var addr = ''; 
		if (data.userSelectedType === 'R') { 
			addr = data.roadAddress;
		} else {
			addr = data.jibunAddress;
		}

		$("#zip_code").val(data.zonecode);
		$("#addr").val(addr);
		$("#addr_dtl").val("");
		$("#addr_dtl").focus();
        }
    }).open();
}

function updateEmailInput() {
    var select = document.getElementById('email-select');
    var emailInput = document.getElementById('email');
    var selectedEmail = select.value;
    
    if (selectedEmail !== '') {
        emailInput.value = selectedEmail;
    } else {
        emailInput.value = '';
    }
}

function sendVerificationCode() {
    // 이메일 인증번호를 전송하는 로직을 구현하세요.
    // 여기서는 간단하게 경고창을 띄워보겠습니다.
    alert("이메일 인증번호를 전송했습니다.");
}

function verifyCode() {
    var inputCode = document.getElementById('verification-code').value;
    var generatedCode = "123456"; // 여기에 실제로 생성된 인증번호를 가져와야 합니다.
    
    if (inputCode === generatedCode) {
        alert("인증되었습니다.");
    } else {
        alert("인증번호가 일치하지 않습니다.");
    }
}
//휴대폰 입력 넘기기
function formatPhoneNumber() {
    var input1 = document.getElementById('phone1');
    var input2 = document.getElementById('phone2');
    var input3 = document.getElementById('phone3');
    
    var phoneNumber = input1.value + '-' + input2.value + '-' + input3.value;
    document.getElementById('formatted-phone').value = phoneNumber;
}
</script>
<style>
*{margin: 0;padding: 0;box-sizing: border-box}
body{background-color: #f7f7f7;}
ul>li{list-style: none}
a{text-decoration: none;}
.clearfix::after{content: "";display: block;clear: both;}
#joinForm{width: 460px;margin: 0 auto;}
ul.join_box{border: 1px solid #ddd;background-color: #fff;}
.checkBox,.checkBox>ul{position: relative;}
.checkBox>ul>li{float: left;}
.checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #888;}
.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
.checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none;}
.footBtwrap{margin-top: 15px;}
.footBtwrap>li{float: left;width: 50%;height: 60px;}
.footBtwrap>li>button{display: block; width: 100%;height: 100%; font-size: 20px;text-align: center;line-height: 60px;}

#chkAll {
        /* 원하는 크기 값으로 조절 */
        width: 20px;
        height: 20px;
    }
input[type="checkbox"][name="chk"] {
        /* 원하는 크기 값으로 조절 */
        width: 20px;
        height: 20px;
    }

hr {
    border-color: #2890F1;
}

.cation{
    text-align: right;
}
.address-container {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}
.address-button {
    padding: 10px;
    background-color: #2890F1;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s;
}

.address-button:hover {
    background-color: #1d6fa5;
}

.signup-container {
 	width: 50%;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    
}

form {
    display: flex;
    flex-direction: column;
}

label {
    font-weight: bold;
    margin-bottom: 5px;
}

input {
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
    width: 40%;
    
}

button {
    padding: 10px;
    background-color: #2890F1;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #1d6fa5;
}

.label-with-star {
    color: #2890F1;
}


.phone-input{
    width: 10%;
}
textarea{
	width:500px; 
	height:100px; 
    resize:none;
    outline:none;
    
}
</style>
<body>
    
      <div class="signup-container">
        <h1 style="text-align: center;">회원가입</h1><br>
        <div class="cation">
        <span class="label-with-star">*</span>필수 입력 사항
        </div>
        <h2>사업자정보</h2>
        <br><hr><br>
        <form action="register.php" method="post">
            <div class="form-row">
                <label for="b_number">사업자번호<span class="label-with-star">*</span></label>
               <input type="text" id="b_number" name="b_number" placeholder="영소문자/숫자 4 ~ 16자" required >
           </div>
            <div class="form-row">
                 <label for="b_name">시설명<span class="label-with-star">*</span></label>
                <input type="text" id="b_name" name="b_name" placeholder="상호명을 입력해주세요" required >
            </div>
            <div class="form-row">
                <label for="b_bank">은행선택<span class="label-with-star">*</span></label>
                <select name="b_bank" id="b_bank" >
                    <option value=''>-선택-</option>
                    <option value='SC제일은행'>SC제일은행</option>
                    <option value='경남은행'>경남은행</option>
                    <option value='광주은행'>광주은행</option>
                    <option value='국민은행'>국민은행</option>         
                    <option value='기업은행'>기업은행</option>               
                    <option value='농협중앙회'>농협중앙회</option>                 
                    <option value='대구은행'>대구은행</option>                
                    <option value='부산은행'>부산은행</option>                 
                    <option value='산업은행'>산업은행</option>                 
                    <option value='상호신용금고'>상호신용금고</option>                 
                    <option value='새마을금고'>새마을금고</option>            
                    <option value='수협중앙회'>수협중앙회</option>            
                    <option value='신한은행'>신한은행</option>          
                    <option value='신협중앙회'>신협중앙회</option>          
                    <option value='외환은행'>외환은행</option>          
                    <option value='우리은행'>우리은행</option>          
                    <option value='우체국'>우체국</option>           
                    <option value='전북은행'>전북은행</option>          
                    <option value='제주은행'>제주은행</option>          
                    <option value='하나은행'>하나은행</option>        
                    <option value='한국씨티은행'>한국씨티은행</option>               
                    <option value='홍콩상하이은행'>홍콩상하이은행</option>            
                 </select>
          <button class="address-button" type="button" onclick="">인증번호 받기</button>
</div>
            <div class="form-row">
                <label for="b_account">계좌번호<span class="label-with-star">*</span></label>
                <input type="text" id="b_account" name="b_account" placeholder="1234567890(-없이 입력해주세요)" required>
            </div>
            <div class="form-row">
        <label for="addr">사업자소재지<span class="label-with-star">*</span></label>
		<input style="width: 100px;" type="text"  id="zip_code" name="zipcode" onclick="openZipSearch();" readonly="readonly" placeholder="우편번호">
		<button class="address-button" type="button" onclick="openZipSearch()">주소 찾기</button><br>
		<input type="text"  id="addr" name="addrbasic" readonly="readonly" placeholder="기본주소"  style="width:250px;"><br>
		<input type="text"  id="addr_dtl" name="addrdetail" placeholder="상세주소"  style="width:250px;">
	
	</div>
    <div class="form-row2">
		<label for="phoneNum">휴대전화<span class="label-with-star">*</span></label>
                <input type="text" id="phone1" class="phone-input" maxlength="3" onkeyup="formatPhoneNumber()">
                <span>-</span>
                <input type="text" id="phone2" class="phone-input" maxlength="4" onkeyup="formatPhoneNumber()">
                <span>-</span>
                <input type="text" id="phone3" class="phone-input" maxlength="4" onkeyup="formatPhoneNumber()">
            </div>
            <input type="hidden" id="formatted-phone" name="formatted-phone" readonly>
            <br><br>
            <h2>정보입력</h2>
            <br><hr><br>
            <div class="form-row">
                <label for="id">아이디<span class="label-with-star">*</span></label>
               <input type="text" id="id" name="id" placeholder="영소문자/숫자 4 ~ 16자" required >
           </div>
           <div class="form-row">
               <label for="pwd">비밀번호<span class="label-with-star">*</span></label>
               <input type="password" id="pwd" name="pwd" placeholder="최소6자 이상(알파벳, 숫자 필수)" required>
           </div>
           <div class="form-row">
               <label for="password">비밀번호 재확인<span class="label-with-star">*</span></label>
               <input type="password" id="password" name="password" placeholder="비밀번호를 다시 입력해주세요." required>
           </div>
           <div class="form-row">
               <label for="name">이름<span class="label-with-star">*</span></label>
               <input type="text" id="name" name="name" required>
           </div>
<div class="form-row">
                <label for="email">이메일<span class="label-with-star">*</span></label>
                <input type="text" id="email" name="email" placeholder="인증 절차에 사용됩니다." required>
                <select name="mail">
            <option value="">이메일 선택</option>
            <option value="1">직접입력</option>
            <option value="google.com"> google.com </option>
            <option value="naver.com"> naver.com </option>
            <option value="naver.com"> naver.com </option>
            <option value="naver.com"> naver.com </option>
            <option value="naver.com"> naver.com </option>
            <option value="naver.com"> naver.com </option>
            <option value="naver.com"> naver.com </option>
            <option value="naver.com"> naver.com </option>
            <option value="naver.com"> naver.com </option>
            <option value="naver.com"> naver.com </option>
            <option value="naver.com"> naver.com </option>
            <option value="naver.com"> naver.com </option>
            
            <option value="none"> 선택 안함 </option>
          </select>
          <button class="address-button" type="button" onclick="">인증번호 받기</button>
</div>
		<div class="form-row">
                <label for="verification-code">인증번호<span class="label-with-star">*</span></label>
                <input type="text" id="verification-code" name="verification-code"  placeholder="인증번호 6자리를 입력해주세요."  required>
                <button class="address-button" type="button" onclick="verifyCode()">확인</button>
            </div>
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용,
                            위치정보 이용약관(선택)<br> 프로모션 안내
                            메일 수신(선택)에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" name="chkAll" id="chkAll" class="chkAll">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk"> 
                        </li>
                    </ul>
                    <textarea name="" id="" readonly>여러분을 환영합니다.
픽트니스 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 픽트니스 서비스의 이용과 관련하여 픽트니스 서비스를 제공하는 ㅍ 주식회사(이하 픽트니스)와 이를 이용하는 픽트니스 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 픽트니스 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk">
                        </li>
                    </ul>
 
                    <textarea name="" id="" readonly>여러분을 환영합니다.
픽트니스 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 픽트니스 서비스의 이용과 관련하여 픽트니스 서비스를 제공하는 픽트니스 주식회사(이하 픽트니스)와 이를 이용하는 픽트니스 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 픽트니스 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk">
                        </li>
                    </ul>
 
                    <textarea name="" id="" readonly>여러분을 환영합니다.
픽트니스 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 픽트니스 서비스의 이용과 관련하여 픽트니스 서비스를 제공하는 픽트니스 주식회사(이하 픽트니스)와 이를 이용하는 픽트니스 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 픽트니스 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
       </textarea>
                </li>
                <li class="checkBox check04">
                    <ul class="clearfix">
                        <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk">
                        </li>
                    </ul>
 
                </li>
            </ul>
        

            <button type="submit">가입하기</button>
        </form>
    </div>
</body>
</html>
