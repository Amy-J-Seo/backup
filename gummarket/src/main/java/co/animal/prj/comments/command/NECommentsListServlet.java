package co.animal.prj.comments.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.animal.prj.comments.service.CommentsService;
import co.animal.prj.comments.serviceImpl.CommentsServiceImpl;
import co.animal.prj.comments.vo.CommentsVO;

@WebServlet("/NECommentsListServlet")
public class NECommentsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NECommentsListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json;charset=utf-8");

		request.setCharacterEncoding("utf-8");

		CommentsService comDao = new CommentsServiceImpl();
		CommentsVO vo = new CommentsVO();
		String selectedMainNum = request.getParameter("bNo");
		int cMainNum = Integer.valueOf(selectedMainNum);
		String category = request.getParameter("category");
		vo.setcMainNum(cMainNum);
		vo.setcType(category);
		
		List<CommentsVO> list = new ArrayList<CommentsVO>();
		list = comDao.eCommentsSelectList(vo);
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(list));
		
		
	}

}
