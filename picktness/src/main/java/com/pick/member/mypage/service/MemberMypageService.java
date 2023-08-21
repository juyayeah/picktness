package com.pick.member.mypage.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.pick.member.mypage.vo.MemberMypagePointVO;

public interface MemberMypageService {
	public List<MemberMypagePointVO> allPointList(String id) throws DataAccessException;
	public List<MemberMypagePointVO> addPointList(String id) throws DataAccessException;
	public List<MemberMypagePointVO> usePointList(String id) throws DataAccessException;
	
}
