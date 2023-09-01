package com.pick.member.cart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.pick.member.cart.dao.MemberCartDAO;
import com.pick.member.cart.vo.MemberCartVO;

@Service("memberCartService")
public class MemberCartServiceImpl implements MemberCartService{
	@Autowired
	MemberCartDAO memberCartDAO;
	
	@Override
	public boolean findCartGoods(MemberCartVO cartVO) throws DataAccessException {
		// TODO Auto-generated method stub
		String result = memberCartDAO.findCartGoods(cartVO);
		return Boolean.parseBoolean(result);
	}

	@Override
	public void addCart(MemberCartVO cartVO) throws DataAccessException {
		// TODO Auto-generated method stub
		memberCartDAO.addCart(cartVO);
	}
	
}
