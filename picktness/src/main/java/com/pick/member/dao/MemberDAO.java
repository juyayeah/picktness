package com.pick.member.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pick.member.vo.BusinessVO;
import com.pick.member.vo.MemberVO;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
	public MemberVO loginById(Map loginMap) throws DataAccessException;
	public void insertMember(MemberVO memberVO) throws DataAccessException;
	public void insertB_Member(BusinessVO businessVO) throws DataAccessException;
	public void eventInitPoint(MemberVO memberVO) throws DataAccessException;
	public int idCheck(String id) throws DataAccessException;
	public int bIdCheck(String id) throws DataAccessException;
	public int emailCheck(Map emailChk) throws DataAccessException;
	public int bEmailCheck(Map bEmailChk) throws DataAccessException;
	public BusinessVO loginBusiness(Map loginMap) throws DataAccessException;
	public MemberVO selectById(String id) throws DataAccessException;
	public int checkByEmail(String email) throws DataAccessException;
	public MemberVO selectByEmail(String email) throws DataAccessException;
	public void addKakaoMember(Map kakaoMap) throws DataAccessException;
}
