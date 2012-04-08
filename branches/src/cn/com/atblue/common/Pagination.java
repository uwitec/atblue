package cn.com.atblue.common;

public class Pagination {
	private final static int CORN_LENGTH_15=15;
	private int page = 1;
	private int pageSize = CORN_LENGTH_15;
	private int totalPage;
	private String message;
/**
 * 
 * @return int
 */
	public int getPage() {
		return page;
	}
/**
 * 
 * @param page int
 */
	public void setPage(int page) {
		this.page = page;
		if(page<=0) {
			this.page = 1;
		}
	}

	/**
	 * 
	 * @return int
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 
	 * @param pageSize int
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
//		if(pageSize<=0||pageSize>100) {
			//this.pageSize = 20;
//		}
	}
/**
 * 
 * @return int
 */
	public int getTotalPage() {
		return totalPage;
	}
/**
 * 
 * @return String
 */
	public String getMessage() {
		return message;
	}
/**
 * 
 * @param rowCount int
 */
	public void setRowCount(int rowCount) {
		this.totalPage = (rowCount+pageSize-1)/pageSize;
		if(page>totalPage&&page!=1) {
			page = totalPage;
		}
	}
/**
 * 
 * @param totalPage int
 */
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
/**
 * 
 * @param message String
 */
    public void setMessage(String message) {
        this.message = message;
    }
}
