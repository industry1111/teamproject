package action;

public class PageDTO {
	
	private int startPage;		// 시작 페이지
	private int endPage;		// 끝 페이지
	private boolean prev,next; //이전 , 다음 페이지 유무
	
	private int total;				// 총 글 수 
	private Criteria cri;	
	
	private int beginPerPage;	
	private int endPerPage;
	public PageDTO(Criteria cri,int total) {
		//페이징 DTO 생성 시  페이지당 보여질 목록 수 , 블럭당 보여질 페이지 수 , 리스트 크기를 받아온다
		this.cri = cri;
		this.total = total;
		this.endPage = (int) (Math.ceil(cri.getNowPage() /cri.getNumPerPage())) * (int)cri.getNumPerPage();
		this.startPage = this.endPage -(int)cri.getNumPerPage()+1;
		
		this.beginPerPage = (int)((cri.getNowPage()-1)*cri.getNumPerPage());  //페이지 클릭시 처음에 보여줄 상품
		this.endPerPage = (int)(this.beginPerPage + cri.getNumPerPage()-1);  // 페이지 클릭시 마지막에 보여줄 상품	
		//실제 끝 페이지
		int realEnd = (int) (Math.ceil((total *1.0) / cri.getNumPerPage()));
		
		
		if(realEnd <= this.endPage){// 실제 끝 페이지가 끝 페이지보다 작으면
			this.endPage = realEnd; //끝 페이지로 실제 끝 페이지 값으로 변경
		}
	
		
		//시작 페이지가 1페이지보다 크면 prev가 true
		this.prev = this.startPage > 1;
		//끝 페이지가 실제 끝 페이지보다 작으면 next가 true
		this.next = this.endPage < realEnd;
		
		
		
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


	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getBeginPerPage() {
		return beginPerPage;
	}

	public void setBeginPerPage(int beginPerPage) {
		this.beginPerPage = beginPerPage;
	}

	public int getEndPerPage() {
		return endPerPage;
	}

	public void setEndPerPage(int endPerPage) {
		this.endPerPage = endPerPage;
	}
	
	
}
