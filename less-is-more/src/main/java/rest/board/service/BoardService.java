package rest.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import common.Pagination;
import rest.board.dao.BoardDao;
import rest.board.vo.BoardVO;

@Service
@Transactional
public class BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	public List<BoardVO> selectBoard(int displayPost, int postNum, String searchType, String keyword) {
		return boardDao.selectBoard(displayPost, postNum, searchType, keyword);
	}

	public BoardVO selectBoardDetail(long board_no) {
		return boardDao.selectBoardDetail(board_no);
	}
	
	public int selectCount(String searchType, String keyword) {
		return boardDao.selectCount(searchType, keyword);
	}
	
	public int insertBoard(BoardVO boardVO) {
		return boardDao.insertBoard(boardVO);
	}
	
	public int updateBoard(BoardVO boardVO) {
		return boardDao.updateBoard(boardVO);
	}
	
	public int deleteBoard(long board_no) {
		return boardDao.deleteBoard(board_no);
	}
	
}
