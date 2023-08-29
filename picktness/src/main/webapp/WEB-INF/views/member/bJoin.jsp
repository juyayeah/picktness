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
$(function() {
        $('#domain-list').change(function() {
            if ($('#domain-list').val() == 'directly') {
                $('#domain-txt2').attr("disabled", false);
                $('#domain-txt2').val("");
                $('#domain-txt2').focus();
            } else {
                $('#domain-txt2').val($('#domain-list').val());
            }
        })
    });
</script>
<style>
    hr{
        border-color: #2890F1;
    }
a{text-decoration: none;}
.clearfix::after{content: "";display: block;clear: both;}
#joinForm{width: 460px;margin: 0 auto;}
ul.join_box{border: 1px solid #ddd;background-color: #fff;}
.checkBox,.checkBox>ul{position: relative;}
.checkBox>ul>li{float: left;}
.checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: black;}
.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
.checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #f7f7f7;color: rgba(92, 91, 91, 0.815);; border: none;}
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


    
    .input-small {
    width: 280px;
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
    margin-top: 30px;
    margin-bottom: 30px;
    margin-left: 464.5px;
    background-color: #fff;
    border-radius: 10px;
    padding: 50px 50px 20px 50px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    
}


.form-row, .form-row2 {
    font-weight: bold;
    margin-bottom: 5px;
    
}

input {
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
    width: 35%;
    
}

.select-box {
 
  height: 35px;
  box-sizing: border-box;
  margin-left: 5px;
  padding: 5px 0 5px 10px;
  border-radius: 4px;
  border: 1px solid #d9d6d6;
  color: #383838;
  background-color: #ffffff;
  font-family: 'Montserrat', 'Pretendard', sans-serif;
}


.info .box#domain-list option {
  font-size: 14px;
  background-color: #ffffff;
}
.joinButton {
    padding: 10px;
    background-color: #2890F1;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s;

}

.joinButton:hover {
    background-color: #1d6fa5;
}

.label-with-star {
    color: #2890F1;
}


.phone-input{
    width: 50px;
}
.textarea{
	width:500px; 
	height:100px; 
    resize:none;
    outline:none;
    
}
</style>
<body style="background-color: white;">
    
      <div class="signup-container">
        <h1 style="text-align: center;">회원가입</h1><br>
        <div class="cation">
        <span class="label-with-star">*</span>필수 입력 사항
        </div>
        <h2>사업자정보</h2>
        <hr><br>
        <form action="${contextPath}/member/addB_Member.do" method="post">
            <div class="form-row">
                <label for="b_number">사업자번호<span class="label-with-star">*</span></label><br>
               <input type="text" id="b_number" name="b_number" placeholder="영소문자/숫자 4 ~ 16자" required >
           </div>
            <div class="form-row">
                 <label for="b_name">시설명<span class="label-with-star">*</span></label><br>
                <input type="text" id="b_name" name="b_name" placeholder="상호명을 입력해주세요" required >
            </div>
            <div class="form-row">
                <label for="b_bank">은행선택<span class="label-with-star">*</span></label><br>
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
</div>
            <div class="form-row">
                <label for="b_account">계좌번호<span class="label-with-star">*</span></label><br>
                <input type="text" id="b_account" name="b_account" placeholder="1234567890(-없이 입력해주세요)" required>
            </div>
            <div class="form-row">
        <label for="addr">사업자소재지<span class="label-with-star">*</span></label><br>
		<input style="width: 100px;" type="text"  id="zip_code" name="zipcode" onclick="openZipSearch();" readonly="readonly" placeholder="우편번호">
		<button class="address-button" type="button" onclick="openZipSearch()">주소 찾기</button><br>
		<input type="text"  id="addr" name="addrBasic" readonly="readonly" placeholder="기본주소"  style="width:250px;"><br>
		<input type="text"  id="addr_dtl" name="addrDetail" placeholder="상세주소"  style="width:250px;">
	
	</div>
    <div class="form-row2">
		<label for="phoneNum">휴대전화<span class="label-with-star">*</span></label><br>
                <input type="text" id="phone1" name="phone1" class="phone-input" maxlength="3" onkeyup="formatPhoneNumber()">
                <span>-</span>
                <input type="text" id="phone2" name="phone2" class="phone-input" maxlength="4" onkeyup="formatPhoneNumber()">
                <span>-</span>
                <input type="text" id="phone3" name="phone3" class="phone-input" maxlength="4" onkeyup="formatPhoneNumber()">
            </div>
            <input type="hidden" id="formatted-phone" name="formatted-phone" readonly>
            <br><br>
            <h2>정보입력</h2>
            <hr><br>
            <div class="form-row">
                <label for="id">아이디<span class="label-with-star">*</span></label><br>
               <input type="text" id="id" name="id" placeholder="영소문자/숫자 4 ~ 16자" required >
           </div>
           <div class="form-row">
               <label for="pwd">비밀번호<span class="label-with-star">*</span></label><br>
               <input type="password" id="pwd" name="pwd" placeholder="최소6자 이상(알파벳, 숫자 필수)" required>
           </div>
           <div class="form-row">
               <label for="password">비밀번호 재확인<span class="label-with-star">*</span></label><br>
               <input type="password" id="password" placeholder="비밀번호를 다시 입력해주세요." required>
           </div>
           <div class="form-row">
               <label for="name">이름<span class="label-with-star">*</span></label><br>
               <input type="text" id="name" name="name" required>
           </div>
