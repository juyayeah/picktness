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
<script
    type="text/javascript"
    src="https://code.jquery.com/jquery-1.10.2.min.js"
  ></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script
    type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abeab8cce28d6c80ad107bfe4e602d58&libraries=services"
  ></script>
  <script>
    //아이디 실시간 검사
    function checkId() {
      var id = $("#id").val();

      $.ajax({
        url: "${contextPath}/member/bIdCheck",
        type: "post",
        data: { id: id },
        success: function (cnt) {
          if (cnt != 1 && id.length > 3) {
            $(".id_ok").css("display", "inline-block");
            $(".id_already").css("display", "none");
          } else if (cnt == 1 && id.length > 3) {
            $(".id_already").css("display", "inline-block");
            $(".id_ok").css("display", "none");
          } else {
            $(".id_ok").css("display", "none");
            $(".id_already").css("display", "none");
          }
        },
        error: function (request, error) {
          alert(
            "code:" +
              request.status +
              "\n" +
              "message:" +
              request.responseText +
              "\n" +
              "error:" +
              error
          );
        },
      });
    }

    window.onload = function () {
      const passwordInput = document.getElementById("pwd");
      const passwordConfirmInput = document.getElementById("passwordConfirm");
      const passwordError = document.getElementById("passwordError");

      //비밀번호 일치 여부 확인
      function checkPasswordMatch() {
        if (passwordInput.value !== passwordConfirmInput.value) {
          passwordError.textContent = "비밀번호가 일치하지 않습니다.";
          passwordError.style.color = "red";
          passwordError.style.fontWeight = "normal";
          passwordError.style.fontSize = "14px";
        } else {
          passwordError.textContent = "비밀번호가 일치합니다.";
          passwordError.style.color = "#2890F1";
          passwordError.style.fontWeight = "normal";
          passwordError.style.fontSize = "14px";
        }
      }

      // 비밀번호 입력 시 이벤트 처리
      passwordInput.addEventListener("input", () => {
        validatePassword(passwordInput.value);
        checkPasswordMatch(); // 비밀번호 입력이 변경되면 재확인 입력도 확인
      });

      // 비밀번호 재확인 입력 시 이벤트 처리
      passwordConfirmInput.addEventListener("input", () => {
        checkPasswordMatch(); // 재확인 입력이 변경되면 확인
      });

      const idInput = document.getElementById("id");
      const idCheck = document.createElement("span");
      idCheck.classList.add("validation-message");
      idInput.parentElement.appendChild(idCheck);

      const pwdInput = document.getElementById("pwd");
      const pwdError = document.createElement("span");
      pwdError.classList.add("validation-message");
      pwdInput.parentElement.appendChild(pwdError);

      idInput.addEventListener("input", () => {
        validateId(idInput.value);
      });

      pwdInput.addEventListener("input", () => {
        validatePassword(pwdInput.value);
      });

      function validateId(id) {
        if (/^[a-zA-Z0-9]{4,16}$/.test(id)) {
          idCheck.textContent = "";
          idCheck.style.color = "#2890F1";
          idCheck.style.fontWeight = "normal";
          idCheck.style.fontSize = "14px";
        } else {
          idCheck.textContent = "4~16자 이내, 영문, 숫자를 사용해주세요.";
          idCheck.style.color = "#FF0000";
          idCheck.style.fontWeight = "normal";
          idCheck.style.fontSize = "14px";
        }
      }

      function validatePassword(password) {
        if (/^[a-zA-Z0-9]{6,16}$/.test(password)) {
          pwdError.textContent = "사용 가능한 비밀번호입니다.";
          pwdError.style.color = "#2890F1";
          pwdError.style.fontWeight = "normal";
          pwdError.style.fontSize = "14px";
        } else {
          pwdError.textContent = "사용할 수 없는 비밀번호입니다.";
          pwdError.style.color = "#FF0000";
          pwdError.style.fontWeight = "normal";
          pwdError.style.fontSize = "14px";
        }
      }
    };

    function sendVerificationCode() {
      var domain1 = $("#domain-txt1").val();
      var domain2 = $("#domain-txt2").val();
      var fullEmail = domain1 + "@" + domain2;

      if (domain2.length > 0 && domain2.length <= 20) {
        var allDomains = [
          "google.com",
          "naver.com",
          "hanmail.com",
          "nate.com",
          "yahoo.com",
          "hotmail.com",
          "dreamwiz.com",
          "freechal.com",
          "hanmir.com",
        ];

        if (allDomains.includes(domain2)) {
          $.ajax({
            url: "${contextPath}/member/bEmailCheck",
            type: "post",
            data: { email1: domain1,
            		email2: domain2},
            success: function (cnt) {
              if (cnt == 0) {
                $.ajax({
                  type: "POST",
                  url: "${contextPath}/api/mail",
                  data: {
                    email: fullEmail,
                    type: "join",
                  },
                  success: function (data) {
                    alert("인증번호가 발송되었습니다");
                    console.log("data: " + data);
                    serverVerificationCode = data; // 어디서 선언되었는지 확인 후 필요하다면 수정
                  },
                });
              } else {
                alert("이미 사용 중인 이메일 주소입니다.");
              }
            },
            error: function (request, error) {
              alert(
                "code:" +
                  request.status +
                  "\n" +
                  "message:" +
                  request.responseText +
                  "\n" +
                  "error:" +
                  error
              );
            },
          });
        } else {
          alert("올바른 이메일 형식이 아닙니다.");
          $("#domain-txt2").focus();
        }
      } else {
        alert("올바른 이메일 형식이 아닙니다.");
        $("#domain-txt2").focus();
      }
    }

    var serverVerificationCode = ""; // 서버에서 받은 인증번호를 저장할 변수
    function verifyCode() {
      // 사용자가 입력한 인증번호
      var userEnteredCode = $("#verification-code").val();
      var isEmailVerified = false;

      if (userEnteredCode === serverVerificationCode) {
        alert("인증이 성공했습니다!");
        isEmailVerified = true;
        // 인증 성공 시 추가 동작을 여기에 추가할 수 있음
      } else {
        alert("인증번호가 일치하지 않습니다. 다시 확인해주세요.");
      }
      return isEmailVerified;
    }
    //주소 입력
    function openZipSearch() {
      new daum.Postcode({
        oncomplete: function (data) {
          var addr = "";
          if (data.userSelectedType === "R") {
            addr = data.roadAddress;
          } else {
            addr = data.jibunAddress;
          }

          $("#zip_code").val(data.zonecode);
          $("#addr").val(addr);
          $("#addr_dtl").val("");
          $("#addr_dtl").focus();
          var geocoder = new kakao.maps.services.Geocoder();
          var rocation = $("#addr").val();
          geocoder.addressSearch(rocation, function (result, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {
              var lat = result[0].y;
              var lng = result[0].x;
              $("#lat").attr("value", lat);
              $("#lng").attr("value", lng);
            }
          });
        },
      }).open();
    }

    function updateEmailInput() {
      var select = document.getElementById("email-select");
      var emailInput = document.getElementById("email");
      var selectedEmail = select.value;

      if (selectedEmail !== "") {
        emailInput.value = selectedEmail;
      } else {
        emailInput.value = "";
      }
    }

    //이메일 셀렉트 박스
    $(function () {
      $("#domain-list").change(function () {
        if ($("#domain-list").val() == "directly") {
          $("#domain-txt2").attr("disabled", false);
          $("#domain-txt2").val("");
          $("#domain-txt2").focus();
        } else {
          $("#domain-txt2").val($("#domain-list").val());
        }
      });
    });

    //휴대폰 입력 넘기기
    function formatPhoneNumber() {
      var input1 = document.getElementById("phone1");
      var input2 = document.getElementById("phone2");
      var input3 = document.getElementById("phone3");

      var phoneNumber = input1.value + "-" + input2.value + "-" + input3.value;
      document.getElementById("formatted-phone").value = phoneNumber;
    }

    //약관동의 전체선택
    function checkboxAll(checkbox) {
      var allCheckboxes = checkbox
        .closest(".join_box")
        .querySelectorAll('input[type="checkbox"]');

      for (var i = 0; i < allCheckboxes.length; i++) {
        allCheckboxes[i].checked = checkbox.checked;
      }
    }

    //위도 경도 찾는 함수
    function latLng() {
      var geocoder = new kakao.maps.services.Geocoder();
      var rocation = $("#addr").val();

      geocoder.addressSearch(rocation, function (result, status) {
        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {
          var lat = result[0].y;
          var lng = result[0].x;
          alert("해보기");
          $("#lat").attr("value", lat);
          $("#lng").attr("value", lng);
          alert(lat);
        } else {
          alert("못 찾음");
        }
      });
      return 1;
    }

    //필수란 체크
    function validateAndSubmitForm() {
      var idInput = document.getElementById("id");
      var pwdInput = document.getElementById("pwd");
      var passwordConfirmInput = document.getElementById("passwordConfirm");
      var nameInput = document.getElementById("name");
      var zip_codeInput = document.getElementById("zip_code");
      var email1Input = document.getElementById("domain-txt1");
      var email2Input = document.getElementById("domain-txt2");
      var phone1Input = document.getElementById("phone1");
      var phone2Input = document.getElementById("phone2");
      var phone3Input = document.getElementById("phone3");
      var agreementCheck1 = document.getElementById("chk_2");
      var agreementCheck2 = document.getElementById("chk_3");

      // 입력 값 검사
      if (idInput.value.trim() === "") {
        alert("아이디를 입력해주세요.");
        idInput.focus();
        return false;
      }

      // 아이디 유효성 검사
      var username = idInput.value.trim();
      if (!/^[a-zA-Z0-9]{4,16}$/.test(username)) {
        idInput.focus();
        return false;
      } else {
        var idCheckMessage = document.getElementById("idCheck");
        idCheckMessage.textContent = "";
      }

      if (pwdInput.value.trim() === "") {
        alert("비밀번호를 입력해주세요.");
        pwdInput.focus();
        return false;
      }

      // 비밀번호 유효성 검사
      var password = pwdInput.value.trim();
      if (!/^[a-zA-Z0-9]{6,16}$/.test(password)) {
        pwdInput.focus();
        return false;
      } else {
        pwdError.textContent = "";
      }

      if (pwdInput.value.trim() !== passwordConfirmInput.value.trim()) {
        alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
        passwordConfirmInput.focus();
        return false;
      }

      if (nameInput.value.trim() === "") {
        alert("이름을 입력해주세요.");
        nameInput.focus();
        return false;
      }

      if (zip_codeInput.value.trim() === "") {
        alert("주소를 입력해주세요.");
        zip_codeInput.focus();
        return false;
      }

      //이메일

      if (email1Input.value.trim() === "") {
        alert("이메일을 입력해주세요.");
        email1Input.focus();
        return false;
      }

      var allDomains = [
        "google.com",
        "naver.com",
        "hanmail.com",
        "nate.com",
        "yahoo.com",
        "hotmail.com",
        "dreamwiz.com",
        "freechal.com",
        "hanmir.com",
      ];

      var email2Value = email2Input.value.trim();
      if (!allDomains.includes(email2Value)) {
        alert("올바른 도메인 이메일을 입력해주세요.");
        email2Input.focus();
        return false;
      }

      if (phone1Input.value.trim() !== "010") {
        alert("올바른 번호를 입력해주세요.");
        phone1Input.focus();
        return false;
      }

      if (phone2Input.value.trim() === "") {
        alert("번호를 입력해주세요.");
        phone2Input.focus();
        return false;
      }

      if (phone3Input.value.trim() === "") {
        alert("번호를 입력해주세요.");
        phone3Input.focus();
        return false;
      }

      if (!agreementCheck1.checked) {
        alert("회원 이용 약관에 동의해주세요.");
        return false;
      }

      if (!agreementCheck2.checked) {
        alert("개인정보 수집 및 이용에 대한 안내에 동의해주세요.");
        return false;
      }

      /*    // 도메인 유효성 검사 함수
function isValidEmailDomain(domain) {
    var validDomains = [
        "google.com", "naver.com", "hanmail.com", "nate.com",
        "yahoo.com", "hotmail.com", "dreamwiz.com", "freechal.com", "hanmir.com"
    ];

    return validDomains.includes(domain);
} */

      return true;
    }
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
input[type="checkbox"] {
      width: 20px;
      height: 20px;
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
        <h2>사업자 정보</h2>
        <hr><br>
        <div class="form-row">
            <label for="id">아이디<span class="label-with-star">*</span></label
                ><br />
                <input
                  type="text"
                  id="id"
                  name="id"
                  placeholder="아이디(4~16자 이내, 영문, 숫자 사용 가능)"
                  class="input-small"
                  oninput="checkId()"
                />
                <span id="idCheck" class="validation-message"></span><br />
                <span
                  class="id_ok"
                  style="
                    color: #2890f1;
                    font-size: 14px;
                    font-weight: normal;
                    display: none;
                  "
                  >중복되지 않은 아이디입니다.</span
                >
                <span
                  class="id_already"
                  style="
                    color: red;
                    font-size: 14px;
                    font-weight: normal;
                    display: none;
                  "
                  >중복된 아이디입니다.</span
                >
       </div>
       <div class="form-row">
        <label for="pwd"
        >비밀번호<span class="label-with-star">*</span></label
      ><br />
      <input
        type="password"
        id="pwd"
        name="pwd"
        placeholder="비밀번호(6~16자 이내, 영문, 숫자 사용 가능)"
        class="input-small"
      /><br />
      <span id="pwdError" class="validation-message"></span>
       </div>
       <div class="form-row">
        <label for="passwordConfirm"
        >비밀번호 확인<span class="label-with-star">*</span></label
      ><br />
      <input
        type="password"
        id="passwordConfirm"
        name="passwordConfirm"
        placeholder="비밀번호 재확인"
        class="input-small"
      /><br />
      <span id="passwordError" style="color: red"></span>
       </div>
       <div class="form-row">
        <label for="name">이름<span class="label-with-star">*</span></label
            ><br />
            <input
              type="text"
              id="name"
              name="name"
              class="input-small"
            /><br />
       </div>
<div class="form-row">
<label for="email"
>이메일<span class="label-with-star">*</span></label
><br />
<input
type="text"
id="domain-txt1"
name="email1"
placeholder="인증에 사용됩니다."
style="width: 150px"
/>
<span>@</span>
<input
type="text"
class="box"
id="domain-txt2"
name="email2"
style="width: 150px"
/>
<select class="select-box" id="domain-list" style="width: 150px">
<option value="">이메일 선택</option>
<option value="">직접입력</option>
<option value="google.com">google.com</option>
<option value="naver.com">naver.com</option>
<option value="hanmail.com">hanmail.com</option>
</select>
<button
class="address-button"
type="button"
onclick="sendVerificationCode()"
>
인증번호 받기
</button>
<span
class="email_ok"
style="
  color: #2890f1;
  font-size: 14px;
  font-weight: normal;
  display: none;
"
>사용 가능한 이메일입니다.</span
>
<span
class="email_already"
style="
  color: red;
  font-size: 14px;
  font-weight: normal;
  display: none;
"
>중복된 이메일입니다.</span
>
</div>
    <div class="form-row">
        <label for="verification-code"
        >인증번호<span class="label-with-star">*</span></label
      ><br />
      <input
        type="text"
        id="verification-code"
        name="verification-code"
        placeholder="인증번호를 입력해주세요."
        class="input-small"
      />
      <button
        class="address-button"
        type="button"
        onclick="verifyCode()"
      >
        확인
      </button>
        </div>
        <br><br>
        <h2>사업장 정보</h2>
        <hr><br>
        <form action="${contextPath}/member/addB_Member.do" method="post" onsubmit="return validateAndSubmitForm()"
        id="joinFrm">
        <input id="lat" type="hidden" name="lat" />
        <input id="lng" type="hidden" name="lng" />
            <div class="form-row">
                <label for="b_number">사업자 번호<span class="label-with-star">*</span></label><br>
               <input type="text" id="b_number" name="b_number" placeholder="-없이 10자리를 입력해주세요" maxlength="10"  >
           </div>
            <div class="form-row">
                 <label for="b_name">시설명<span class="label-with-star">*</span></label><br>
                <input type="text" id="b_name" name="b_name" placeholder="상호명을 입력해주세요"  >
            </div>
            <div class="form-row">
                <label for="b_bank">은행선택<span class="label-with-star">*</span></label><br>
                <select name="b_bank" id="b_bank" >
                    <option value=''>-선택-</option>
                    <option value='국민은행'>국민은행</option>         
                    <option value='기업은행'>기업은행</option>               
                    <option value='농협중앙회'>농협중앙회</option>                                        
                    <option value='신한은행'>신한은행</option>                              
                 </select>
</div>
            <div class="form-row">
                <label for="b_account">계좌번호<span class="label-with-star">*</span></label><br>
                <input type="text" id="b_account" name="b_account" placeholder="1234567890(-없이 입력해주세요)" maxlength="10" >
            </div>
           
          <div class="form-row">
            <label for="addr">사업장 주소<span class="label-with-star">*</span></label
            ><br />
            <input
              style="width: 100px"
              type="text"
              id="zip_code"
              name="zipcode"
              onclick="openZipSearch();"
              readonly="readonly"
              placeholder="우편번호"
            />
            <button
              class="address-button"
              type="button"
              onclick="openZipSearch()"
            >
              주소 찾기</button
            ><br />
            <input
              type="text"
              id="addr"
              name="addrBasic"
              readonly="readonly"
              placeholder="기본주소"
              style="width: 250px"
            /><br />
            <input
              type="text"
              id="addr_dtl"
              name="addrDetail"
              placeholder="상세주소"
              style="width: 250px"
            />
            </div>
    <div class="form-row2">
    <label for="phoneNum"
    >사업장 연락처<span class="label-with-star">*</span></label
  ><br />
  <input
    type="text"
    id="phone1"
    name="phone1"
    class="phone-input"
    maxlength="3"
    onkeyup="formatPhoneNumber()"
  />
  <span>-</span>
  <input
    type="text"
    id="phone2"
    name="phone2"
    class="phone-input"
    maxlength="4"
    onkeyup="formatPhoneNumber()"
  />
  <span>-</span>
  <input
    type="text"
    id="phone3"
    name="phone3"
    class="phone-input"
    maxlength="4"
    onkeyup="formatPhoneNumber()"
  />
</div>
<input
  type="hidden"
  id="formatted-phone"
  name="formatted-phone"
  readonly
/>

            <br><br>
            <ul class="join_box">
                <li class="checkBox check01">
                  <ul class="clearfix">
                    <li>
                      전자상거래 표준약관, 이용약관, 개인정보 수집 및 이용, 위치정보
                      이용약관(선택)<br />
                      프로모션 안내 메일 수신(선택)에 모두 동의합니다.
                    </li>
                    <li class="checkAllBtn">
                      <input
                        type="checkbox"
                        name="chkAll"
                        id="chkAll"
                        class="chkAll"
                        onclick="checkboxAll(this)"
                      />
                    </li>
                  </ul>
                </li>
                <li class="checkBox check02">
                  <ul class="clearfix">
                    <li>
                      회원 이용 약관<span class="label-with-star">(필수)*</span>
                    </li>
                    <li class="checkBtn">
                      <input id="chk_2" type="checkbox" name="chk" />
                    </li>
                  </ul>
                  <textarea disabled>
    여러분을 환영합니다.
    픽트니스 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 픽트니스 서비스의 이용과 관련하여 픽트니스 서비스를 제공하는 주식회사(이하 픽트니스)와 이를 이용하는 픽트니스 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 픽트니스 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
           </textarea
                  >
                </li>
                <li class="checkBox check03">
                  <ul class="clearfix">
                    <li>
                      개인정보 수집 및 이용에 대한 안내<span class="label-with-star"
                        >(필수)*</span
                      >
                    </li>
                    <li class="checkBtn">
                      <input id="chk_3" type="checkbox" name="chk" />
                    </li>
                  </ul>
    
                  <textarea disabled>
    개인정보의 수집 및 이용목적
    
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
    <!-- 일반회원 가입 시 -->>
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
                            </textarea
                  >
                </li>
                <li class="checkBox check03">
                  <ul class="clearfix">
                    <li>이벤트 등 프로모션 휴대폰 알림 수신(선택)</li>
                    <li class="checkBtn">
                      <input type="checkbox" name="phoneConsent" />
                    </li>
                  </ul>
    
                  <textarea disabled>
    이용자가 본 약관에 동의하는 경우, [회사/서비스명]은 주기적으로 이벤트, 할인, 프로모션 등에
    관련된 정보를 전자메일을 통해 제공할 수 있습니다.
    정보 수신 동의 여부는 이용자의 개인정보 처리 방침과 별도로 관리됩니다.</textarea
                  >
                </li>
                <li class="checkBox check04">
                  <ul class="clearfix">
                    <li>이벤트 등 프로모션 메일 알림 수신(선택)</li>
                    <li class="checkBtn">
                      <input type="checkbox" name="emailConsent" />
                    </li>
                  </ul>
                  <textarea disabled>
    이용자가 본 약관에 동의하는 경우, [회사/서비스명]은 주기적으로 이벤트, 할인, 프로모션 등에
    관련된 정보를 휴대전화를 통해 제공할 수 있습니다.
    정보 수신 동의 여부는 이용자의 개인정보 처리 방침과 별도로 관리됩니다.</textarea
                  >
                </li>
              </ul>
    
              <!--latLng(this.form)-->
    
              <button type="submit" class="joinButton" id="nextBtn">
                가입하기
              </button>
            </div>
        </div>
        </form>
    </div>
</body>
</html>
