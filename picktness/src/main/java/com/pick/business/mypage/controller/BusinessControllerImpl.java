package com.pick.business.mypage.controller;



import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

	@Controller("BusinessMypageController")
		public class BusinessControllerImpl implements BusinessController{
		private static final String IMAGE_REPO = "c:\\picktness\\todaymill_image";
		//운동시설관리//
		@RequestMapping(value="/business/mypage/gymCont.do", method=RequestMethod.GET)
		private ModelAndView gymCont(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		@RequestMapping(value="/business/mypage/addGym.do", method= {RequestMethod.GET,RequestMethod.POST})
		private ModelAndView addGym(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		
		@Override
		   @RequestMapping(value = "/business/mypage/addGymDetail.do", method = RequestMethod.POST)
		   @ResponseBody
		   public ResponseEntity addGymDetail(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
		         throws Exception {
		      // TODO Auto-generated method stub
		      System.out.println("test222");
		      multipartRequest.setCharacterEncoding("utf-8");
		      Map<String, Object> Map = new HashMap<String, Object>();
		      System.out.println("MC15811111 Map : "+Map);
		      Enumeration enu = multipartRequest.getParameterNames();
		      while (enu.hasMoreElements()) {
		         String name = (String) enu.nextElement();
		         String value = multipartRequest.getParameter(name);
		         Map.put(name, value);
		      }
		      String imageFileName = upload(multipartRequest);
		      Map.put("imageFileName", imageFileName);
		      System.out.println("MapMap  : " + Map);
		      
		      String id = (String) Map.get("id");
		      String message;
		      ResponseEntity resEnt = null;
		      HttpHeaders responseHeaders = new HttpHeaders();
		      responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		      try {
	
		         if (imageFileName != null && imageFileName.length() != 0) {
		            
		            String originalFileName = (String) Map.get("originalFileName");
		            File oldFile = new File(IMAGE_REPO + "\\" + id + "\\" + originalFileName);
		            oldFile.delete();
		            
		            File srcFile = new File(IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
		            File destDir = new File(IMAGE_REPO + "\\" + id);// 는 destDir.mkdirs();로 꼭 파일을 넣어야 한다.
		            FileUtils.moveFileToDirectory(srcFile, destDir, true);// 앞쪽에서 뒤쪽으로 s>d>t)
		            
		         }
		         message = "<script>";
		         message += " alert('관리자정보를 수정했습니다.');";
		         message += " location.href='" + multipartRequest.getContextPath() + "/business/mypage/addGym.do?id="
		               + id + "';";
		         message += "</script>";
		         resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		      } catch (Exception e) {
		         // TODO: handle exception
		         File srcFile = new File(IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
		         srcFile.delete();

		         message = " <script>";
		         message += " alert('수정 중 오류가 발생했습니다.');";
		         message += " location.href='" + multipartRequest.getContextPath() + "/business/mypage/addGym.do?id="
		               + id + "';";
		         message += " </script>";
		         resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		      }
		      return resEnt;
		   }
		
		private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		      // TODO Auto-generated method stub
		      String imageFileName = null;
		      Iterator<String> fileNames = multipartRequest.getFileNames();

		      while (fileNames.hasNext()) {
		         String fileName = fileNames.next();
		         MultipartFile mFile = multipartRequest.getFile(fileName);
		         imageFileName = mFile.getOriginalFilename();
		         File file = new File(IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
		         if (mFile.getSize() != 0) {
		            if (!file.exists()) {
		               file.getParentFile().mkdirs();
		               mFile.transferTo(new File(IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName));
		            }
		         }
		      }
		      return imageFileName;
		      }
		
		@RequestMapping(value="/business/mypage/modGym.do", method=RequestMethod.GET)
		private ModelAndView modGym(HttpServletRequest request, HttpServletResponse response) throws Exception{
			ModelAndView mav = new ModelAndView();
			String viewName = (String) request.getAttribute("viewName");
			mav.setViewName(viewName);
			return mav;
		}
		//상품문의 관리//
			@RequestMapping(value="/business/mypage/goodsAskCont.do", method=RequestMethod.GET)
			private ModelAndView goodsAskCont(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			//트레이너 관리//
			@RequestMapping(value="/business/mypage/trainerCont.do", method=RequestMethod.GET)
			private ModelAndView trainerCont(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			//트레이너 등록//
			@RequestMapping(value="/business/mypage/trainerForm.do", method=RequestMethod.GET)
			private ModelAndView trainerForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			//주문결제 관리//
			@RequestMapping(value="/business/mypage/orderPayCont.do", method=RequestMethod.GET)
			private ModelAndView orderPayCont(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			//주문/결제 리스트//
			@RequestMapping(value="/business/mypage/orderPayList.do", method=RequestMethod.GET)
			private ModelAndView orderPayList(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			//리뷰 관리//
			@RequestMapping(value="/business/mypage/reviewCont.do", method=RequestMethod.GET)
			private ModelAndView reviewCont(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			//사업자정보//
			@RequestMapping(value="/business/mypage/busiInfo.do", method=RequestMethod.GET)
			private ModelAndView busiInfo(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			@RequestMapping(value="/business/mypage/withdraw.do", method= {RequestMethod.GET, RequestMethod.POST})
			private ModelAndView withdraw(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			@RequestMapping(value="/business/mypage/withdrawFixed.do", method=RequestMethod.GET)
			private ModelAndView withdrawFixed(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			@RequestMapping(value="/business/mypage/withdrawBye.do", method=RequestMethod.GET)
			private ModelAndView withdrawBye(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			//정산내역//
			@RequestMapping(value="/business/mypage/settlement.do", method=RequestMethod.GET)
			private ModelAndView settlement(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
			@RequestMapping(value="/business/mypage/settlementDetail.do", method=RequestMethod.GET)
			private ModelAndView settlementDetail(HttpServletRequest request, HttpServletResponse response) throws Exception{
				ModelAndView mav = new ModelAndView();
				String viewName = (String) request.getAttribute("viewName");
				mav.setViewName(viewName);
				return mav;
			}
	}
