package com.pick.admin.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pick.goods.vo.GoodsShoppingVO;

public interface AdminGoodsService {
	public int addNewGoods(Map newGoodsMap) throws DataAccessException;
	public List goodsList() throws DataAccessException;
	public GoodsShoppingVO selectGoods(String goods_id) throws DataAccessException;
	public List selectImage(String goods_id) throws DataAccessException;
	public void modifyGoodsInfo(Map goodsMap) throws DataAccessException;
}
