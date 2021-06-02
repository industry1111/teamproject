package action;

public class PageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev,next;
	
	private int total;				// 총 글 수 
	private int totalPage;			// 총 페이지 수
	private int totalBlock;			// 총 블럭 수
	private Criteria cri;	
	
	public PageDTO(Criteria cri,int total) {
		//페이징 DTO 생성 시  페이지당 보여질 목록 수 , 블럭당 보여질 페이지 수 , 리스트 크기를 받아온다
		this.cri = cri;
		this.total = total;
		this.totalPage = (int) Math.ceil((total)/cri.getNumPerPage());
		this.totalBlock = (int) Math.ceil((this.totalPage/cri.getPagePerBlock()));
		
		this.startPage = (int) Math.ceil((cri.getNowPage()-1)*cri.getNumPerPage());
		this.endPage = (int) Math.ceil(this.startPage+cri.getNumPerPage()-1);
		
		
		
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

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	
	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	
}
