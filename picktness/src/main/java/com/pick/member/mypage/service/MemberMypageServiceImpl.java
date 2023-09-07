package com.pick.member.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.pick.member.mypage.dao.MemberMypageDAO;
import com.pick.member.mypage.vo.MemberMypagePointVO;
import com.pick.member.order.vo.MemberOrderBusinessVO;
import com.pick.member.order.vo.MemberOrderShoppingVO;
import com.pick.member.order.vo.MemberOrderTotalVO;
import com.pick.member.vo.MemberVO;
@Service("memberMypageService")
public class MemberMypageServiceImpl implements MemberMypageService{
	@Autowired
	MemberMypageDAO mypageDAO;

	@Override
	public List<MemberMypagePointVO> allPointList(String id) throws DataAccessException {
		return mypageDAO.allPointList(id);
	}

	@Override
	public List<MemberMypagePointVO> addPointList(String id) throws DataAccessException {
		// TODO Auto-generated method stub
		return mypageDAO.addPointList(id);
	}

	@Override
	public List<MemberMypagePointVO> usePointList(String id) throws DataAccessException {
		// TODO Auto-generated method stub
		return mypageDAO.usePointList(id);
	}
	
	@Override
	public MemberVO memberDetail(String id) throws DataAccessException {
		MemberVO memberVO = mypageDAO.selectMember(id);
		return memberVO;
	}

	@Override
	public List<MemberOrderTotalVO> orderTotalList(String member_id) throws DataAccessException {
		// TODO Auto-generated method stub
		System.out.println("서비스 진입");
		return mypageDAO.orderTotalList(member_id);
	}

	@Override
	public List<MemberOrderShoppingVO> orderShoppingList(String member_id) throws DataAccessException {
		// TODO Auto-generated method stub
		return mypageDAO.orderShoppingList(member_id);
	}

	@Override
	public List<MemberOrderBusinessVO> orderBusinessList(String member_id) throws DataAccessException {
		// TODO Auto-generated method stub
		return mypageDAO.orderBusinessList(member_id);
	}

	@Override
	public List<MemberOrderBusinessVO> orderTrainerList(String member_id) throws DataAccessException {
		// TODO Auto-generated method stub
		return mypageDAO.orderTrainerList(member_id);
	}
	
	
	
}
