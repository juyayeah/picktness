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
	public void eventInitPoint(MemberVO memberVO) throws DataAccessException;;
	public int idCheck(String id) throws DataAccessException;
	public int emailCheck(String id);

}
