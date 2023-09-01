package com.pick.business.mypage.service;

import java.util.Map;

public interface BusinessService {
	public Map placeDetail(String id) throws Exception;
	public void insertBusinessDetail(Map newGoodsMap) throws Exception;
}
