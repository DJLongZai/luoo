package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.Comment;
import util.JDBC;
/**
 * 用户评论服务
 * @author DjLong
 *
 */

public class CommentService {
	private static SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");
	private static SimpleDateFormat formatters = new SimpleDateFormat ("HH:mm");
	/**
	 *    获取所有评论 通过期刊ID
	 */
	public static List<Comment> getCommentALLByjournalId(String id){
		try(Connection conn = JDBC.getConnection()){
			PreparedStatement stm = conn.prepareStatement("select * from comment c,user u where c.`owner_user_id` = u.id and c.`journal-id`=? ORDER BY createdTime DESC");
			stm.setString(1, id);
			ResultSet res = stm.executeQuery();
			List<Comment> comment = new ArrayList<>();
			while(res.next()){
				Comment comments = new Comment();
				comments.setContent(res.getString("content"));
				comments.setOwneruserid(res.getString("owner_user_id"));
				comments.setLikeCount(res.getString("likeCount"));
				comments.setAvatarsrc(res.getString("Avatar-src"));
				comments.setUsername(res.getString("name"));
				Date d= res.getTime("createdTime");
				Date h= res.getDate("createdTime");
				comments.setCreatedTime(formatter.format(h)+" "+formatters.format(d));
				comment.add(comments);
			}
			return comment;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 获取 评论总数 通过 期刊ID
	 * @return
	 */
	public static int getCommentcount(String id){
		int count = 0;
		try(Connection conn =JDBC.getConnection()){
			PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(id) FROM comment WHERE `journal-id`=?");
			stmt.setString(1, id);
			ResultSet res = stmt.executeQuery();
			while(res.next()){
				count = res.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	/**
	 * 添加评论
	 */
	public static boolean saveComment(String userID,String journalID,String comment){
		try(Connection conn =JDBC.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("INSERT INTO `users`.`comment` (`id`, `journal-id`, `owner_user_id`, `content`, `likeCount`) VALUES (NULL, ?, ?, ?, 0)");
			stmt.setString(1,journalID );
			stmt.setString(2, userID);
			stmt.setString(3, comment);
			return stmt.executeUpdate()==1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
