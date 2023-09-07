package com.pick.member.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.pick.member.cart.vo.MemberCartVO;
import com.pick.member.mypage.vo.MemberMypagePointVO;
import com.pick.member.order.dao.MemberOrderDAO;
import com.pick.member.order.vo.MemberOrderBusinessVO;
import com.pick.member.order.vo.MemberOrderShoppingVO;
import com.pick.member.order.vo.MemberOrderTotalVO;

@Service("memberOrderService")
public class MemberOrderServiceImpl implements MemberOrderService {
	@Autowired
	MemberOrderDAO memberOrderDAO;
	
	@Override
	public void addTotalOrder(MemberOrderTotalVO totalVO) throws DataAccessException {
		memberOrderDAO.addTotalOrder(totalVO);
	}

	@Override
	public void addBusinessOrder(List<MemberOrderBusinessVO> businessOrderList) throws DataAccessException {
		for(MemberOrderBusinessVO orderBusinessVO : businessOrderList) {
			memberOrderDAO.addBusinessOrder(orderBusinessVO);
		}
	}

	@Override
	public void addShoppingOrder(List<MemberOrderShoppingVO> shoppingOrderList) throws DataAccessException {
		for(MemberOrderShoppingVO orderShoppingVO : shoppingOrderList) {
			memberOrderDAO.addShoppingOrder(orderShoppingVO);
		}
		
	}

	@Override
	public void addOrderPoint(MemberMypagePointVO pointVO) throws DataAccessException {
		memberOrderDAO.addOrderPoint(pointVO);
		memberOrderDAO.addMemberPoint(pointVO);
		
	}
	
	@Override
	public void useOrderPoint(MemberMypagePointVO pointVO) throws DataAccessException {
		memberOrderDAO.useOrderPoint(pointVO);
		memberOrderDAO.useMemberPoint(pointVO);
	}

	@Override
	public void orderRemoveCartGoods(List<MemberCartVO> orderCartList) throws DataAccessException {
		for(MemberCartVO cartVO : orderCartList) {
			int cart_id = cartVO.getCart_id();
			memberOrderDAO.orderRemoveCartGoods(cart_id);
		}
		
	}
	
	
	
	
	
}
