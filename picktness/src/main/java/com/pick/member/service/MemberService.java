package com.pick.member.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pick.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(Map loginMap) throws DataAccessException;
	public void addMember(MemberVO memberVO) throws Exception;
	public int idCheck(String id) throws Exception;
}
