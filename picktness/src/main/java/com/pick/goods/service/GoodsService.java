package com.pick.goods.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pick.goods.vo.GoodsBusinessVO;

public interface GoodsService {
	public List<GoodsBusinessVO> goodsBusinessAllList(BigDecimal lat, BigDecimal lng, String sort) throws DataAccessException;
	public List<GoodsBusinessVO> goodsBusinessCateList(BigDecimal lat, BigDecimal lng, String cate, String sort) throws DataAccessException;
	public Map<String, List> searchGoods(String search_content) throws DataAccessException;
}
