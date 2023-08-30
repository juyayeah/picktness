package com.pick.admin.goods.controller;

import java.io.File;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pick.admin.goods.service.AdminGoodsService;
import com.pick.goods.vo.GoodsImageFileVO;
import com.pick.goods.vo.GoodsShoppingVO;
@Controller("adminGoodsController")
public class AdminGoodsControllerImpl implements AdminGoodsController{
	private static final String SHOPPING_IMAGE_REPO = "c:\\picktness\\shopping_image";
	@Autowired
	GoodsShoppingVO goodsShoppingVO;
	@Autowired
	AdminGoodsService adminGoodsService;
	
	protected List<GoodsImageFileVO> upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<GoodsImageFileVO> fileList= new ArrayList<GoodsImageFileVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			GoodsImageFileVO imageFileVO =new GoodsImageFileVO();
			String fileName = fileNames.next();
			imageFileVO.setFileType(fileName);
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			imageFileVO.setFileName(originalFileName);
			fileList.add(imageFileVO);
			
			File file = new File(SHOPPING_IMAGE_REPO +"\\"+ fileName);
			if(mFile.getSize()!=0){
				if(! file.exists()){ 
					if(file.getParentFile().mkdirs()){ 
							file.createNewFile();
					}
				}
				mFile.transferTo(new File(SHOPPING_IMAGE_REPO +"\\"+"temp"+ "\\"+originalFileName));
			}
		}
		return fileList;
	}

	@Override
	@RequestMapping(value="/admin/goods/addGoods.do", method=RequestMethod.POST)
	public ResponseEntity addGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formatedNow = now.format(formatter);
		int number = (int)(Math.random() * 8999) + 1000;
		String goods_id = "sh" + formatedNow + number;
		String imageFileName=null;
		System.out.println(goods_id);
		
		Map newGoodsMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		newGoodsMap.put("goods_id", goods_id);
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			newGoodsMap.put(name, value);
		};
		if(newGoodsMap.get("detail") == null) {
			newGoodsMap.put("detail", "null");
		}
		List<GoodsImageFileVO> imageFileList = upload(multipartRequest);
		if(imageFileList != null && imageFileList.size() != 0) {
			for(GoodsImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setGoods_id(goods_id);
			}
			newGoodsMap.put("imageFileList", imageFileList);
		}
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Context-Type", "test/html; charsert=utf-8");
		try {
			adminGoodsService.addNewGoods(newGoodsMap);
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(GoodsImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(SHOPPING_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(SHOPPING_IMAGE_REPO + "\\" + goods_id);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			message = "<script>";
			message += " alert('상품이 등록되었습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/admin/mypage/adminProdList.do';";
			message += " </script>";
		} catch(Exception e) {
			if(imageFileList != null && imageFileList.size() != 0) {
				for(GoodsImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(SHOPPING_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}
			message = "<script>";
			message += " alert('상품 등록에 실패했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/admin/mypage/adminProdForm.do';";
			message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
}
