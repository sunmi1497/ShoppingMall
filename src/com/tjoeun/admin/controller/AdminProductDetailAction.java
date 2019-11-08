package com.tjoeun.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjoeun.controller.action.Action;
import com.tjoeun.dao.ProductDAO;
import com.tjoeun.dto.ProductVO;

public class AdminProductDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "admin/product/productDetail.jsp";
		
		String pseq = request.getParameter("pseq").trim();
		
		ProductDAO pDao = ProductDAO.getInstance();
		ProductVO pVo = pDao.getProduct(pseq); //* 상품번호로 상품 골라오기
		
		request.setAttribute("productVO", pVo);
		
		int index = Integer.parseInt(pVo.getKind().trim());
		String kindList[] = { "0", "디자인", "번역/외국어", "문서작성", "음악/영상", "프로그램개발", "마케팅/비즈니스", "생활서비스" }; //* 0번은 안씀
		
		request.setAttribute("kind", kindList[index]);	//* th에 들어갈 '상품분류' 용
		
		// 상품 리스트(product_list.jsp) 페이지에서 쿼리 스트링으로 넘겨준 현재 페이지를 얻어온다.
		String tpage = "1";
		if (request.getParameter("tpage") != null) {
			tpage = request.getParameter("tpage");
		}
		request.setAttribute("tpage", tpage);
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
