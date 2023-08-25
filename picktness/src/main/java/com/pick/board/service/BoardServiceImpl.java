package com.pick.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.pick.board.dao.BoardDAO;
import com.pick.board.vo.BoardVO;
import com.pick.board.vo.CommentVO;

@Service("boardService")
@Transactional(propagation= Propagation.REQUIRED)
public class BoardServiceImpl {
	@Autowired
	BoardDAO boardDAO;
	
	
	
	public List<BoardVO> listFreeBoards() throws Exception{
		List<BoardVO> freeBoardList=boardDAO.selectAllFreeBoardList();
		return freeBoardList;
	}
	
	public int addNewMillBoard(Map boardMap) throws Exception {
		int bno = boardDAO.selectNewBoardNO();
		boardMap.put("bno", bno);
		boardDAO.insertNewMillBoard(boardMap);
		
		System.out.println("maxArticle:" + bno);
		return bno;
	}
	public List<BoardVO> millBoardList() throws Exception{
		
		
		List<BoardVO>millList = boardDAO.selectAllMillList();
		return millList;
	}
    
    public BoardVO getMillByBno(int bno) {
        return boardDAO.getMillByBno(bno);
    }

    public void addComment(CommentVO comment) {
        boardDAO.insertComment(comment);
    }
    
    public List<CommentVO> getComments(int bno) {
    	return boardDAO.getComments(bno);
    }
    
    public void deleteComment(int cno) {
        boardDAO.deleteComment(cno);
    }
    
    public void updateComment(CommentVO comment) {
        boardDAO.updateComment(comment);
    }



}
