package com.pick.admin.goods.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pick.admin.goods.dao.AdminGoodsDAO;
import com.pick.goods.vo.GoodsImageFileVO;
import com.pick.goods.vo.GoodsShoppingVO;

@Service("adminGoodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminGoodsServiceImpl implements AdminGoodsService{
	@Autowired
	AdminGoodsDAO adminGoodsDAO;	

	@Override
	public int addNewGoods(Map newGoodsMap) throws DataAccessException {
		adminGoodsDAO.insertNewGoods(newGoodsMap);
		ArrayList<GoodsImageFileVO> imageFileList = (ArrayList<GoodsImageFileVO>) newGoodsMap.get("imageFileList");
		for(int i=0; i<imageFileList.size(); i++) {
			GoodsImageFileVO imageFileVO = imageFileList.get(i);
			adminGoodsDAO.insertGoodsImageFile(imageFileVO);
		}		
		return 0;
	}

	@Override
	public List goodsList() throws DataAccessException {
		return adminGoodsDAO.goodsList();
	}

	@Override
	public GoodsShoppingVO selectGoods(String goods_id) throws DataAccessException {
		return adminGoodsDAO.selectGoods(goods_id);
	}

	@Override
	public List selectImage(String goods_id) throws DataAccessException {

		return adminGoodsDAO.selectImage(goods_id);
	}

	@Override
	public void modifyGoodsInfo(Map goodsMap) throws DataAccessException {
		adminGoodsDAO.updateGoodsInfo(goodsMap);
	}
	
	
	
	
	
}
