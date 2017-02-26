package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.UserServices;

/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String user = request.getParameter("regUsername");
		String name = request.getParameter("regname");
		String regpassword = request.getParameter("regPassword");
		String email = request.getParameter("regEmail");
		boolean g = UserServices.getuser(user);
		if(g&&UserServices.isEmail(email)&&user!=null || name!=null || regpassword!=null || email!=null){
			UserServices.reg(user, name, regpassword,email);
			response.getWriter().print("{\"success\":true}");
		}else{
			response.getWriter().print("{\"success\":false}");
		}
	}

}
