package com.pick.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pick.goods.vo.GoodsBusinessVO;
import com.pick.goods.vo.GoodsImageFileVO;
import com.pick.goods.vo.GoodsReviewAnswerVO;
import com.pick.goods.vo.GoodsReviewVO;
import com.pick.goods.vo.GoodsShoppingVO;
import com.pick.goods.vo.GoodsTrainerVO;

public interface GoodsService {
	public List<GoodsBusinessVO> goodsBusinessAllList(Map option) throws DataAccessException;
	public List<GoodsBusinessVO> goodsBusinessCateList(Map option) throws DataAccessException;
	public List<GoodsBusinessVO> goodsBusinessAllTimeList(Map option) throws DataAccessException;
	public List<GoodsTrainerVO> goodsTrainerAllList(Map option) throws DataAccessException;
	public List<GoodsTrainerVO> goodsTrainerCateList(Map option) throws DataAccessException;
	public List<GoodsShoppingVO> goodsFoodAllList(Map option) throws DataAccessException;
	public List<GoodsShoppingVO> goodsFoodCateList(Map option) throws DataAccessException;
	public List<GoodsShoppingVO> goodsGoodsAllList(Map option) throws DataAccessException;
	public List<GoodsShoppingVO> goodsGoodsCateList(Map option) throws DataAccessException;
	public Map<String, List> searchGoods(String search_content) throws DataAccessException;
	public GoodsBusinessVO goodsBusinessDetail(String goods_id) throws DataAccessException;
	public List<GoodsImageFileVO> goodsBusinessImage(String goods_id) throws DataAccessException;
	public List<GoodsTrainerVO> goodsBusinessTrainerList(String id) throws DataAccessException;
	public List<GoodsReviewVO> goodsBusinessReviewList(String goods_id) throws DataAccessException;
	public List<GoodsReviewAnswerVO> goodsBusinessReviewAnswerList(String goods_id) throws DataAccessException;
	public GoodsShoppingVO goodsDetail(String goods_id) throws DataAccessException;
}
