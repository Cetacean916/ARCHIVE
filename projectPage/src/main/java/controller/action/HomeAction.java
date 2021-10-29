package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BaseDAO;
import dao.MultiDAO;
import dto.BoardVO;
import dto.MusicVO;

public class HomeAction implements Action {

	@Override
	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "home.jsp";
		
		BaseDAO base = BaseDAO.getInst();
		MultiDAO multi = MultiDAO.getInst();
		
		ArrayList<BoardVO> board = base.boardList();
		ArrayList<MusicVO> album = multi.album();
		
		request.setAttribute("board", board);
		request.setAttribute("album", album);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
