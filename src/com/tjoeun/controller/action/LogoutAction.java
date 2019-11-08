package com.tjoeun.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "TalentServlet?command=main_login_form";
		
		HttpSession session = request.getSession(false);
		//* getSession(false) 이미 세션이 있다면 그 세션을 돌려주고, 세션이 없으면 null을 돌려준다.
		if (session != null) {
			session.invalidate();
			request.setAttribute("message", "");		//* message request에 담긴 것이 있다면 비움
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
