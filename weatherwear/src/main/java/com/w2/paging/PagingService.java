package com.w2.paging;

import java.util.List;

import org.springframework.ui.Model;

import com.w2.client.ClientVO;
import com.w2.product.ProductVO;

public interface PagingService {

	// 리스트 출력
	public List<ClientVO> clientList(Integer page, ClientVO client, Model model);
	
	public List<ProductVO> productList(Integer page, ProductVO pro, Model model);
}
