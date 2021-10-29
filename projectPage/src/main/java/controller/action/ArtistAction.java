package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MultiDAO;
import dto.ArtistVO;

public class ArtistAction implements Action {

	@Override
	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "art/artist.jsp";
		
		MultiDAO dao = MultiDAO.getInst();
		ArrayList<ArtistVO> history = dao.History();
		ArrayList<ArtistVO> award = dao.award();
		
		request.setAttribute("history", history);
		request.setAttribute("award", award);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
