package com.pick.goods.vo;

import java.math.BigDecimal;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("goodsTrainerVO")
public class GoodsTrainerVO {
	private String goods_id;
	private String id;
	private String name;
	private String trPhone1;
	private String trPhone2;
	private String trPhone3;
	private String cate;
	private String certi;
	private String detail;
	private String prod10;
	private String prod20;
	private String prod30;
	private String prod10sale;
	private String prod20sale;
	private String prod30sale;
	private String prod10retail;
	private String prod20retail;
	private String prod30retail;
	private String state;
	private Date joinDate;
	private double review_star;
	private int review_count;
	private String b_name;
	private String zipcode;
	private String addrBasic;
	private String addrDetail;
	private String phone1;
	private String phone2;
	private String phone3;
	private BigDecimal lat;
	private BigDecimal lng;
	private String fileName;
	private double distance;
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	
	
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getCerti() {
		return certi;
	}
	public void setCerti(String certi) {
		this.certi = certi;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getProd10() {
		return prod10;
	}
	public void setProd10(String prod10) {
		this.prod10 = prod10;
	}
	public String getProd20() {
		return prod20;
	}
	public void setProd20(String prod20) {
		this.prod20 = prod20;
	}
	public String getProd30() {
		return prod30;
	}
	public void setProd30(String prod30) {
		this.prod30 = prod30;
	}
	public String getProd10sale() {
		return prod10sale;
	}
	public void setProd10sale(String prod10sale) {
		this.prod10sale = prod10sale;
	}
	public String getProd20sale() {
		return prod20sale;
	}
	public void setProd20sale(String prod20sale) {
		this.prod20sale = prod20sale;
	}
	public String getProd30sale() {
		return prod30sale;
	}
	public void setProd30sale(String prod30sale) {
		this.prod30sale = prod30sale;
	}
	public String getProd10retail() {
		return prod10retail;
	}
	public void setProd10retail(String prod10retail) {
		this.prod10retail = prod10retail;
	}
	public String getProd20retail() {
		return prod20retail;
	}
	public void setProd20retail(String prod20retail) {
		this.prod20retail = prod20retail;
	}
	public String getProd30retail() {
		return prod30retail;
	}
	public void setProd30retail(String prod30retail) {
		this.prod30retail = prod30retail;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
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
	public String getTrPhone1() {
		return trPhone1;
	}
	public void setTrPhone1(String trPhone1) {
		this.trPhone1 = trPhone1;
	}
	public String getTrPhone2() {
		return trPhone2;
	}
	public void setTrPhone2(String trPhone2) {
		this.trPhone2 = trPhone2;
	}
	public String getTrPhone3() {
		return trPhone3;
	}
	public void setTrPhone3(String trPhone3) {
		this.trPhone3 = trPhone3;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddrBasic() {
		return addrBasic;
	}
	public void setAddrBasic(String addrBasic) {
		this.addrBasic = addrBasic;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public BigDecimal getLat() {
		return lat;
	}
	public void setLat(BigDecimal lat) {
		this.lat = lat;
	}
	public BigDecimal getLng() {
		return lng;
	}
	public void setLng(BigDecimal lng) {
		this.lng = lng;
	}
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	
}
