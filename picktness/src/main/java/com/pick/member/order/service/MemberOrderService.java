package com.pick.member.order.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.pick.member.mypage.vo.MemberMypagePointVO;
import com.pick.member.order.vo.MemberOrderBusinessVO;
import com.pick.member.order.vo.MemberOrderShoppingVO;
import com.pick.member.order.vo.MemberOrderTotalVO;


public interface MemberOrderService {
	public void addTotalOrder(MemberOrderTotalVO totalVO) throws DataAccessException;
	public void addBusinessOrder(List<MemberOrderBusinessVO> businessOrderList) throws DataAccessException;
	public void addShoppingOrder(List<MemberOrderShoppingVO> shoppingOrderList) throws DataAccessException;
	public void addOrderPoint(MemberMypagePointVO pointVO) throws DataAccessException;
	public void useOrderPoint(MemberMypagePointVO pointVO) throws DataAccessException;
}
