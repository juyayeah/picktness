package com.pick.goods.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pick.goods.vo.GoodsBusinessVO;

public interface GoodsService {
	public List<GoodsBusinessVO> goodsBusinessAllList(double lat, double lng) throws DataAccessException;
	public List<GoodsBusinessVO> goodsBusinessCateList(double lat, double lng, String cate) throws DataAccessException;
	public Map<String, List> searchGoods(String search_content) throws DataAccessException;
}
