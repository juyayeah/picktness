<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <c:set var="contextPath" value="${pageContext.request.contextPath }" />
      <% request.setCharacterEncoding("utf-8"); %>
        <!DOCTYPE html>
        <html>

        <head>
          <meta charset="UTF-8">
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>회원정보 수정</title>
          <link rel="stylesheet" type="text/css" href="styles.css">
        </head>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" />
        </script>
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
          // 이메일 인증번호
          $checkEmail.click(function () {
            $.ajax({
              type: "POST",
              url: "login/mailConfirm",
              data: {
                "email": $memail.val()
              },
              success: function (data) {
                alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
                console.log("data : " + data);
                chkEmailConfirm(data, $memailconfirm, $memailconfirmTxt);
              }
            })
          })

          // 이메일 인증번호 체크 함수
          function chkEmailConfirm(data, $memailconfirm, $memailconfirmTxt) {
            $memailconfirm.on("keyup", function () {
              if (data != $memailconfirm.val()) { //
                emconfirmchk = false;
                $memailconfirmTxt.html("<span id='emconfirmchk'>인증번호가 잘못되었습니다</span>")
                $("#emconfirmchk").css({
                  "color": "#FA3E3E",
                  "font-weight": "bold",
                  "font-size": "10px"

                })
                //console.log("중복아이디");
              } else { // 아니면 중복아님
                emconfirmchk = true;
                $memailconfirmTxt.html("<span id='emconfirmchk'>인증번호 확인 완료</span>")

                $("#emconfirmchk").css({
                  "color": "#0D6EFD",
                  "font-weight": "bold",
                  "font-size": "10px"

                })
              }
            })
          }
        </script>
        <script>
          $(document).ready(function () {
              // "수정하기" Button Click Event
              $(".conforBtn").click(function () {
          
                  $("input:not(#id, #point)").removeAttr("disabled");
                  $(".disableLink").attr('href', '#'); // 다시 href 활성화
          
                  $(this).text("수정반영");
          
                  $(this).off("click").click(handleUpdate);
              });
          
          
              function handleUpdate() {
          
                  var updatedData = {
                      name: $("#name").val(),
                      // ...
                  };
          
                  $.ajax({
                      type: "POST",
                      url: "updateUserData",
                      data: updatedData,
                      success: function (response) {
          
                          alert("회원정보가 수정되었습니다.");
          
                      },
                      error: function (error) {
          
                          alert("회원정보 수정에 실패했습니다.");
                      }
                  });
              }
          });
          </script>
          
        <script>
          function openZipSearch() {
            new daum.Postcode({
              oncomplete: function (data) {
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
            // 이메일 인증번호를 전송하는 로직을 구현.

            alert("이메일 인증번호를 전송했습니다.");
          }

          function verifyCode() {
            var inputCode = document.getElementById('verification-code').value;
            var generatedCode = "123456"; // 여기에 실제로 생성된 인증번호

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
          //이메일 셀렉트 박스
          $(function () {
            $('#domain-list').change(function () {
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
          .hrColor {
            border-color: #2890F1;
          }

          input[type="checkbox"][name="chk"] {
            /* 원하는 크기 값으로 조절 */
            width: 20px;
            height: 20px;
          }



          .input-small {
            width: 280px;
          }

          .cation {
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

          .form-row,
          .form-row2 {
            margin-left: 270px;
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

          .input-with-text {
            position: relative;
            display: inline-block;
          }

          .point-text {
            position: absolute;
            top: 50%;
            right: 5px;
            transform: translateY(-75%);

          }

          .phone-input {
            width: 50px;
          }

          .conforBtn {
            display: block;
            margin: 0 auto;
            background-color: #2890F1;
            width: 100px;
            height: 40px;
            padding: 10px;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
          }

          .conforBtn:hover {
            background-color: #1d6fa5;
          }
        </style>

        <body style="background-color: white;">

          <div class="confrim-container" id="formContainer">
            <h1 style="text-align: center;">회원정보 수정</h1><br>
            <div class="cation">
            </div>
            <form action="${contextPath}/member/addMember.do" method="post">
              <div class="formTool">
                <div class="form-row">
                  <label for="name">이름</label><br>
                  <input type="text" name="name" class="input-small" disabled><br>
                </div>

                <div class="form-row">
                  <label for="id">아이디</label><br>
                  <input type="text" id="id" name="id" class="input-small" disabled>

                </div>

                <div class="form-row">
                  <label for="pwd">비밀번호</label><br>
                  <a href="#" style="color: #2890F1; font-size: 13px;" class="disableLink">비밀번호 변경을 원하시면 여기를
                    클릭해주세요.</a><br>
                </div>
                <script>
                  document.querySelector(".disableLink").removeAttribute('href');
                </script>
                <div class="form-row">
                  <label for="addr">주소</label><br>
                  <input style="width: 100px;" type="text" id="zip_code" name="zipcode" onclick="openZipSearch();"
                    disabled>
                  <button class="address-button" type="button" onclick="openZipSearch()" hidden>주소 찾기</button><br>
                  <input type="text" id="addr" name="addrBasic" readonly="readonly" placeholder="기본주소"
                    style="width:250px;" disabled><br>
                  <input type="text" id="addr_dtl" name="addrDetail" placeholder="상세주소" style="width:250px;" disabled>
                </div>
                <div class="form-row">
                  <label for="email">이메일</label><br>
                  <input type="text" id="domain-txt1" name="email1" style="width: 150px;" disabled>
                  <span>@</span>
                  <input type="text" class="box" id="domain-txt2" name="email2" style="width: 150px;" disabled>
                  <select class="select-box" id="domain-list" style="width: 150px;" hidden>
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
                  <button class="address-button" type="button" onclick="" hidden>인증번호 받기</button>
                  <span class="id_ok" style="color:#2890F1; font-size: 14px; font-weight: normal; display:none;">사용 가능한
                    이메일입니다.</span>
                  <span class="id_already" style="color:red; font-size: 14px; font-weight: normal; display:none;">중복된
                    이메일입니다.</span>
                </div>
                <div class="form-row" hidden>
                  <label for="verification-code">인증번호</label><br>
                  <input type="text" id="verification-code" name="verification-code" placeholder="인증번호 6자리를 입력해주세요."
                    class="input-small">
                  <button class="address-button" type="button" onclick="verifyCode()">확인</button>
                </div>
                <div class="form-row2">
                  <label for="phoneNum">휴대전화</label><br>
                  <input type="text" id="phone1" name="phone1" class="phone-input" maxlength="3"
                    onkeyup="formatPhoneNumber()" disabled>
                  <span>-</span>
                  <input type="text" id="phone2" name="phone2" class="phone-input" maxlength="4"
                    onkeyup="formatPhoneNumber()" disabled>
                  <span>-</span>
                  <input type="text" id="phone3" name="phone3" class="phone-input" maxlength="4"
                    onkeyup="formatPhoneNumber()" disabled>
                </div>
                <input type="hidden" id="formatted-phone" name="formatted-phone" readonly>
              </div>
              <div class="form-row">
                <label for="point">내 포인트</label><br>
                <div class="input-with-text">
                  <input type="text" id="point" name="point" class="input-small" disabled>
                  <span class="point-text">포인트</span>
                </div>
              </div>
              <button class="conforBtn" type="button">수정하기</button>
              <br>
              <div style="text-align: center;">
                <a href="" style="color: rgb(197, 194, 194); display: inline-block; margin-bottom: 20px;">탈퇴하기</a>
              </div>

          </div>
          </div>

        </html>