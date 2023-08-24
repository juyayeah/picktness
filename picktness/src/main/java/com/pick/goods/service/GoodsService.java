package com.pick.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pick.goods.vo.GoodsBusinessVO;

public interface GoodsService {
	public List<GoodsBusinessVO> goodsBusinessAllList(Map option) throws DataAccessException;
	public List<GoodsBusinessVO> goodsBusinessCateList(Map option) throws DataAccessException;
	public List<GoodsBusinessVO> goodsBusinessAllTimeList(Map option) throws DataAccessException;
	public Map<String, List> searchGoods(String search_content) throws DataAccessException;
}
