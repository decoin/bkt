package com.bkt.util;

public class Pagination {
	//开始位置
	private int start;
	
	//一次取得的数量
	private int size;
	
	//要取得的页数
	private int currentPage = 1;
	
	//总的记录页数
	private int totalPage = 0;
	
	//总的记录条数
	private int totalRecord;
	
	
	//获取开始记录
	public int getStart(){
		this.start = (currentPage - 1)*size;
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	
	public int getTotalRecord(){
		return totalRecord;
	}
	//设置所有记录,并且根据所有记录计算所有页码
	public void setTotalRecord(int totalRecord){
		this.totalRecord = totalRecord;
		//获取页数
		this.totalPage = totalRecord % size == 0 ? totalRecord / size:totalRecord / size +1;
	}
	
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}
