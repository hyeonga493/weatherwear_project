package com.w2.client;

import java.util.Date;

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
	
	private String keyword;
}
