package com.pick.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.pick.goods.dao.GoodsDAO;
import com.pick.goods.vo.GoodsBusinessVO;
import com.pick.goods.vo.GoodsShoppingVO;
import com.pick.goods.vo.GoodsTrainerVO;
@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	GoodsDAO goodsDAO;

	@Override
	public List<GoodsBusinessVO> goodsBusinessAllList(double lat, double lng) throws DataAccessException {
		Map<String, Object> option = new HashMap<>();
		option.put("lat", lat);
		option.put("lng", lng);
		return goodsDAO.goodsBusinessAllList(option);
	}

	@Override
	public List<GoodsBusinessVO> goodsBusinessCateList(double lat, double lng, String cate) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
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

}
