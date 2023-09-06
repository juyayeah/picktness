package com.pick.member.order.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pick.member.mypage.vo.MemberMypagePointVO;
import com.pick.member.order.vo.MemberOrderBusinessVO;
import com.pick.member.order.vo.MemberOrderShoppingVO;
import com.pick.member.order.vo.MemberOrderTotalVO;

@Mapper
@Repository("memberOrderDAO")
public interface MemberOrderDAO {
	public void addTotalOrder(MemberOrderTotalVO totalVO) throws DataAccessException;
	public void addBusinessOrder(MemberOrderBusinessVO orderBusinessVO) throws DataAccessException;
	public void addShoppingOrder(MemberOrderShoppingVO orderShoppingVO) throws DataAccessException;
	public void useOrderPoint(MemberMypagePointVO pointVO) throws DataAccessException;
	public void useMemberPoint(MemberMypagePointVO pointVO) throws DataAccessException; 
	public void addOrderPoint(MemberMypagePointVO pointVO) throws DataAccessException;
	public void addMemberPoint(MemberMypagePointVO pointVO) throws DataAccessException; 
}
