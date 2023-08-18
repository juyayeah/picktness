package com.pick.member.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pick.member.vo.MemberVO;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
	public MemberVO loginById(Map loginMap) throws DataAccessException;
	public MemberVO inserMember(MemberVO memberVO) throws DataAccessException;
}
