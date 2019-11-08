package com.tjoeun.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjoeun.dao.ProductDAO;
import com.tjoeun.dto.Paging;
import com.tjoeun.dto.ProductVO;

public class MainLoginFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "main.jsp";

		
		int page=1;
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		Paging paging=new Paging();
		paging.setPage(page);
		ProductDAO pdao=ProductDAO.getInstance();
		
		int count=pdao.getAllCount();
		paging.setTotalCount(count);
		
		ArrayList<ProductVO> productList=pdao.listProduct(paging); 

		request.setAttribute("productList", productList);
		request.setAttribute("paging", paging);

		request.getRequestDispatcher(url).forward(request, response);
		
	}
	

}
