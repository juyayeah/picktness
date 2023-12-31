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
	public MemberVO login(Map<String, String> loginMap) throws DataAccessException{
		return memberDAO.loginById(loginMap);
	}
	@Override
	public void addMember(MemberVO memberVO) throws DataAccessException {
		memberVO.setMemberPoint(5000);
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
	public int bIdCheck(String id) throws DataAccessException {
		return memberDAO.bIdCheck(id);
	}
	
	@Override
    public int emailCheck(Map<String, String> emailChk) throws DataAccessException {
        return memberDAO.emailCheck(emailChk);
    }
	@Override
    public int bEmailCheck(Map<String, String> bEmailChk) throws DataAccessException {
        return memberDAO.emailCheck(bEmailChk);
    }
	@Override
	public BusinessVO loginBusiness(Map<String, String> loginMap) throws DataAccessException {
		return memberDAO.loginBusiness(loginMap);
	}
	@Override
	public MemberVO selectById(String id) throws DataAccessException {
		return memberDAO.selectById(id);
	}
	@Override
	public MemberVO mailCheck(String email) throws DataAccessException {
		// TODO Auto-generated method stub
		int result = memberDAO.checkByEmail(email);
		if(result == 0) {
			return null;
		} else {
			return memberDAO.selectByEmail(email);
		}
	}
	@Override
	public MemberVO addKakaoMember(Map<String, String> kakaoMap) throws DataAccessException {
		memberDAO.addKakaoMember(kakaoMap);
		return memberDAO.selectById(kakaoMap.get("id"));
	}
	
	
	
	
	
	
	
	
}
