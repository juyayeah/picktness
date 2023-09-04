package com.pick.admin.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface AdminGoodsController {
	public ResponseEntity addGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ResponseEntity modifyGoodsInfo( @RequestParam("goods_id") String goods_id,
            @RequestParam("attribute") String attribute,
            @RequestParam("value1") String value1,@RequestParam("value2") String value2, @RequestParam("value3") String value3,
            HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
