package com.pick.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pick.goods.vo.GoodsImageFileVO;
import com.pick.goods.vo.GoodsShoppingVO;

@Repository("adminGoodsDAO")
@Mapper
public interface AdminGoodsDAO {
	public int insertNewGoods(Map newGoodsMap) throws DataAccessException;
	public int insertGoodsImageFile(GoodsImageFileVO imageFileVO) throws DataAccessException;
	public List goodsList() throws DataAccessException;
	public GoodsShoppingVO selectGoods(String goods_id) throws DataAccessException;
	public List selectImage(String goods_id) throws DataAccessException;
	public void updateGoodsInfo(Map goodsMap) throws DataAccessException;
}
