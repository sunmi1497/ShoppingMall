package com.tjoeun.controller.action;

import java.io.IOException; 

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tjoeun.dao.MemberDAO;
import com.tjoeun.dto.MemberVO;

public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/login.jsp";
		
		HttpSession session = request.getSession();
		
		MemberVO mVo = new MemberVO();
		
		mVo.setId(request.getParameter("id"));
		mVo.setPwd(request.getParameter("pwd"));
		mVo.setName(request.getParameter("name"));
		mVo.setEmail(request.getParameter("email"));
		mVo.setAddress(request.getParameter("address"));
		mVo.setPhone(request.getParameter("phone"));
		
		session.setAttribute("id", request.getParameter("id"));
		
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.insertMember(mVo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
