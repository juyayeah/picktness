package com.pick.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.pick.member.dao.MemberDAO;
import com.pick.member.vo.BusinessVO;
import com.pick.member.vo.MemberVO;
@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO memberDAO;
	@Autowired
	MemberVO memberVO;
	public MemberVO login(Map loginMap) throws DataAccessException{
		return memberDAO.loginById(loginMap);
	}
	@Override
	public void addMember(MemberVO memberVO) throws DataAccessException {
		memberDAO.insertMember(memberVO);
		memberDAO.eventInitPoint(memberVO);	
	}
	
	@Override
	public void addB_Member(BusinessVO businessVO) throws DataAccessException {
		memberDAO.insertB_Member(businessVO);
		
	}
	@Override
	public int idCheck(String id) throws DataAccessException {
		return memberDAO.idCheck(id);
	}
	
	@Override
    public int emailCheck(Map emailChk) throws DataAccessException {
        return memberDAO.emailCheck(emailChk);
    }
	@Override
	public BusinessVO loginBusiness(Map loginMap) throws DataAccessException {
		return memberDAO.loginBusiness(loginMap);
	}
	
	
	
}
