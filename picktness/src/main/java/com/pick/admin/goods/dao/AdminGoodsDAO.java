package com.pick.admin.goods.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pick.goods.vo.GoodsImageFileVO;

@Repository("adminGoodsDAO")
@Mapper
public interface AdminGoodsDAO {
	public int insertNewGoods(Map newGoodsMap) throws DataAccessException;
	public int insertGoodsImageFile(GoodsImageFileVO imageFileVO) throws DataAccessException;
}
