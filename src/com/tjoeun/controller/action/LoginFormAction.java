package com.tjoeun.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tjoeun.dao.MemberDAO;
import com.tjoeun.dao.ProductDAO;
import com.tjoeun.dto.MemberVO;
import com.tjoeun.dto.Paging;
import com.tjoeun.dto.ProductVO;

public class LoginFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/login.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
