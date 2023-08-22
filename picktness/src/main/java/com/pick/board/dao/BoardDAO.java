package com.pick.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("boardDAO")
public interface BoardDAO {

	
	public List selectAllFreeBoardList() throws DataAccessException;
		
	

}
