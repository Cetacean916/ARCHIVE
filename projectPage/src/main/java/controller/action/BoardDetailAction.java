package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BaseDAO;
import dto.BoardVO;

public class BoardDetailAction implements Action {

	@Override
	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "board/detail.jsp";
		String num = request.getParameter("num");
		
		BaseDAO dao = BaseDAO.getInst();
		BoardVO detail = dao.boardDetail(num);
		
		request.setAttribute("detail", detail);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
