package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MultiDAO;
import dto.MusicVO;

public class AlbumAction implements Action {

	@Override
	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "art/album.jsp";
		String num = request.getParameter("num");
		
		MultiDAO dao = MultiDAO.getInst();
		ArrayList<MusicVO> album = dao.albumDetail(num);
		
		request.setAttribute("album", album);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
