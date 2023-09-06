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
import com.pick.board.vo.FaqVO;
import com.pick.board.vo.NoticeVO;

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

    public void millrInsert(CommentVO comment) {
        boardDAO.insertComment(comment);
    }
    
    public List<CommentVO> getComments(int bno) {
    	return boardDAO.getComments(bno);
    }
    
    public void deleteComment(int p_bno) {
        boardDAO.deleteComment(p_bno);
    }
    
    public void updateComment(CommentVO comment) {
        boardDAO.updateComment(comment);
    }
    public void delete(int bno) {
    	boardDAO.deleteMillBoard(bno);
    }


	public BoardVO selectMillBoard(int bno) {
		 return boardDAO.getMillByBno(bno);
		
	}
	public void modMillBoard(Map boardMap) throws Exception {
		System.out.println("디버그 로그: 메서드가 실행됨 before");
		System.out.println(boardMap);
		boardDAO.updateMillBoard(boardMap);
		System.out.println("디버그 로그: 메서드가 실행됨 after");
	}

	public List<NoticeVO> noticeList() {
		List<NoticeVO> NoticeList = boardDAO.selectNoticeList();
		return NoticeList;
	}

	public NoticeVO selectNoticeList(int bno) {
		return boardDAO.getNoticeByBno(bno);
		
	}


	public void deleteNotice(int bno) {
		boardDAO.deleteNotice(bno);
		
	}

	public void insertNotice(NoticeVO noticeVO) {
		boardDAO.insertNotice(noticeVO);
		
	}

	public void updateNotice(NoticeVO noticeVO) {
		boardDAO.updateNotice(noticeVO);
		
	}

	public List<FaqVO> selectFaqList() {
		List<FaqVO> faqList =boardDAO.selectAllFaqList();
		return faqList;
	}

	public void insertFaq(FaqVO faqVO) {
	      boardDAO.insertFaq(faqVO);
		
	}

	public void updateFaq(FaqVO faqVO) {
		boardDAO.updateFaq(faqVO);
		
	}

	public FaqVO selectFaqList(int bno) {
		
		return boardDAO.getFaqByBno(bno);
	}

	public void deleteFaq(int bno) {
		boardDAO.deleteFaq(bno);
		
	}




}
