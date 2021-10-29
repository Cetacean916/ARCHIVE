package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BaseDAO;
import dto.LoginVO;

public class BoardWriteAction implements Action {

	@Override
	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="Main?command=board";
		
		String title = request.getParameter("title");
		String writer = request.getParameter("id");
		String content = request.getParameter("content");
		
		BaseDAO dao = BaseDAO.getInst();
		dao.write(title, writer, content);
		
		response.sendRedirect(url);
	}

}
