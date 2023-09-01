package com.pick.member.cart.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pick.member.cart.vo.MemberCartVO;

@Mapper
@Repository("memberCartDAO")
public interface MemberCartDAO {
	public String findCartGoods(MemberCartVO cartVO) throws DataAccessException;
	public void addCart(MemberCartVO cartVO) throws DataAccessException;
}
