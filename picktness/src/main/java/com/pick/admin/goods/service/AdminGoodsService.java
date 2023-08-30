package com.pick.admin.goods.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface AdminGoodsService {
	public int addNewGoods(Map newGoodsMap) throws DataAccessException;
}