<div class="form-row">
        <label for="email">이메일<span class="label-with-star">*</span></label><br>
        <input type="text" id="domain-txt1" name="email1" placeholder="인증에 사용됩니다."  style="width: 150px;">
        <span>@</span>
        <input type="text" class="box" id="domain-txt2" name="email2"  style="width: 150px;">
<select class="select-box" id="domain-list" style="width: 150px;">
    <option value="">이메일 선택</option>
    <option value="">직접입력</option>
    <option value="google.com"> google.com </option>
    <option value="naver.com"> naver.com </option>
    <option value="hanmail.com"> hanmail.com </option>
    <option value="nate.com"> nate.com </option>
    <option value="yahoo.com"> yahoo.com </option>
    <option value="hotmail.com"> hotmail.com </option>
    <option value="dreamwiz.com"> dreamwiz.com </option>
    <option value="freechal.com"> freechal.com </option>
    <option value="hanmir.com"> hanmir.com </option>
</select>
          <button class="address-button" type="button" onclick="">인증번호 받기</button>
		<div class="form-row">
                <label for="verification-code">인증번호<span class="label-with-star">*</span></label><br>
                <input type="text" id="verification-code" name="verification-code"  placeholder="인증번호 6자리를 입력해주세요."  required>
                <button class="address-button" type="button" onclick="verifyCode()">확인</button>
            </div>
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>전자상거래 표준약관, 이용약관, 개인정보 수집 및 이용, 
                            위치정보 이용약관(선택)<br> 프로모션 안내
                            메일 수신(선택)에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" name="chkAll" id="chkAll" class="chkAll">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <ul class="clearfix">
                        <li>회원 이용 약관<span class="label-with-star">(필수)*</span></li>
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
                        <li>개인정보 수집 및 이용에 대한 안내<span class="label-with-star">(필수)*</span></li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk">
                        </li>
                    </ul>
 
                    <textarea name="" id="" readonly>개인정보의 수집 및 이용목적

개인정보 이용목적

1. 회원가입 시 수집하는 개인정보의 범위
            
