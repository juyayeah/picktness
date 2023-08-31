package com.pick.goods.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

@Component("goodsImageFileVO")
public class GoodsImageFileVO {
	private int image_id;
	private String goods_id;
	private String fileName;
	private String fileType;
	public int getImage_id() {
		return image_id;
	}
	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		try {
			this.fileName = URLEncoder.encode(fileName,"UTF-8");
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	
	
}
