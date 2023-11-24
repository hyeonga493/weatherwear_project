package com.w2.client;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 아이디 체크
	public int idCheck(String clientId) {
		System.err.println("[ ClientDAO ] : idCheck");
		
		return sqlSessionTemplate.selectOne("ClientDAO.idCheck", clientId);
	}

	// 회원 정보 요청
	public ClientVO getClient(ClientVO client) {
		System.out.println("[ ClientDAO ] : getClient");

		return sqlSessionTemplate.selectOne("ClientDAO.getClient", client);
	}
	
	// 회원 정보 수정
	public ClientVO updateClient(ClientVO client) {
		System.out.println("[ ClientDAO ] : updateClient");
		
		if(sqlSessionTemplate.update("ClientDAO.updateClient", client) == 1) {			
			return sqlSessionTemplate.selectOne("ClientDAO.getClient", client);
		} else {
			ClientVO result = new ClientVO();
			result.setClientId("anonymous");
			
			return result;
		}
	}
	
	// 회원 탈퇴 요청
	public int withdrawClient(String clientId) {
		System.out.println("[ ClientDAO ] : withdrawClient");
		
		return sqlSessionTemplate.insert("ClientDAO.withdrawClient", clientId);
	}
	
	// 비밀번호 변경 요청
	public int updatePassword(ClientVO client) {
		System.out.println("[ ClientDAO ] : updatePassword");

		return sqlSessionTemplate.update("ClientDAO.updatePassword", client);
	}
	
	// 회원 등록
	public int insertClient(ClientVO client) {
		System.out.println("[ ClientDAO ] : insertClient");
	
		return sqlSessionTemplate.insert("ClientDAO.insertClient", client);
	}
}
