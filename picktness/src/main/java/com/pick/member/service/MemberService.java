package com.pick.member.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pick.member.vo.BusinessVO;
import com.pick.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(Map loginMap) throws DataAccessException;
	public void addMember(MemberVO memberVO) throws DataAccessException;
	public void addB_Member(BusinessVO business) throws DataAccessException;
	public int idCheck(String id) throws DataAccessException;
	public int emailCheck(Map emailChk) throws DataAccessException;
	public BusinessVO loginBusiness(Map loginMap) throws DataAccessException;
}
