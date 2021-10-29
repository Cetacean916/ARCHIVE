package controller.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MultiDAO;

public class GalleryUploadAction implements Action {

	@Override
	public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "Main?command=gallery";
		
		String savepath = "C:/Users/hyeon/Desktop/JSP/workspace/projectPage/src/main/webapp/gallery";
		int sizeLimit = 100 * 1024 * 1024;
		String encType = "utf-8";
		
		try {
			MultipartRequest multi =
					new MultipartRequest(request,savepath,sizeLimit,encType,new DefaultFileRenamePolicy());
			
			String img = multi.getFilesystemName("pic");
			String type = multi.getContentType("pic");
			File file = multi.getFile("pic");
			
			String accept = ".jpg,.jpeg,.png,.gif,.jfif,.raw";
			String[] accArr = accept.split(",");
			String backup = img;
			
			for(String acc : accArr) {
				if(!backup.contains(acc)) {
					file.delete();
					img = null;
				}else {
					img = backup;
					break;
				}
			}
			
			if(img == null) {
				System.out.println("업로드 실패");
			}else {
				MultiDAO dao = MultiDAO.getInst();
				dao.uploadFile(img);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		//request.getRequestDispatcher(url).forward(request, response);
		response.sendRedirect(url);
	}

}
