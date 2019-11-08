package com.tjoeun.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjoeun.controller.action.Action;
import com.tjoeun.dao.ProductDAO;
import com.tjoeun.dto.Paging;
import com.tjoeun.dto.ProductVO;

public class AdminProductListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String url = "admin/product/productList.jsp";
		int page=1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		Paging paging = new Paging();
		paging.setPage(page);
		
		ProductDAO pDao = ProductDAO.getInstance();
		
		String key = "";
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
		}
		
		int count = pDao.getKeyCount(key);
		paging.setTotalCount(count);
		
		ArrayList<ProductVO> productList = pDao.listAllProduct(paging, key);
		
		request.setAttribute("productList", productList);
		request.setAttribute("paging", paging);
		request.setAttribute("keyP", key);
		
		request.setAttribute("tpage", paging.getPage());
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}
