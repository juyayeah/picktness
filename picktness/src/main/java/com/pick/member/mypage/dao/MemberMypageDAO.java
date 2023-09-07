package com.pick.member.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pick.member.mypage.vo.MemberMypagePointVO;
import com.pick.member.order.vo.MemberOrderBusinessVO;
import com.pick.member.order.vo.MemberOrderShoppingVO;
import com.pick.member.order.vo.MemberOrderTotalVO;
import com.pick.member.vo.MemberVO;
@Mapper
@Repository("memberMypageDAO")
public interface MemberMypageDAO {
	public List<MemberMypagePointVO> allPointList(String id) throws DataAccessException;
	public List<MemberMypagePointVO> addPointList(String id) throws DataAccessException;
	public List<MemberMypagePointVO> usePointList(String id) throws DataAccessException;
	public MemberVO selectMember(String id) throws DataAccessException;
	public List<MemberOrderTotalVO> orderTotalList(String member_id) throws DataAccessException;
	public List<MemberOrderBusinessVO> orderBusinessList(String member_id) throws DataAccessException;
	public List<MemberOrderShoppingVO> orderShoppingList(String member_id) throws DataAccessException;
	public List<MemberOrderBusinessVO> orderTrainerList(String member_id) throws DataAccessException;
}
