package com.pick.goods.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pick.goods.vo.GoodsBusinessVO;
import com.pick.goods.vo.GoodsShoppingVO;
import com.pick.goods.vo.GoodsTrainerVO;
@Mapper
@Repository("goodsDAO")
public interface GoodsDAO {
	public List<GoodsBusinessVO> businessSearch(String search_content) throws DataAccessException;
	public List<GoodsTrainerVO> trainerSearch(String search_content) throws DataAccessException;
	public List<GoodsShoppingVO> shoppingSearch(String search_content) throws DataAccessException;

}
