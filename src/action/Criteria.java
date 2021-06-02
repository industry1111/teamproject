package action;

public class Criteria {
	private int nowPage;		//현재 페이지 번호
	private int nowBlock;		//현재 블럭
	private int numPerPage;		//페이지당 보여질 글 수
	private int pagePerBlock;	//블럭당 보여질 페이지 수
	
	// 기본값으로 현재 페이지:1,현재 블럭: 1 페이지당 보여질 글 수 : 5, 블럭당 보여질 페이지 수 : 5
	public Criteria(int numPerPage,int pagePerBlock) {
		this(1,1,numPerPage,pagePerBlock);
	}
	public Criteria(int nowPage,int nowBlock,int numPerPage, int pagePerBlock) {
		this.nowPage = nowPage;
		this.nowBlock = nowBlock;
		this.numPerPage = numPerPage;
		this.pagePerBlock = pagePerBlock;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	
	
}
