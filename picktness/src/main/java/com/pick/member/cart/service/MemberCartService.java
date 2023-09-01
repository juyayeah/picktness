package com.pick.member.cart.service;

import org.springframework.dao.DataAccessException;

import com.pick.member.cart.vo.MemberCartVO;

public interface MemberCartService {
	public boolean findCartGoods(MemberCartVO cartVO) throws DataAccessException;
	public void addCart(MemberCartVO cartVO) throws DataAccessException;
}
