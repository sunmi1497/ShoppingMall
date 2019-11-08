package com.tjoeun.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tjoeun.controller.action.Action;
import com.tjoeun.dao.MemberDAO;
import com.tjoeun.dto.MemberVO;
import com.tjoeun.dto.Paging;

public class AdminMemberListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String url = "admin/member/memberList.jsp";
		
		int page=1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}	//* request로 전해진 page가 있다면 1대신 page를 넣음
		System.out.println(page);
		Paging paging = new Paging(); //* (아직 paging() 실행 안됨); 생성자 아님 private >void< >p< 소문자
		paging.setPage(page);	//* 현재 페이지로 set
		
		MemberDAO mDao = MemberDAO.getInstance();
		
		String key = "";
		if (request.getParameter("key") != null) {
			key = request.getParameter("key");
		}
		
		int count = mDao.getAllCount(key);
		paging.setTotalCount(count);	//* 이때 paging()이 실행됨
		
		ArrayList<MemberVO> memberList = mDao.listMember(key, paging);
		
		request.setAttribute("memberList", memberList);
		request.setAttribute("paging", paging);
		request.setAttribute("keyM", key);

		request.getRequestDispatcher(url).forward(request, response);
	}

}
