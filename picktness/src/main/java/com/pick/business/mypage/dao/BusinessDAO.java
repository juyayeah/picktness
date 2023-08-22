package com.pick.business.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.pick.business.mypage.vo.BusinessVO;
@Mapper
@Repository("businessDAO")
public interface BusinessDAO {
	public void insertBusinessDetail(Map gymmap) throws DataAccessException;

}
