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

import model.Song;
import services.JournalServices;

import com.alibaba.fastjson.JSON;

/**
 * Servlet implementation class musicServlet
 */
@WebServlet(value="/musicServlet",name="musicServlet")
@MultipartConfig
public class musicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public musicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		int page = Integer.parseInt((String)request.getParameter("page"));
		int rows = Integer.parseInt((String)request.getParameter("rows"));
		List<Song> songs = JournalServices.getSongsALL(page, rows);
		Map<String,Object> res = new HashMap<>();
		res.put("rows", songs);
		res.put("total", JournalServices.getmusiccount());
		response.getWriter().print(JSON.toJSONString(res));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String journalId = request.getParameter("journalId");
		String Song = request.getParameter("Song");
		String Singer = request.getParameter("Singer");
		String musicStyle = request.getParameter("musicStyle");
		Part MusicSrc = request.getPart("MusicSrc");
		Part coverSrc = request.getPart("coverSrc");
		if(MusicSrc!=null || coverSrc!=null){
			String rootPath = request.getSession().getServletContext().getRealPath("/");
			String MuscontentDisposition = MusicSrc.getHeader("content-disposition");
			String CovcontentDisposition = coverSrc.getHeader("content-disposition");
			String MusfileSuffix = MuscontentDisposition.substring(MuscontentDisposition.lastIndexOf("."),MuscontentDisposition.length()-1);
			String CovfileSuffix = CovcontentDisposition.substring(CovcontentDisposition.lastIndexOf("."),CovcontentDisposition.length()-1);
			String MusubPath = "Music/"+UUID.randomUUID().toString()+MusfileSuffix;
			String CovsubPath = "coversrc/"+UUID.randomUUID().toString()+CovfileSuffix;
			JournalServices.upFile(MusicSrc, rootPath, MusubPath);
			JournalServices.upFile(coverSrc, rootPath, CovsubPath);
			if(id == null || "".equals(id)){
				JournalServices.saveMusic(journalId, Song, Singer, MusubPath, CovsubPath, musicStyle);
			}else{
				JournalServices.updateMusic(id, journalId, Song, Singer, MusubPath, CovsubPath, musicStyle);
			}
		 }else if(id == null || "".equals(id)){
				JournalServices.updateMusic(id, journalId, Song, Singer, null, null, musicStyle);
			}else{
				JournalServices.saveMusic(journalId, Song, Singer, null, null, musicStyle);
			}
		
	}
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		Map<String,Object> res = new HashMap<>();
		res.put("success", JournalServices.DeleteJournal(id));
		resp.getWriter().print(JSON.toJSONString(res));
	}

}
