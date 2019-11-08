package com.tjoeun.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjoeun.dao.ProductDAO;
import com.tjoeun.dto.ProductVO;

public class ProductDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="product/productdetail.jsp";
		String pseq = request.getParameter("pseq");
		ProductVO pvo = new ProductVO();
		ProductDAO pdao = ProductDAO.getInstance();

		pvo = pdao.getProduct(pseq);

		request.setAttribute("ProductVO", pvo);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
