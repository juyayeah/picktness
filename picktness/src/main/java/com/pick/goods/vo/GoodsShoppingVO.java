package com.pick.goods.vo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("goodsShoppingVO")
public class GoodsShoppingVO {
	private String goods_id;
	private String goods_title;
	private int goods_qty;
	private String cate_fir;
	private String cate_sec;
	private String priceOrigin;
	private String priceSale;
	private String priceRetail;
	private String detail;
	private double review_star;
	private int review_count;
	private String fileName;
	private List<String> imageList;
	
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_title() {
		return goods_title;
	}
	public void setGoods_title(String goods_title) {
		this.goods_title = goods_title;
	}
	public int getGoods_qty() {
		return goods_qty;
	}
	public void setGoods_qty(int goods_qty) {
		this.goods_qty = goods_qty;
	}
	public String getCate_fir() {
		return cate_fir;
	}
	public void setCate_fir(String cate_fir) {
		this.cate_fir = cate_fir;
	}
	public String getCate_sec() {
		return cate_sec;
	}
	public void setCate_sec(String cate_sec) {
		this.cate_sec = cate_sec;
	}
	public String getPriceOrigin() {
		return priceOrigin;
	}
	public void setPriceOrigin(String priceOrigin) {
		this.priceOrigin = priceOrigin;
	}
	public String getPriceSale() {
		return priceSale;
	}
	public void setPriceSale(String priceSale) {
		this.priceSale = priceSale;
	}
	public String getPriceRetail() {
		return priceRetail;
	}
	public void setPriceRetail(String priceRetail) {
		this.priceRetail = priceRetail;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public double getReview_star() {
		return review_star;
	}
	public void setReview_star(double review_star) {
		this.review_star = review_star;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public List<String> getImageList() {
		return imageList;
	}
	public void setImageList(List<String> imageList) {
		this.imageList = imageList;
	}

	
}
