package com.tjoeun.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tjoeun.dao.MemberDAO;
import com.tjoeun.dao.ProductDAO;
import com.tjoeun.dto.MemberVO;
import com.tjoeun.dto.Paging;
import com.tjoeun.dto.ProductVO;

public class MainLoginAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "main.jsp";
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		int page=1;
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}

		MemberDAO mdao = MemberDAO.getInstance();
		MemberVO mdto = mdao.getMember(id);
		
		HttpSession session = request.getSession();

		if (mdto.getId() != null) {
			if (mdto.getPwd().equals(pwd) ) {
				session.removeAttribute("id");
				session.setAttribute("loginUser", mdto);
				session.setMaxInactiveInterval(-1);
				url = "main.jsp";
			}else {
				request.setAttribute("message", "비밀번호가 맞지 않습니다.");
				request.setAttribute("id", id);
			}
		} else {
			request.setAttribute("message", "존재하지 않는 회원입니다.");
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
