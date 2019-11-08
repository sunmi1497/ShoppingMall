package com.tjoeun.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tjoeun.controller.action.Action;
import com.tjoeun.dao.MemberDAO;
import com.tjoeun.dto.MemberVO;

public class AdminLoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "TalentServlet?command=admin_login_form";
		String msg = "";
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberVO mVo = mDao.getMember(id);
		
		if (mVo != null) {
			if (mVo.getPwd().equals(pwd)) {
				if (mVo.getAdmin_yn().equals("y")) {
					HttpSession session = request.getSession();
					session.setAttribute("loginUser", mVo);
					session.setMaxInactiveInterval(-1);
					
					url = "TalentServlet?command=admin_product_list";
				} else {
					request.setAttribute("message", "관리자 계정이 아닙니다.");
				}
			} else {
				request.setAttribute("message", "비밀번호가 맞지 않습니다.");
				request.setAttribute("id", id);
			}
		} else {
			request.setAttribute("message", "존재하지 않는 회원입니다.");
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