[개인정보 수집목적]
"픽트니스"의 유료 서비스 이용자는 결제 수단 등록 시 선택하신 결제 수단에 따른 추가 정보를 등록하셔야 합니다.
유료 서비스 이용자는 전자우편(이메일) 주소와 함께 이용자가 선택한 결제 수단 유형에 따라 신용카드 결제를 원하시는 분은 신용카드 번호, 신용카드 회사명 등을
휴대폰 결제를 원하는 이용자는 휴대폰 번호, 자동이체 결제를 선택하면 자동이체 은행명, 계좌번호, 예금주 등 결제 관련 정보를 필수적으로 입력해야 합니다.
결제 관련 정보는 유료 서비스 이용자에 한해 입력하시면 되며, 입력하신 결제 정보는 대금 결제 이외의 어떠한 목적으로도 사용되지 않습니다.
또한 "회사" 및 "픽트니스"가 주관하는 설문 조사나 이벤트 행사 시 통계 분석이나 경품 제공 등을 위해
선별적으로 개인정보 입력을 요청할 수 있습니다. 그러나 이러한 경우에도 이용자의 기본적 인권침해의 우려가 있는 민감한  개인정보(인종, 사상 및 신조, 출신지
및 본적지, 정치적 성향 및 범죄기록, 성생활 등)는 가급적 수집하지 않으며 부득이하게 수집하는 경우 이용자들의 사전 동의를 반드시 구할 것입니다.
"회사"는 입력하신 정보를 이용자들에게 사전에 밝힌 목적 이외에 다른 목적으로는 사용하지 않으며 외부로 유출하지 않습니다.
단, 제휴 및 법인교육 등을 이유로 링크되어 있는 웹사이트들이 개인정보를 수집하는 행위에 대해서는 "회사"의 '개인정보 취급방침'이 적용되지 않음을 알려드립니다.
                        
개인정보의 수집범위
1. 회원가입 시 수집하는 개인정보의 범위
<일반회원 가입 시>
* 필수항목 : 회원 ID, 비밀번호, 이름, 생년월일, 이메일, 주소, 전화번호, 휴대폰 번호
                        
2. 유료 결제 이용 시 수집하는 개인정보의 범위
* 결제 방법에 따라 은행계좌 정보, 신용카드 정보, 휴대폰 번호, 전화번호
* 배송에 필요한 받는 사람의 이름, 주소, 우편번호 연락처
                        
3. 개인정보 이외의 항목
* 선택 항목 : "픽트니스"에서 필요한 추가 항목 및 이벤트 관련 배송정보
* 서비스 이용 관련 : 결제기록, 접속 로그, 서비스 이용 기록
                
[개인정보의 보유 및 이용기간]
"회원"으로서 "회사" 및 "픽트니스"가 제공하는 "서비스"를 이용하는 동안 "회사"는 "회원"들의 개인정보를 보유하며 "서비스" 제공 등을 위해
이용합니다. 다만, 아래의 "회원" 본인의 개인정보 관리(열람, 정정, 삭제 등)에 관한 사항에서 설명한 절차와 방법에 따라 "회원" 본인이 직접 삭제하거나 수정한
정보, 가입 해지를 요청한 경우에는 재생할 수 없는 방법에 의하여 완전히 삭제하며 추후 열람이나 이용이 불가능한 상태로 처리됩니다.
단, 다음과 같이 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우에는 일정기간 보유합니다.
    - 계약 또는 청약 철회 등에 관한 기록 : 5년
    - 대금 결제 및 재화 등의 공급에 관한 기록 : 5년
    - 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
                        
“회사”는 귀중한 회원의 개인정보를 안전하게 처리하며, 유출의 방지를 위하여 다음과 같은 방법을 통하여 개인정보를 파기합니다.
    - 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.
    - 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
                        </textarea>
                </li>
                <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk">
                        </li>
                    </ul>
 
                    <textarea name="" id="" readonly>제 2조 (정의) ① "판매자"라 함은 [사업자 등록번호], 주소 [주소], 연락처 [연락처]로 사업자 등록된 자로서, 상품 또는 용역을 이용자에게 제공하는 자를 말합니다. ② "구매자"라 함은 "판매자"와 이 약관에 따라 상품 또는 용역의 구매계약을 체결하는 자를 말합니다. ③ "이용자"라 함은 쇼핑몰에 접속하여 이 약관에 따라 판매자가 제공하는 상품 및 용역을 이용하는 자를 말합니다.</textarea>
                </li>
                <li class="checkBox check04">
                    <ul class="clearfix">
                        <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk">
                        </li>
                    </ul>
                    <textarea name="" id="" readonly>개인정보의 수집 및 이용[선택]
회사는 새로운 상품의 안내, 마케팅 (전화, 이메일)을 통하여 정보를 제공합니다</textarea>
                </li>
            </ul>
        

            <button type="submit">가입하기</button>
        </form>
    </div>
</body>
</html>
