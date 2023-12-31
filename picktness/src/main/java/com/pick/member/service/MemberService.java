package com.pick.member.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pick.member.vo.BusinessVO;
import com.pick.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(Map<String, String> loginMap) throws DataAccessException;
	public void addMember(MemberVO memberVO) throws DataAccessException;
	public void addB_Member(BusinessVO business) throws DataAccessException;
	public int idCheck(String id) throws DataAccessException;
	public int bIdCheck(String id) throws DataAccessException;
	public int emailCheck(Map<String, String> emailChk) throws DataAccessException;
	public int bEmailCheck(Map<String, String> bEmailChk) throws DataAccessException;
	public BusinessVO loginBusiness(Map<String, String> loginMap) throws DataAccessException;
	public MemberVO selectById(String id) throws DataAccessException;
	public MemberVO mailCheck(String email) throws DataAccessException;
	public MemberVO addKakaoMember(Map<String, String> kakaoMap) throws DataAccessException;
}
