package com.pick.business.mypage.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.pick.business.mypage.vo.BusinessVO;
import com.pick.business.mypage.dao.BusinessDAO;
@Service("businessService")
public class BusinessServiceImpl implements BusinessService{
	@Autowired
	BusinessDAO businessDAO;
	@Autowired
	BusinessVO businessVO; 



	@Override
	public void insertBusinessDetail(Map gymmap) throws Exception {
		businessDAO.insertBusinessDetail(gymmap);
		
	}

}
