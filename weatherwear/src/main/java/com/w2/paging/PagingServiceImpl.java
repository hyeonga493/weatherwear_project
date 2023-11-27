package com.w2.paging;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.w2.client.ClientDAO;
import com.w2.client.ClientVO;

@Service("pagingService")
public class PagingServiceImpl implements PagingService{

	@Autowired
	private ClientDAO clientDAO;

	@Override
	public List<ClientVO> clientList(Integer page, ClientVO client, Model model) {

		int currentPage;
		
		if( page == null || page == 0) {
			currentPage = 1;
		} else { 
			currentPage = page;
		}
		System.err.println("======= currentPage : " + currentPage);
		
		int totalCount = clientDAO.searchCount(client);
		System.err.println("======= totalCount : " + totalCount);
		
		Paging paging = new Paging(totalCount, currentPage, client);
		
		int postStart = ((paging.getCurrentPage() -1) * 10) + 1;
		/* 현재 페이지가 5라면 ((5-1)*10)+1 = 41번부터 게시글 번호가 시작됩니다.*/
		
		int postEnd = paging.getCurrentPage() * 10;
		
		System.err.println("======= st/end : " + postStart + "/" + postEnd);
		
		client.setStartPage(paging.getStartPage());
		client.setEndPage(paging.getEndPage());
		client.setPostStart(postStart);
		client.setPostEnd(postEnd);

		System.err.println("=======>>>>>> client : " + client.toString());
		model.addAttribute("paging", paging);	// 바인딩
		
		List<ClientVO> clientList = clientDAO.clientList(client);

		/* new 마크 처리
		for( ClientVO client : clientList ) {
			// 1. 현재 시간 얻어 client 객체의 regDate
			// 24시간이 지나지 않은 경우 dto 객체의 newMark 속성을 True로 설정하기
			// timestamp : 1000분의 1초
			
			long nowTime = System.currentTimeMillis();
			
			Timestamp regDate = client.getRegDate();
			long regTime = regDate.getTime();
			
			if( (nowTime - regTime) < (1000 * 60 * 60 * 24)) {
				client.setNewMark(true);
			}
		}
		*/
		
		return clientList;
	}
	
}
