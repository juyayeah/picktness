package com.pick.member.mypage.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.pick.member.mypage.vo.MemberMypagePointVO;
import com.pick.member.order.vo.MemberOrderBusinessVO;
import com.pick.member.order.vo.MemberOrderShoppingVO;
import com.pick.member.order.vo.MemberOrderTotalVO;
import com.pick.member.vo.MemberVO;

public interface MemberMypageService {
	public List<MemberMypagePointVO> allPointList(String id) throws DataAccessException;
	public List<MemberMypagePointVO> addPointList(String id) throws DataAccessException;
	public List<MemberMypagePointVO> usePointList(String id) throws DataAccessException;
	public MemberVO memberDetail(String id) throws DataAccessException;
	public List<MemberOrderTotalVO> orderTotalList(String member_id) throws DataAccessException;
	public List<MemberOrderShoppingVO> orderShoppingList(String member_id) throws DataAccessException;
	public List<MemberOrderBusinessVO> orderBusinessList(String member_id) throws DataAccessException;
	public List<MemberOrderBusinessVO> orderTrainerList(String member_id) throws DataAccessException;
}
