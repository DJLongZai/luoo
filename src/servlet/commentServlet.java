package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.user;
import services.CommentService;

import com.alibaba.fastjson.JSON;

/**
 * Servlet implementation class commentServlet
 * @param <Comment>
 */
@WebServlet("/commentServlet")
public class commentServlet<Comment> extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public commentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String journalid =  request.getParameter("id");
		response.setContentType("application/json;charset=UTF-8");
		CommentService.getCommentALLByjournalId(journalid);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		user user =  (user) request.getSession().getAttribute("user");
		if(user!=null){
			
			String userID = user.getId();	
			String journalID =  request.getParameter("jounalId");
			String comment =  request.getParameter("Releasecontent");
			CommentService.saveComment(userID, journalID, comment);
			HttpSession session = request.getSession(true);
			user u = (model.user) session.getAttribute("user");
			Map<String,Object> res = new HashMap<>();
			res.put("success", true);
			res.put("user", u);
			response.getWriter().print(JSON.toJSON(res));
		}else{
			response.getWriter().print("{\"success\":false}");
		}
	}

}
