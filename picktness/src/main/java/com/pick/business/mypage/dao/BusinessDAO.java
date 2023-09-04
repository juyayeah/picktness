package com.pick.business.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pick.business.mypage.vo.BusinessDetailVO;
import com.pick.goods.vo.GoodsImageFileVO;
@Mapper
@Repository("businessDAO")
public interface BusinessDAO {
	public BusinessDetailVO placeDetail(String id) throws DataAccessException;
	public List<GoodsImageFileVO> businessImage(String goods_id) throws DataAccessException;
	public void insertBusinessDetail(Map newGoodsMap) throws DataAccessException;
	public void insertBusinessImage(GoodsImageFileVO imageFileVO) throws DataAccessException;

}
