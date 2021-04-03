package rest.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.Pagination;
import rest.board.service.BoardService;
import rest.board.vo.BoardVO;

@Controller
@RequestMapping("/")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 게시판리스트
	@GetMapping("board/boardList")
	public void boardListGet(Model model
			, @RequestParam("num") int num
			, @RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType
			, @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {
		
		Pagination pagination = new Pagination();
		
		pagination.setNum(num);
		pagination.setCount(boardService.selectCount(searchType, keyword));
		
		// 검색 타입과 검색어
		pagination.setSearchType(searchType);
		pagination.setKeyword(keyword);
		
		model.addAttribute("board", boardService.selectBoard(pagination.getDisplayPost(), pagination.getPostNum(), searchType, keyword));
		model.addAttribute("pagination", pagination);

		// 현재 페이지
		model.addAttribute("select", num);
	}
	
	// 게시판-글쓰기(회원만)
	@GetMapping("board/boardWrite")
	public String boardWriteGet() {
		return "board/boardWrite";
	}
	
	@PostMapping("board/boardWrite")
	public String boardWrite(BoardVO boardVO, Model model, HttpServletRequest request) {
		if (boardVO.getTitle().isEmpty()) {
			model.addAttribute("msg", "제목을 입력해주세요.");
			model.addAttribute("uri", request.getRequestURI());
			model.addAttribute("board", boardVO);
			return "common/alert";
		} else if (boardVO.getContent().isEmpty()) {
			model.addAttribute("msg", "내용을 입력해주세요.");
			model.addAttribute("uri", request.getRequestURI());
			return "common/alert";
		} else {	
			int result = boardService.insertBoard(boardVO);
			if (result == 1) {
				model.addAttribute("msg", "글쓰기를 완료하였습니다.");
				model.addAttribute("uri", request.getContextPath() + "/board/boardList?num=1");
				return "common/alert";
			}
			return "board/boardWrite";
		}
	}
	
	// 게시판-상세보기(회원만)
	@GetMapping("board/boardDetail")
	public String boardDetailGet(@RequestParam("board_no")long board_no, Model model, HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("member") == null) {
			model.addAttribute("msg", "회원만 열람가능합니다.");
			model.addAttribute("uri", request.getContextPath() + "/member/login");
			return "common/alert";
		} else {
			model.addAttribute("board", boardService.selectBoardDetail(board_no));
			
			return "board/boardDetail";
		}
	}
	
	// 게시판-수정하기(작성자만)
	@GetMapping("board/boardModify")
	public String boardModifyGet(@RequestParam("board_no")long board_no, Model model) {
		model.addAttribute("board", boardService.selectBoardDetail(board_no));
		return "board/boardModify";
	}
	
	@PostMapping("board/boardModify")
	public String boardModify(BoardVO boardVO, Model model, HttpServletRequest request) {
		int result = boardService.updateBoard(boardVO);
		if (result == 1) {
			model.addAttribute("msg", "수정되었습니다.");
			model.addAttribute("uri", request.getContextPath() + "/board/boardDetail?board_no=" + boardVO.getBoard_no());
			return "common/alert";
		}
		return "board/boardModify";
	}
	
	// 게시판-삭제하기(작성자만)
	@GetMapping("board/boardDelete")
	public String boardDeleteGet(@RequestParam("board_no")long board_no, Model model, HttpServletRequest request) {
		int result = boardService.deleteBoard(board_no);
		if (result == 1) {
			model.addAttribute("msg", "삭제되었습니다.");
			model.addAttribute("uri", request.getContextPath() + "/board/boardList?num=1");
			return "common/alert";
		}
		return "board/boardDetail";
	}
	
}
