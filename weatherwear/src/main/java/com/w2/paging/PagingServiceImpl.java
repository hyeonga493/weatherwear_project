package com.w2.paging;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.w2.admin.notice.NoticeBoardDAO;
import com.w2.admin.notice.NoticeBoardVO;
import com.w2.admin.order.AdminOrderDAO;
import com.w2.admin.order.AdminOrderVO;
import com.w2.admin.qna.QnaBoardDAO;
import com.w2.admin.qna.QnaBoardVO;
import com.w2.client.ClientDAO;
import com.w2.client.ClientVO;
import com.w2.client.qna.QnaDAO;
import com.w2.client.qna.QnaVO;
import com.w2.file.ImageVO;
import com.w2.product.ProductDAO;
import com.w2.product.ProductVO;

@Service("pagingService")
public class PagingServiceImpl implements PagingService{
 
   @Autowired
   private ClientDAO clientDAO;
   @Autowired
   private ProductDAO productDAO;
   @Autowired
   private NoticeBoardDAO noticeBoardDAO;
   @Autowired
   private QnaBoardDAO qnaBoardDAO;
   @Autowired
   private QnaDAO qnaDAO;
   @Autowired
   private AdminOrderDAO adminOrderDAO;
   
   // 회원 조회(관리자)
   @Override
   public List<ClientVO> clientList(Integer page, ClientVO client, Model model) {

      int currentPage;
      
      if( page == null || page == 0) {
         currentPage = 1;
      } else { 
         currentPage = page;
      }
      
      int totalCount = clientDAO.searchCount(client);
      
      Paging paging = new Paging(totalCount, currentPage, client);
      
      int postStart = ((paging.getCurrentPage() -1) * 20);
      /* 현재 페이지가 5라면 ((5-1)*10)+1 = 41번부터 게시글 번호가 시작됩니다.*/
      /* 게시글이 0번부터 조회되므로 +1 제거합니다.*/
      
      int postEnd = paging.getCurrentPage() * 20;
      
      client.setStartPage(paging.getStartPage());
      client.setEndPage(paging.getEndPage());
      client.setPostStart(postStart);
      client.setPostEnd(postEnd);

      model.addAttribute("paging", paging);   // 바인딩
      
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
   
   // 상품 조회(관리자)
   @Override
   public List<ProductVO> productListAdmin(Integer page, ProductVO pro, Model model) {

      int currentPage;
      
      if( page == null || page == 0) {
         currentPage = 1;
      } else { 
         currentPage = page;
      }
      int totalCount = productDAO.searchCount(pro);
      
      Paging paging = new Paging(totalCount, currentPage, pro);
      
      int postStart = ((paging.getCurrentPage() -1) * 20);
      
      int postEnd = paging.getCurrentPage() * 10;
      
      pro.setStartPage(paging.getStartPage());
      pro.setEndPage(paging.getEndPage());
      pro.setPostStart(postStart);
      pro.setPostEnd(postEnd);

      model.addAttribute("paging", paging);
      
      List<ProductVO> productList = productDAO.getProductListAdmin(pro);

      return productList;
   }

   // 상품 조회(사용자)
   @Override
   public List<ProductVO> productListClient(Integer page, ProductVO pro, Model model) {

      int currentPage;
      
      if( page == null || page == 0) {
         currentPage = 1;
      } else { 
         currentPage = page;
      }
      System.err.println("ps currentPage: " + currentPage);

      int totalCount = productDAO.searchCount(pro);
      
      Paging paging = new Paging(totalCount, currentPage, pro);

      int postStart = ((paging.getCurrentPage() -1) * 20);
      
      int postEnd = postStart + 20;
      
      pro.setStartPage(paging.getStartPage());
      pro.setEndPage(paging.getEndPage());
      pro.setPostStart(postStart);
      pro.setPostEnd(postEnd);

      model.addAttribute("paging", paging);
      
      List<ProductVO> productList = productDAO.getProductListClient(pro);

      return productList;
   }

	@Override
	public List<ImageVO> getProductMain(Integer page, ProductVO pro, Model model) {
		return productDAO.getMainList(pro);
	}
	
	@Override
	public List<NoticeBoardVO> NoticeBoardList(Integer page, NoticeBoardVO notice, Model model) {
		int currentPage;
		
		if( page == null || page == 0) {
			currentPage = 1;
		} else { 
			currentPage = page;
		}
		
		int totalCount = noticeBoardDAO.searchCount(notice);
		
		Paging paging = new Paging(totalCount, currentPage, notice);
		
		int postStart = ((paging.getCurrentPage() -1) * 20);
		/* 현재 페이지가 5라면 ((5-1)*10)+1 = 41번부터 게시글 번호가 시작됩니다.*/
		
		int postEnd = paging.getCurrentPage() * 10;
		
		notice.setStartPage(paging.getStartPage());
		notice.setEndPage(paging.getEndPage());
		notice.setPostStart(postStart);
		notice.setPostEnd(postEnd);

		model.addAttribute("paging", paging);	// 바인딩
		
		List<NoticeBoardVO> noticeBoardList = noticeBoardDAO.noticeBoardList(notice);

		return noticeBoardList;
	}

	@Override
	public List<QnaBoardVO> qnaBoardList(Integer page, QnaBoardVO qna, Model model) {
		int currentPage;
		
		if( page == null || page == 0) {
			currentPage = 1;
		} else { 
			currentPage = page;
		}
		
		int totalCount = qnaBoardDAO.searchCount(qna);
		
		Paging paging = new Paging(totalCount, currentPage, qna);
		
		int postStart = ((paging.getCurrentPage() -1) * 20);
		/* 현재 페이지가 5라면 ((5-1)*10)+1 = 41번부터 게시글 번호가 시작됩니다.*/
		
		int postEnd = paging.getCurrentPage() * 10;
		
		qna.setStartPage(paging.getStartPage());
		qna.setEndPage(paging.getEndPage());
		qna.setPostStart(postStart);
		qna.setPostEnd(postEnd);

		model.addAttribute("paging", paging);	// 바인딩
		
		List<QnaBoardVO> qnaBoardList = qnaBoardDAO.qnaBoardList(qna);

		return qnaBoardList;
	}

	@Override
	public List<QnaVO> getQnaMyPageList(Integer page, QnaVO clientQna, Model model) {
		int currentPage;
		
		if( page == null || page == 0) {
			currentPage = 1;
		} else { 
			currentPage = page;
		}
		
		int totalCount = qnaDAO.searchCount(clientQna);
		
		Paging paging = new Paging(totalCount, currentPage, clientQna);
		
		int postStart = ((paging.getCurrentPage() -1) * 20);
		/* 현재 페이지가 5라면 ((5-1)*10)+1 = 41번부터 게시글 번호가 시작됩니다.*/
		
		int postEnd = paging.getCurrentPage() * 10;
		
		clientQna.setStartPage(paging.getStartPage());
		clientQna.setEndPage(paging.getEndPage());
		clientQna.setPostStart(postStart);
		clientQna.setPostEnd(postEnd);

		model.addAttribute("paging", paging);	// 바인딩
		
		List<QnaVO> getQnaMyPageList = qnaDAO.getQnaMyPageList(clientQna);

		return getQnaMyPageList;
	}

	@Override
	public List<QnaVO> qnaList(Integer page, QnaVO clientQna, Model model) {
		int currentPage;
		
		if( page == null || page == 0) {
			currentPage = 1;
		} else { 
			currentPage = page;
		}
		
		int totalCount = qnaDAO.clientSearchCount(clientQna);
		
		Paging paging = new Paging(totalCount, currentPage, clientQna);
		
		int postStart = ((paging.getCurrentPage() -1) * 20);
		/* 현재 페이지가 5라면 ((5-1)*10)+1 = 41번부터 게시글 번호가 시작됩니다.*/
		
		int postEnd = paging.getCurrentPage() * 10;
		
		clientQna.setStartPage(paging.getStartPage());
		clientQna.setEndPage(paging.getEndPage());
		clientQna.setPostStart(postStart);
		clientQna.setPostEnd(postEnd);

		model.addAttribute("paging", paging);	// 바인딩
		
		List<QnaVO> qnaList = qnaDAO.qnaList(clientQna);

		return qnaList;
	}
	
	@Override
	public List<AdminOrderVO> getAdminOrderListAll(Integer page, AdminOrderVO adminOrderVO,Model model) throws Exception {

		int currentPage;
		if( page ==null || page ==0) {
		currentPage =1;
		} else { 
		currentPage = page;
		}
		int totalCount = adminOrderDAO.searchCount(adminOrderVO);
		System.err.println("count : " + totalCount);
		
		Paging paging =new Paging(totalCount, currentPage, adminOrderVO);
		int postStart = ((paging.getCurrentPage() -1) *20);
		/* 현재 페이지가 5라면 ((5-1)*10)+1 = 41번부터 게시글 번호가 시작됩니다.*/
		int postEnd = paging.getCurrentPage() *20;
		
		adminOrderVO.setStartPage(paging.getStartPage());
		adminOrderVO.setEndPage(paging.getEndPage());
		adminOrderVO.setPostStart(postStart);
		adminOrderVO.setPostEnd(postEnd);
		
		model.addAttribute("paging", paging); // 바인딩
		List<AdminOrderVO> adminOrderList = adminOrderDAO.getAdminOrderListAll(adminOrderVO);
		
		System.err.println("[OrderServiceImpl] : getAdminOrderListAll");
		System.err.println("---------------[ adminOrderVO ] : " + adminOrderVO.toString());
		return adminOrderList;
	}

	
	@Override
	public List<AdminOrderVO> getAdminOrderList(Integer page, AdminOrderVO adminOrderVO,Model model) throws Exception {

		int currentPage;
		if (page == null || page == 0) {
			currentPage = 1;
		} else {
			currentPage = page;
		}
		int totalCount = adminOrderDAO.searchCount(adminOrderVO);
		Paging paging = new Paging(totalCount, currentPage, adminOrderVO);
		int postStart = ((paging.getCurrentPage() - 1) * 20);
		/* 현재 페이지가 5라면 ((5-1)*10)+1 = 41번부터 게시글 번호가 시작됩니다. */
		int postEnd = paging.getCurrentPage() * 20;

		adminOrderVO.setStartPage(paging.getStartPage());
		adminOrderVO.setEndPage(paging.getEndPage());
		adminOrderVO.setPostStart(postStart);
		adminOrderVO.setPostEnd(postEnd);

		model.addAttribute("paging", paging); // 바인딩
		List<AdminOrderVO> adminOrderList = adminOrderDAO.getAdminOrderList(adminOrderVO);

		return adminOrderList;
	}
}
