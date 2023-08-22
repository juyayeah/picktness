package com.pick.business.mypage.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pick.business.mypage.vo.BusinessVO;
import com.pick.business.mypage.dao.BusinessDAO;

public interface BusinessService {
	public void insertBusinessDetail(Map gymmap) throws Exception;
}
