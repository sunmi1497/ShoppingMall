package com.tjoeun.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjoeun.controller.action.Action;

public class AdminProductWriteFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "admin/product/productWrite.jsp";
		
	    String kindList[] = { "디자인", "번역/외국어", "문서작성", "음악/영상", "프로그램개발", "마케팅/비즈니스", "생활서비스" };    
	    request.setAttribute("kindList", kindList);
	    
	    request.getRequestDispatcher(url).forward(request, response);
	}
}
