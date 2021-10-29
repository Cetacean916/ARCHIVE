package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BaseDAO;

public class JoinAction implements Action {

	@Override
	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "Main?command=loginForm";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		BaseDAO dao = BaseDAO.getInst();
		dao.joinUs(id, pw, name);
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
