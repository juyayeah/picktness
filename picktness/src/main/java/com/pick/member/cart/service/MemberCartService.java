package com.pick.member.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pick.member.cart.vo.MemberCartVO;

public interface MemberCartService {
	public boolean findCartGoods(MemberCartVO cartVO) throws DataAccessException;
	public void addCart(MemberCartVO cartVO) throws DataAccessException;
	public Map<String, List> cartList(String member_id) throws DataAccessException;
	public void removeCartGoods(String cart_id) throws DataAccessException;
	public void updateCartGoods(Map updateMap) throws DataAccessException;
}
