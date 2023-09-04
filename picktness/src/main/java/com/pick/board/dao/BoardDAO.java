package com.pick.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.pick.board.vo.BoardVO;
import com.pick.board.vo.CommentVO;

@Mapper
@Repository("boardDAO")
public interface BoardDAO {

	
	public List selectAllFreeBoardList() throws DataAccessException;
	public int insertNewMillBoard(Map boardMap) throws DataAccessException;
    public List selectAllMillList()throws DataAccessException;
    public int selectNewBoardNO()throws DataAccessException;
    
    public BoardVO getMillByBno(int bno) throws DataAccessException;
    
    void insertComment(Map boardMap) throws DataAccessException;
        
    public void insertComment(CommentVO comment) throws DataAccessException;
    // 댓글 조회
    public List<CommentVO> getComments(int bno) throws DataAccessException;
    // 댓글 삭제
    public void deleteComment(int p_bno) throws DataAccessException;
    // 댓글 수정
    public void updateComment(CommentVO comment) throws DataAccessException;

    public void deleteMillBoard(int bno) throws DataAccessException;
    

    public void updateMillBoard (Map boardMap) throws DataAccessException;
    
}


    	
    

