package com.pick.business.mypage.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface BusinessService {
	public Map placeDetail(String id) throws DataAccessException;
	public void insertBusinessDetail(Map newGoodsMap) throws DataAccessException;
	
}
