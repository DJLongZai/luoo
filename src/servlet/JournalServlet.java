package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Journal;
import services.JournalServices;

import com.alibaba.fastjson.JSON;
/**
 * Servlet implementation class JournalServlet
 */
@WebServlet(value="/JournalServlet",name="JournalServlet")
@MultipartConfig
public class JournalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final int PAGE_SIZE = 12;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JournalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 获取期刊列表
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		int page = Integer.parseInt((String)request.getParameter("page"));
		int rows = Integer.parseInt((String)request.getParameter("rows"));
		List<Journal> journals = JournalServices.getJournalALL(page,rows);
		Map<String,Object> res = new HashMap<>();
		res.put("rows", journals);
		res.put("total", JournalServices.getJournalcount());
		response.getWriter().print(JSON.toJSONString(res));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * 
	 * 创建于编辑
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String journalName = request.getParameter("journalName");
		String intro = request.getParameter("intro");
		String journalStyle = request.getParameter("journalStyle");
		String journalAuthor = request.getParameter("journalAuthor");
		Part journalCover = request.getPart("journalCover");
		if(journalCover != null){
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			String contentDisposition = journalCover.getHeader("content-disposition");
			String fileSuffix = contentDisposition.substring(contentDisposition.lastIndexOf("."),contentDisposition.length()-1);
			String subPath = "journalcover/"+UUID.randomUUID().toString()+fileSuffix;
			JournalServices.upFile(journalCover, rootPath, subPath);
			if(id == null || "".equals(id)){
				JournalServices.saveJournal(journalName, intro, journalStyle, journalAuthor, subPath);
			}else{
				JournalServices.updateJournal(id,journalName, intro, journalStyle, journalAuthor, subPath);
			}
		}else if(id == null || "".equals(id)){
			JournalServices.updateJournal(id,journalName, intro, journalStyle, journalAuthor, null);
		}else{
			JournalServices.saveJournal(journalName, intro, journalStyle, journalAuthor,null);
		}
		
	}

	
	
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {
		String id = arg0.getParameter("fucker");
		
		super.service(arg0, arg1);
	}

	@Override
	/**
	 * 删除期刊
	 */
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		Map<String,Object> res = new HashMap<>();
		res.put("success", JournalServices.DeleteJournal(id));
		resp.getWriter().print(JSON.toJSONString(res));
	}
	

}
