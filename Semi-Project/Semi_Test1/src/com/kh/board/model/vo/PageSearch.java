package com.kh.board.model.vo;

public class PageSearch {

	private String searchrecipe;
	
	private String search_sort;
	
	public PageSearch(String searchrecipe, String search_sort) {
		this.searchrecipe = searchrecipe;
		this.search_sort = search_sort;
	}
	
	public String getsearch1() {
		return searchrecipe;
	}
	
	public String getsearch2() {
		return search_sort;
	}
}
