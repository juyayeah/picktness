package com.pick.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	private static final String BUSINESS_IMAGE_REPO = "c:\\picktness\\business_image";
	private static final String EVENT_IMMAGE_REPO = "c:\\picktness\\event_image";
	private static final String REVIEW_IMAGE_REPO = "c:\\picktness\\review_image";
	private static final String ONEONONE_IMAGE_REPO = "c:\\picktness\\oneonone_image";
	private static final String SHOPPING_IMAGE_REPO = "c:\\picktness\\shopping_image";
	private static final String TODAYMILL_IMAGE_REPO = "c:\\picktness\\todaymill_image";
	private static final String TRAINER_IMAGE_REPO = "c:\\pickness\\trainer_image";
	
	@RequestMapping("/download.do")
	protected void download(@RequestParam("cate") String cate, @RequestParam("imageFileName") String imageFileName, @RequestParam("bno") String bno, HttpServletResponse response) throws Exception{
		OutputStream out = response.getOutputStream();
		String downFile = fileName(cate, bno, imageFileName);
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment;fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1) break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
		
	}

	protected String fileName(String cate, String bno, String imageFileName) {
		String fileName = null;
		switch(cate) {
		case "mill":fileName = TODAYMILL_IMAGE_REPO+"\\"+bno+"\\"+imageFileName;
		break;
		}
		return fileName;
	}

}
