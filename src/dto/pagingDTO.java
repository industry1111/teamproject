package dto;

public class pagingDTO {
	
	private int pageSize; // 게시글이 출력될 수 -> 한페이지에 게시물이 몇개 나올것인가
	private String pageNum; // 게시글 수 
	private int currentPage; //현재페이지 
	private int startRow; // 
	private int count;// 
	private int pageBlock; // 페이지 그룹 출력 개수 ex) [1],[2]  <<----이런 페이징 처리시 페이지 번호 개수
	private int startPage; // 시작페이지 
	private int endPage; // 마지막페이지 
	private int pageCount;//
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	
	
	
}