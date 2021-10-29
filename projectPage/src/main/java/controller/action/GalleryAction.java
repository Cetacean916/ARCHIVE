package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MultiDAO;
import dto.GalleryVO;

public class GalleryAction implements Action {

	@Override
	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "art/gallery.jsp";
		int num = -1;
		
		MultiDAO dao = MultiDAO.getInst();
		ArrayList<GalleryVO> picList = dao.getPic(num);
		
		
		request.setAttribute("picList", picList);
		request.getRequestDispatcher(url).forward(request, response);
	}

}
