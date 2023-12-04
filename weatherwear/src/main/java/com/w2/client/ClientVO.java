package com.w2.client;

import java.util.Date;

import com.w2.paging.SearchVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString 
public class ClientVO {
	private String clientId;				//필수
	private String clientPwd;				//필수
	private Date chPwdDate;
	private String clientName;				//필수
	private String clientNum;				//필수
	private String clientEmail;				//필수
	private char clientEmailCheck;			//필수
	private Date clientRegDate;
	private String clientRecId;
	private String clientBirth;				//필수
	private String clientNickName;			//필수
	private char gradeId;					//필수
	private int clientPoint;				//필수
	private String cpList;
	private String crList;
	private String cmarkList;
	private Date clientLogDate;
	private int clientBuyCnt;
	
	// 검색 기능(회원관리, 정보찾기)
	private String keyword;
	private String searchtype;
	
	// 페이징 정보(글 번호)
	private int postStart;
	private int postEnd;
	
	private int startPage;
	private int endPage;
}
