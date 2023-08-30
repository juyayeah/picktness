package com.pick.admin.goods.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pick.admin.goods.dao.AdminGoodsDAO;
import com.pick.goods.vo.GoodsImageFileVO;

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
	
}
