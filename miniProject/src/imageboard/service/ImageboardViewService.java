package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.bean.ImageboardDTO;
import imageboard.dao.ImageboardDAO;

public class ImageboardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		int seq = Integer.parseInt(request.getParameter("seq"));
		ImageboardDAO imageboardDAO=ImageboardDAO.getInstance();
		ImageboardDTO imageboard = imageboardDAO.getImageboard(seq);
		request.setAttribute("pg", pg);
		request.setAttribute("imageboard", imageboard);
	
		request.setAttribute("display", "/imageboard/imageboardView.jsp");
		return "/main/index.jsp";
	}

}
