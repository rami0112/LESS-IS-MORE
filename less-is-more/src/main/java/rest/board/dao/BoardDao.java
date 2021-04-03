package rest.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.Pagination;
import rest.board.vo.BoardVO;

@Repository
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "mapper.BoardMapper.";
	
	public List<BoardVO> selectBoard(int displayPost, int postNum, String searchType, String keyword) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		 data.put("displayPost", displayPost);
		 data.put("postNum", postNum);
		  
		 data.put("searchType", searchType);
		 data.put("keyword", keyword);
		
		return sqlSession.selectList(NAMESPACE + "selectBoard", data);
	}
	
	public BoardVO selectBoardDetail(long board_no) {
		return sqlSession.selectOne(NAMESPACE + "selectBoardDetail", board_no);
	}
	
	// 게시물 총 갯수 + 검색 적용
	public int selectCount(String searchType, String keyword) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		 
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		 
		return sqlSession.selectOne(NAMESPACE + "selectCount", data);
	}
	
	public int insertBoard(BoardVO boardVO) {
		return sqlSession.insert(NAMESPACE + "insertBoard", boardVO);
	}
	
	public int updateBoard(BoardVO boardVO) {
		return sqlSession.update(NAMESPACE + "updateBoard", boardVO);
	}
	
	public int deleteBoard(long board_no) {
		return sqlSession.delete(NAMESPACE + "deleteBoard", board_no);
	}
	
}
