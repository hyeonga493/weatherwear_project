package com.w2.paging;

public class SearchVO {
	private String searchWord;
	private String keyword;
	
	public SearchVO() {}
	
	public String getSearchWord() {
		if(searchWord == null)
			searchWord = "";
		
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getKeyword() {
		if(keyword == null)
			keyword = "";
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}	
}
