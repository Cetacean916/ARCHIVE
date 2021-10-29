package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BaseDAO;
import dto.BoardVO;

public class BoardAction implements Action {

	@Override
	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "board/board.jsp";
		
		BaseDAO dao = BaseDAO.getInst();
		ArrayList<BoardVO> list = dao.boardList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
