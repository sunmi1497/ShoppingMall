package com.tjoeun.admin.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tjoeun.controller.action.Action;
import com.tjoeun.dao.ProductDAO;
import com.tjoeun.dto.ProductVO;

public class AdminProductUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "TalentServlet?command=admin_product_list";
		
		HttpSession session = request.getSession();
		
		int sizeLimit = 5 * 1024 * 1024;	//* 5MB 제한
		String savePath = "product_images";	//* 폴더 연결들
		ServletContext context = session.getServletContext();	//* 세션 사용
		String uploadFilePath = context.getRealPath(savePath);
		
		MultipartRequest multi = new MultipartRequest(request, // 1. 요청 객체
				uploadFilePath, // 2. 업로드될 파일이 저장될 파일 경로명
				sizeLimit, // 3. 업로드될 파일의 최대 크기(5Mb)
				"UTF-8", // 4. 인코딩 타입 지정
				new DefaultFileRenamePolicy() // 5. 덮어쓰기를 방지 위한 부분
		); // 이 시점을 기해 파일은 이미 저장이 되었다
		
		ProductVO pVo = new ProductVO();
		pVo.setPseq(Integer.parseInt(multi.getParameter("pseq")));	//* request가 multi에 전해져있음
		pVo.setKind(multi.getParameter("kind"));
		pVo.setUseyn(multi.getParameter("useyn"));
		pVo.setPtitle(multi.getParameter("ptitle"));
		pVo.setArea(multi.getParameter("area"));
		pVo.setPrice(Integer.parseInt(multi.getParameter("price")));
		pVo.setPeriod(Integer.parseInt(multi.getParameter("period")));
		pVo.setPhone(multi.getParameter("phone"));
		pVo.setContent(multi.getParameter("content"));
		
		if (multi.getFilesystemName("image") == null) {
			pVo.setImage(multi.getParameter("nonmakeImg"));
		} else {
			pVo.setImage(multi.getFilesystemName("image"));
		}
		
		pVo.setBestyn(multi.getParameter("bestyn"));
		
		ProductDAO pDao = ProductDAO.getInstance();
		pDao.updateProduct(pVo);
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}
