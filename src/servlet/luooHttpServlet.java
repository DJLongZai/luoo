package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user;
import services.JournalServices;
import services.UserServices;

import com.alibaba.fastjson.JSON;

/**
 * Servlet implementation class luooHttpServlet
 */
@WebServlet("/luooHttpServlet")
public class luooHttpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public luooHttpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		/**
		 * 查询
		 */
		response.setContentType("application/json;charset=UTF-8");
		int page = Integer.parseInt((String)request.getParameter("page"));
		int rows = Integer.parseInt((String)request.getParameter("rows"));
		List<user> users = JournalServices.getuserALL(page, rows); 
		Map<String,Object> res = new HashMap<>();
		res.put("rows", users);
		res.put("total", JournalServices.getusercount());
		response.getWriter().print(JSON.toJSONString(res));
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		String user = request.getParameter("User");
		if(user ==""){
			response.getWriter().print("{\"success\":true}");
		}else if(UserServices.getuser(user)){
				response.getWriter().print("{\"success\":true}");
			}else{
				response.getWriter().print("{\"success\":false}");
			}
		
		
	}

}
