package com.pick.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pick.board.dao.BoardDAO;
import com.pick.board.vo.BoardVO;

@Service("boardService")
@Transactional(propagation= Propagation.REQUIRED)
public class BoardService {
	@Autowired
	BoardDAO boardDAO;
	
	public List<BoardVO> listFreeBoards() throws Exception{
		List<BoardVO> freeBoardList=boardDAO.selectAllFreeBoardList();
		return freeBoardList;
	}

}
