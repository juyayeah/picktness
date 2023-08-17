<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>픽트니스</title>
    <script>
      $(function () {
        $(".main_banner_list").slick({
          autoplay: true,
          prevArrow: $(".prev"),
          nextArrow: $(".next"),
        });
      });
    </script>
    <style>
      .main_banner {
        width: 100%;
      }
      .main_banner_list img {
        width: 100%;
      }
      .prev {
        position: absolute;
        top: 340px;
        left: 100px;
      }
      .next {
        position: absolute;
        top: 340px;
        right: 100px;
      }
      .prev img,
      .next img {
        width: 40px;
        opacity: 50%;
      }
      .container-inner {
        position: relative;
        max-width: 1100px;
        min-height: 120px;
        margin: 0 auto;
      }
      .location_search {
        background-color: #2890f1;
        border-radius: 13px;
        width: 430px;
        height: 40px;
        text-align: center;
        margin: 50px auto;
        padding-top: 15px;
        padding-left: 30px;
      }
      .location_search img {
        width: 25px;
        position: absolute;
        top: 15x;
        left: 340px;
      }
      .location_search {
        color: #fff;
      }
      .main_box {
        text-align: center;
      }
      .main_cate {
        font-weight: bold;
        font-size: 35px;
        margin: 10px;
      }
      .main_item {
        vertical-align: top;
        position: relative;
        width: 200px;
        display: inline-block;
        margin: 10px 30px;
      }
      .img {
        position: relative;
        width: 200px;
      }
      .main_item .title {
        text-align: left;
        font-size: 15px;
        display: block;
        font-weight: bold;
      }
      .main_item .location {
        text-align: left;
        font-size: 12px;
        color: #555;
        display: block;
      }
      .main_item .price {
        text-align: left;
        font-size: 15px;
        display: block;
      }
      .cates {
        text-align: left;
      }
      .cate {
        display: inline-block;
        border: 2px solid #bfbfbf;
        width: fit-content;
        padding: 4px 8px;
        margin: 5px 0px;
        border-radius: 10px;
        font-size: 13px;
      }
      .star img {
        width: 13px;
      }
      .star {
        text-align: left;
        font-size: 12px;
        color: #555;
      }
      .all_content {
        border: 2px solid #bfbfbf;
        width: fit-content;
        padding: 10px 40px;
        margin: 0px auto 40px auto;
        border-radius: 30px;
        font-size: 13px;
      }
      .all_content img {
        width: 11px;
      }
      .work_place {
        text-align: left;
        font-size: 15px;
        display: block;
      }
      .shop_banner {
        width: 1100px;
      }
    </style>
  </head>
  <body>
    <div class="main_banner">
      <div class="main_banner_list">
        <div><img src="${contextPath}/images/main/main_banner.png" /></div>
        <div><img src="${xontextPath}/images/main/main_banner2.png" /></div>
      </div>
      <div class="prev">
        <img src="${contextPath}/images/main/left-arrow.png" />
      </div>
      <div class="next">
        <img src="${contextPath}/images/main/right-arrow.png" />
      </div>
    </div>
    <div class="container-inner">
      <div class="location_search">
        <img src="${contextPath}/images/main/location.png" />
        <div class="location_search_text">
          위치를 설정하고 내 주변 운동시설을 찾아보세요!
        </div>
      </div>
      <div class="main_box">
        <div class="main_cate">헬스</div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/health4.jpg" />
          <span class="title">헬스보이짐&필라걸 둔산점</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">24시간</div>
            <div class="cate">헬스</div>
          </div>
          <div class="star">
            <img src="${contextPath}/images/main/star.png" />
            <span class="star">4.5(2)</span>
          </div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/health3.jpg" />
          <span class="title">비식스 대전 둔산점</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">헬스</div>
          </div>
          <div class="star"></div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/health2.jpg" />
          <span class="title">제이엠휘트니스 시청점</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">헬스</div>
          </div>
          <div class="star"></div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/health1.jpg" />
          <span class="title">제이엠휘트니스 시청점</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">헬스</div>
          </div>
          <div class="star">
            <img src="${contextPath}/images/main/star.png" />
            <span class="star">4.5(2)</span>
          </div>
        </div>
        <div class="all_content">
          전체보기
          <img src="${contextPath}/images/main/all_arrow.png" />
        </div>
      </div>
      <!--/main_box-->
      <div class="main_box">
        <div class="main_cate">필라테스</div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/pila1.png" />
          <span class="title">케어필라테스 대전시청점</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">필라테스</div>
          </div>
          <div class="star">
            <img src="${contextPath}/images/main/star.png" />
            <span class="star">4.5(15)</span>
          </div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/pila2.png" />
          <span class="title">인유어 필라테스</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">필라테스</div>
          </div>
          <div class="star"></div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/pila3.png" />
          <span class="title">퓨어앤필라테스</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">헬스</div>
          </div>
          <div class="star"></div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/pila4.png" />
          <span class="title">렛츠필라테스</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">헬스</div>
          </div>
          <div class="star">
            <img src="${contextPath}/images/main/star.png" />
            <span class="star">4.5(3)</span>
          </div>
        </div>
        <div class="all_content">
          전체보기
          <img src="${contextPath}/images/main/all_arrow.png" />
        </div>
      </div>
      <!--mainbox2-->
      <div class="main_box">
        <div class="main_cate">트레이너</div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/tr1.png" />
          <span class="title">박지성 선생님</span>
          <span class="work_place">비식스 대전 둔산점</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">헬스</div>
          </div>
          <div class="star">
            <img src="${contextPath}/images/main/star.png" />
            <span class="star">4.9(24)</span>
          </div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/tr2.png" />
          <span class="title">윤성빈 선생님</span>
          <span class="work_place">크로스핏 투유</span>
          <span class="location"> 대전 서구 월평동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">크로스핏</div>
          </div>
          <div class="star"></div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/pila3.png" />
          <span class="title">심으뜸 선생님</span>
          <span class="work_place">퓨어앤필라테스</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">필라테스</div>
          </div>
          <div class="star"></div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/pila4.png" />
          <span class="title">김동현 선생님</span>
          <span class="work_place">킥핏클럽</span>
          <span class="location"> 대전 서구 둔산동 </span>
          <span class="price"> 70,000원/월 </span>
          <div class="cates">
            <div class="cate">복싱</div>
          </div>
          <div class="star"></div>
        </div>
        <div class="all_content">
          전체보기
          <img src="${contextPath}/images/main/all_arrow.png" />
        </div>
      </div>
      <!--mainbox3-->
      <img
        class="shop_banner"
        src="${contextPath}/images/main/shop_banner.png"
      />
      <div class="main_box">
        <div class="main_cate">금주의 베스트 기구/용품/장비</div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/goods1.png" />
          <span class="title">데이즈온샵 요가매트 소형</span>
          <span class="price"> 26,500원 </span>
          <div class="star"></div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/goods2.png" />
          <span class="title">모크샤 EVA 폼롤러 45 원형</span>
          <span class="price">30,000원</span>
          <div class="star"></div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/goods3.png" />
          <span class="title">이스폰타니아 무릎보호대</span>
          <span class="price"> 38,000원 </span>
          <div class="star"></div>
        </div>

        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/goods4.png" />
          <span class="title">락앤락 프로쉐이커</span>
          <span class="price"> 20,000원 </span>
          <div class="star"></div>
        </div>
        <div class="all_content">
          전체보기
          <img src="${contextPath}/images/main/all_arrow.png" />
        </div>
      </div>
      <!--//main_box-->
      <div class="main_box">
        <div class="main_cate">운동 후엔 프로틴 쉐이크</div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/protain1.png" />
          <span class="title">굿스푼 단백질 쉐이크</span>
          <span class="price"> 41,800원 </span>
          <div class="star"></div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/protain2.png" />
          <span class="title">오늘의 바디 에이치 프로틴 베이직 초코맛</span>
          <span class="price">41,800원</span>
          <div class="star"></div>
        </div>
        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/protain3.png" />
          <span class="title">그리밀 단백질 쉐이크 곡물맛</span>
          <span class="price"> 33,000원 </span>
          <div class="star"></div>
        </div>

        <div class="main_item">
          <img class="img" src="${contextPath}/images/main/protain4.png" />
          <span class="title"
            >비케이뉴트리션 웨이텐 머슬트레인 웨이 프로틴</span
          >
          <span class="price"> 73,000원 </span>
          <div class="star"></div>
        </div>
        <div class="all_content">
          전체보기
          <img src="${contextPath}/images/main/all_arrow.png" />
        </div>
      </div>
      <!--//main_box-->
    </div>
  </body>
</html>
