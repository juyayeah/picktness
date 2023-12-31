package com.pick.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.pick.goods.dao.GoodsDAO;
import com.pick.goods.vo.GoodsBusinessVO;
import com.pick.goods.vo.GoodsImageFileVO;
import com.pick.goods.vo.GoodsReviewAnswerVO;
import com.pick.goods.vo.GoodsReviewVO;
import com.pick.goods.vo.GoodsShoppingVO;
import com.pick.goods.vo.GoodsTrainerVO;
@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	GoodsDAO goodsDAO;

	@Override
	public List<GoodsBusinessVO> goodsBusinessAllList(Map option) throws DataAccessException {
		return goodsDAO.goodsBusinessAllList(option);
	}

	@Override
	public List<GoodsBusinessVO> goodsBusinessCateList(Map option) throws DataAccessException {
		return goodsDAO.goodsBusinessCateList(option);
	}
	

	@Override
	public List<GoodsBusinessVO> goodsBusinessAllTimeList(Map option) throws DataAccessException {
		return goodsDAO.goodsBusinessAllTimeList(option);
	}

	
	@Override
	public List<GoodsTrainerVO> goodsTrainerAllList(Map option) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.goodsTrainerAllList(option);
	}

	@Override
	public List<GoodsTrainerVO> goodsTrainerCateList(Map option) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.goodsTrainerCateList(option);
	}



	@Override
	public List<GoodsShoppingVO> goodsFoodAllList(Map option) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.goodsFoodAllList(option);
	}

	@Override
	public List<GoodsShoppingVO> goodsFoodCateList(Map option) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.goodsFoodCateList(option);
	}
	
	

	@Override
	public List<GoodsShoppingVO> goodsGoodsAllList(Map option) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.goodsGoodsAllList(option);
	}

	@Override
	public List<GoodsShoppingVO> goodsGoodsCateList(Map option) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.goodsGoodsCateList(option);
	}

	@Override
	public Map<String, List> searchGoods(String search_content) throws DataAccessException {
		// TODO Auto-generated method stub
		Map<String, List> result = new HashMap();
		List<GoodsBusinessVO> business = goodsDAO.businessSearch(search_content);
		if(!(business == null || business.isEmpty())) {
			result.put("business", business);
		}
		List<GoodsTrainerVO> trainer = goodsDAO.trainerSearch(search_content);
		if(!(trainer == null || trainer.isEmpty())) {
			result.put("trainer", trainer);
		}
		List<GoodsShoppingVO> shopping = goodsDAO.shoppingSearch(search_content);
		if(!(shopping == null || shopping.isEmpty())) {
			result.put("shopping", shopping);
		}
		return result;
	}

	@Override
	public GoodsBusinessVO goodsBusinessDetail(String goods_id) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.goodsBusinessDetail(goods_id);
	}

	@Override
	public List<GoodsImageFileVO> goodsBusinessImage(String goods_id) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.goodsBusinessImage(goods_id);
	}

	@Override
	public List<GoodsTrainerVO> goodsBusinessTrainerList(String id) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.goodsBusinessTrainerList(id);
	}

	@Override
	public List<GoodsReviewVO> goodsBusinessReviewList(String goods_id) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.goodsBusinessReviewList(goods_id);
	}

	@Override
	public List<GoodsReviewAnswerVO> goodsBusinessReviewAnswerList(String goods_id) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.goodsBusinessReviewAnswerList(goods_id);
	}

	@Override
	public GoodsShoppingVO goodsDetail(String goods_id) throws DataAccessException {
	    return goodsDAO.goodsDetail(goods_id);
	}

	@Override
	public List<GoodsImageFileVO> selectGoodsDetailImage(String goods_id) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.selectGoodsDetailImage(goods_id);
	}

	@Override
	public String businessImageFileName(String goods_id) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.businessImageFileName(goods_id);
	}

	@Override
	public String trainerImageFileName(String goods_id) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.trainerImageFileName(goods_id);
	}

	@Override
	public String shoppingImageFileName(String goods_id) throws DataAccessException {
		// TODO Auto-generated method stub
		return goodsDAO.shoppingImageFileName(goods_id);
	}
	
	
	
	
	
	

}
