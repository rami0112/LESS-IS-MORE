package common;

import lombok.Data;

@Data
public class Pagination {
	
	private int num; // 현재 페이지 번호
	private int count; // 게시물 총 갯수
	private int postNum = 10; // 한 페이지에 출력할 게시물 갯수
	private int pageNum; // 하단 페이징 번호
	private int displayPost; // 출력할 게시물
	private int pageNumCnt = 5; // 한 페이지에 표시할 페이징 번호의 갯수
	private int endPageNum; // 표시되는 페이징 번호 중 마지막 번호
	private int startPageNum; // 표시되는 페이징 번호 중 첫번째 번호

	private boolean prev; // 이전
	private boolean next; // 다음
	
	private String searchType;
	private String keyword;
	
	public void setCount(int count) {
		this.count = count;
		
		dataCalc();
	}
	
	public void dataCalc() {
		
		// 하단 페이징 번호 ([ 게시물 총 갯수 / 한 페이지에 출력할 갯수]의 올림)
		pageNum = (int)Math.ceil((double)count / (double)postNum);

		// 표시되는 페이지 번호 중 마지막 번호
		endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * (double)pageNumCnt);
		
		// 표시되는 페이지 번호 중 첫번째 번호
		startPageNum = endPageNum - (pageNumCnt - 1);
		
		
		// 마지막 번호 재계산
//		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNumCnt));
//		if (endPageNum > pageNum) {
//			endPageNum = pageNum;
//		}
		
		prev = startPageNum == 1 ? false : true;
		next = endPageNum * pageNumCnt >= count ? false : true;
		if (endPageNum > pageNum) {
			endPageNum = pageNum;
			next = false;
		}
		
		// 게시판 시작번호
		displayPost = (num - 1) * postNum;
		
	}
	
	// 검색 타입과 검색어
	public String getSearchTypeKeyword() {
		if (searchType.equals("") || keyword.equals("")) {
			return "";
		} else {
			return "&searchType=" + searchType + "&keyword=" + keyword;
		}
	}
}
