package com.pick.business.mypage.controller;

import java.io.File;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.pick.business.mypage.service.BusinessService;
import com.pick.business.mypage.vo.BusinessDetailVO;
import com.pick.goods.vo.GoodsImageFileVO;
import com.pick.member.vo.BusinessVO;

@Controller("BusinessMypageController")
public class BusinessControllerImpl implements BusinessController {
	private static final String BUSINESS_IMAGE_REPO = "c:\\picktness\\business_image";
	@Autowired
	BusinessService businessService;
	@Autowired
	BusinessDetailVO businessDetailVO;

	// 운동시설관리//
	@RequestMapping(value = "/business/mypage/placeCont.do", method = RequestMethod.GET)
	public ModelAndView placeCont(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		BusinessVO business = (BusinessVO) session.getAttribute("business");
		String id = business.getId();
		System.out.println(id);
		Map businessPlace = businessService.placeDetail(id);
		if(businessPlace == null) {
			mav.setViewName("redirect:/business/mypage/placeForm.do");
		}else {
			mav.setViewName(viewName);
			mav.addObject("businessPlace", businessPlace);
		}
		return mav;
	}

	@RequestMapping(value = "/business/mypage/placeForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView placeForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		multipartRequest.setCharacterEncoding("utf-8");
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(formatter);
		int number = (int) (Math.random() * 8999) + 1000;
		String goods_id = "pc" + formatedNow + number;
		String imageFileName = null;
		System.out.println(goods_id);
		
		Map newGoodsMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		newGoodsMap.put("goods_id", goods_id);
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			newGoodsMap.put(name, value);
		}
		if(newGoodsMap.get("allTime") == null) {
			newGoodsMap.put("allTime", "N");
		}
		List<GoodsImageFileVO> imageFileList = upload(multipartRequest);
		if(imageFileList != null && imageFileList.size() !=0) {
			for(GoodsImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setGoods_id(goods_id);
			}
			newGoodsMap.put("imageFileList", imageFileList);
		}
		System.out.println("MapMap  : " + newGoodsMap);
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html;charset=utf-8");
		try {
			businessService.insertBusinessDetail(newGoodsMap);
			if (imageFileList != null && imageFileList.size() != 0) {
				for(GoodsImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(BUSINESS_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(BUSINESS_IMAGE_REPO + "\\" + goods_id);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}

			}
			message = "<script>";
			message += " alert('운동시설을 등록했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/business/mypage/placeCont.do';";
			message += "</script>";
		} catch (Exception e) {
			if(imageFileList != null && imageFileList.size() !=0) {
				for(GoodsImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(BUSINESS_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}
			message = " <script>";
			message += " alert('등록 중 오류가 발생했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/business/mypage/addGym.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		return resEntity;
	}

	private List<GoodsImageFileVO> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<GoodsImageFileVO> fileList = new ArrayList<GoodsImageFileVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			GoodsImageFileVO imageFileVO = new GoodsImageFileVO();
			String fileName = fileNames.next();
			imageFileVO.setFileType(fileName);
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			imageFileVO.setFileName(originalFileName);
			fileList.add(imageFileVO);
			
			File file = new File(BUSINESS_IMAGE_REPO + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(BUSINESS_IMAGE_REPO + "\\" + "temp" + "\\" + originalFileName));
				}
			}
		}
		return fileList;
	}

	@RequestMapping(value = "/business/mypage/modPlaceCont.do", method = RequestMethod.GET)
	public ModelAndView modGym(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 상품문의 관리//
	@RequestMapping(value = "/business/mypage/goodsAskCont.do", method = RequestMethod.GET)
	public ModelAndView goodsAskCont(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 트레이너 관리//
	@RequestMapping(value = "/business/mypage/trainerCont.do", method = RequestMethod.GET)
	public ModelAndView trainerCont(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 트레이너 등록//
	@RequestMapping(value = "/business/mypage/trainerForm.do", method = RequestMethod.GET)
	public ModelAndView trainerForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 주문결제 관리//
	@RequestMapping(value = "/business/mypage/orderPayCont.do", method = RequestMethod.GET)
	public ModelAndView orderPayCont(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 주문/결제 리스트//
	@RequestMapping(value = "/business/mypage/orderPayList.do", method = RequestMethod.GET)
	public ModelAndView orderPayList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 리뷰 관리//
	@RequestMapping(value = "/business/mypage/reviewCont.do", method = RequestMethod.GET)
	public ModelAndView reviewCont(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 사업자정보//
	@RequestMapping(value = "/business/mypage/busiInfo.do", method = RequestMethod.GET)
	public ModelAndView busiInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/business/mypage/withdraw.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView withdraw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/business/mypage/withdrawFixed.do", method = RequestMethod.GET)
	public ModelAndView withdrawFixed(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/business/mypage/withdrawBye.do", method = RequestMethod.GET)
	public ModelAndView withdrawBye(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	// 정산내역//
	@RequestMapping(value = "/business/mypage/settlement.do", method = RequestMethod.GET)
	public ModelAndView settlement(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/business/mypage/settlementDetail.do", method = RequestMethod.GET)
	public ModelAndView settlementDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
}
