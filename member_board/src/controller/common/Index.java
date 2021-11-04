package controller.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import service.BoardServiceImpl;
import vo.Criteria;

@WebServlet("/index.html")
public class Index extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		BoardService service = new BoardServiceImpl();
		Criteria cri = new Criteria(1, 8, 1);
		
		req.setAttribute("freeList", service.list(cri));
		req.getRequestDispatcher("WEB-INF/jsp/common/index.jsp").forward(req, resp);
	}
}
