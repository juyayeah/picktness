package com.pick.business.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pick.business.mypage.dao.BusinessDAO;
import com.pick.business.mypage.vo.BusinessDetailVO;
import com.pick.goods.vo.GoodsImageFileVO;
@Service("businessService")
public class BusinessServiceImpl implements BusinessService{
	@Autowired
	BusinessDAO businessDAO;


	
	@Override
	public Map placeDetail(String id) throws Exception {
		BusinessDetailVO businessDetail = businessDAO.placeDetail(id);
		Map businessMap = new HashMap();
		businessMap.put("businessDetail", businessDetail);
		if(businessDetail != null) {
			String goods_id = businessDetail.getGoods_id();
			List<GoodsImageFileVO> placeImageList = businessDAO.businessImage(goods_id);
			businessMap.put("placeImageList", placeImageList);
		}
		return businessMap;
	}



	@Override
	public void insertBusinessDetail(Map gymmap) throws Exception {
		businessDAO.insertBusinessDetail(gymmap);
		
	}

}
