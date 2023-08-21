package com.pick.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface GoodsService {
	public Map<String, List> searchGoods(String search_content) throws DataAccessException;
}
