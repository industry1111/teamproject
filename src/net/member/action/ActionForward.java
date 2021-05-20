package net.member.action;

public class ActionForward {

		//페이지 재요청방식 여부 값을 저장할 변수 
		private boolean isRedirect = false;
		
		//재요청해서 이동시킬 페이지의 주소 경로값을 저장할 변수
		private String path = null;
		
		//페이지 재요청방식 여부값을 새롭게 추가해서 저장할 메소드 
		public void setRedirect(boolean isRedirect){ //setter역할
			this.isRedirect = isRedirect;
		}
		//페이지 재요청방식 여부값이 저장되어 있는  isRedirect변수의 값 반환 메소드 
		public boolean isRedirect(){ //getter역할
			return isRedirect;
		}
		//재요청해서 이동시킬 페이지의 주소를 새롭게 저장할 메소드
		public void setPath(String path){//setter
			this.path = path;
		}
		//재요청해서 이동시킬 페이지의 주소를 위 path변수에서 얻어 반환(리턴)할 메소드 
		public String getPath(){//getter
			return path;
		}
		
}
