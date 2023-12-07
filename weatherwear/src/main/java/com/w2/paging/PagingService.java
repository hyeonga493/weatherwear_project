package com.w2.paging;

import java.util.List;

import org.springframework.ui.Model;

import com.w2.admin.notice.NoticeBoardVO;
import com.w2.admin.order.AdminOrderVO;
import com.w2.admin.qna.QnaBoardVO;
import com.w2.client.ClientVO;
import com.w2.client.qna.QnaVO;
import com.w2.file.ImageVO;
import com.w2.product.ProductVO;

public interface PagingService {
 
	// 리스트 출력
	public List<ClientVO> clientList(Integer page, ClientVO client, Model model);
	
	public List<ProductVO> productListAdmin(Integer page, ProductVO pro, Model model);
	public List<ProductVO> productListClient(Integer page, ProductVO pro, Model model);
	public List<ImageVO> getProductMain(Integer page, ProductVO pro, Model model);
	
	public List<NoticeBoardVO> NoticeBoardList(Integer page, NoticeBoardVO notice, Model model);

	public List<QnaBoardVO> qnaBoardList(Integer page, QnaBoardVO qna, Model model);

	public List<QnaVO> getQnaMyPageList(Integer page, QnaVO clientQna, Model model);

	public List<QnaVO> qnaList(Integer page, QnaVO clientQna, Model model);

	List<AdminOrderVO> getAdminOrderListAll(Integer page, AdminOrderVO adminOrderVO, Model model) throws Exception;

	List<AdminOrderVO> getAdminOrderList(Integer page, AdminOrderVO adminOrderVO, Model model) throws Exception;
	
}
