package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.user;
import services.UserServices;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mes = request.getParameter("mes");
		if(mes!=null){
			request.getSession().invalidate();
			response.getWriter().print("{\"success\":true}");	
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");
		boolean b = UserServices.login(username, password);
		if(b){
			HttpSession session = request.getSession(true);
			user user = UserServices.getuserByName(username);
			session.setAttribute("user", user);
			response.getWriter().print("{\"success\":true}");
		}else{
			response.getWriter().print("{\"success\":false}");
		}
	}

}
