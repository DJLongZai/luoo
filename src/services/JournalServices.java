package services;


import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Part;

import model.Journal;
import model.Song;
import model.user;
import util.JDBC;
	/**
	 * 期刊于音乐操作
	 * @author DjLong
	 *
	 */
public class JournalServices {
	private static SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd"); 
	/**
	 *    遍历id=?的期刊
	 * @author DjLong
	 *
	 */
	public static Journal getJournalById(String id){
		try(Connection conn =JDBC.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("select * from journal where id=?");
			stmt.setString(1, id);
			ResultSet res = stmt.executeQuery();
			if(res.next()){
				Journal j = new Journal();
				j.setId(res.getString("id"));
				j.setCommentCount(res.getString("comment-count"));
				j.setIntro(res.getString("intro"));
				j.setJournalCover(res.getString("journal-cover"));
				j.setJournalName(res.getString("journal-name"));
				j.setLikeCount(res.getString("likeCount"));
				j.setJournalAuthor(res.getString("journal-author"));
				j.setJournalStyle(res.getString("journal-style"));
				Date d= res.getDate("journal-Date");
				j.setJournalDate(formatter.format(d));
				return j;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	/**
	 * 获取期刊 通过 风格
	 */
	public static List<Journal> getJournalByStyle(String Styele,int p){
		int starundex = (p-1)*7;
		try(Connection conn =JDBC.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("select * from journal WHERE `journal-style` = ? ORDER BY id DESC LIMIT ?,7;");
			stmt.setString(1, Styele);
			stmt.setInt(2, starundex);
			ResultSet res = stmt.executeQuery();
			List<Journal> journals = new ArrayList<>();
			while(res.next()){
				Journal j = new Journal();
				j.setId(res.getString("id"));
				j.setCommentCount(res.getString("comment-count"));
				j.setIntro(res.getString("intro"));
				j.setJournalCover(res.getString("journal-cover"));
				j.setJournalName(res.getString("journal-name"));
				j.setLikeCount(res.getString("likeCount"));
				j.setJournalAuthor(res.getString("journal-author"));
				j.setJournalStyle(res.getString("journal-style"));
				Date d= res.getDate("journal-Date");
				j.setJournalDate(formatter.format(d));
				journals.add(j);
			}
			return journals;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 获取期刊总数 通过 风格
	 */
	public static int getJournalcountByStyle(String Styele){
		int count = 0;
		try(Connection conn =JDBC.getConnection()){
			PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(`journal-style`) AS users FROM journal WHERE `journal-style`=?;");
			stmt.setString(1, Styele);
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
	 *      遍历journal-id=?的song
	 * @param journalId
	 * @return
	 */
	public static List<Song> getSongsByJouralId(String journalId){
		try(Connection conn =JDBC.getConnection()){
			PreparedStatement stmt = conn.prepareStatement("select * from music where `journal-id`=?");
			stmt.setString(1,journalId);
			ResultSet res = stmt.executeQuery();
			List<Song> songs = new ArrayList<>();
			while(res.next()){
				Song song = new Song();
				song.setCoverSrc(res.getString("cover-src"));
				song.setId(res.getString("id"));
				song.setJournalId(res.getString("journal-id"));
				song.setMusicSrc(res.getString("Music-src"));
				song.setSinger(res.getString("Singer"));
				song.setSong(res.getString("Song"));
				song.setLikeCnunt(res.getString("like-cnunt"));
				songs.add(song);
			}
			return songs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	/**
	 *                 获取期刊总和
	 * @return
	 */
	public static int getJournalcount(){
		int count = 0;
		try(Connection conn =JDBC.getConnection()){
			PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(id) FROM journal");
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
	 *               获取music总和
	 * @return
	 */
	public static int getmusiccount(){
		int count = 0;
		try(Connection conn =JDBC.getConnection()){
			PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(id) FROM music");
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
	 *          获取所有音乐  并分页
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public static List<Song> getSongsALL(int page,int pageSize){
		int starundex = (page-1)*pageSize;
		try(Connection conn =JDBC.getConnection()){
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM music ORDER BY id DESC LIMIT ?,?");
			stmt.setInt(1, starundex);
			stmt.setInt(2, pageSize);
			ResultSet res = stmt.executeQuery();
			List<Song> songs = new ArrayList<>();
			while(res.next()){
				Song song = new Song();
				song.setCoverSrc(res.getString("cover-src"));
				song.setId(res.getString("id"));
				song.setJournalId(res.getString("journal-id"));
				song.setMusicSrc(res.getString("Music-src"));
				song.setSinger(res.getString("Singer"));
				song.setMusicStyle(res.getString("music-style"));
				song.setSong(res.getString("Song"));
				song.setLikeCnunt(res.getString("like-cnunt"));
				songs.add(song);
			}
			return songs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	/**
	 * 						获取所有期刊  并分页
	 * @param page
	 * @param rows
	 * @return
	 */
	public static List<Journal> getJournalALL(int page,int rows){
		int starindex = (page-1)*rows;
		try(Connection conn =JDBC.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM journal ORDER BY id DESC LIMIT ?,?");
			stmt.setInt(1, starindex);
			stmt.setInt(2, rows);
			ResultSet res = stmt.executeQuery();
			List<Journal> Journal = new ArrayList<>();
			while(res.next()){
				Journal j = new Journal();
				j.setId(res.getString("id"));
				j.setCommentCount(res.getString("comment-count"));
				j.setIntro(res.getString("intro"));
				j.setJournalCover(res.getString("journal-cover"));
				j.setJournalName(res.getString("journal-name"));
				j.setLikeCount(res.getString("likeCount"));
				j.setJournalAuthor(res.getString("journal-author"));
				j.setJournalStyle(res.getString("journal-style"));
				Date d= res.getDate("journal-Date");
				j.setJournalDate(formatter.format(d));
				Journal.add(j);
			}
			return Journal;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	/**
	 * 					创建期刊
	 * @param journalName
	 * @param intro
	 * @param journalStyle
	 * @param journalAuthor
	 * @param journalCover
	 * @return
	 */
	public static boolean saveJournal(String journalName,String intro,String journalStyle,String journalAuthor,String journalCover){
		try(Connection conn =JDBC.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("INSERT INTO `users`.`journal` (`id`, `journal-name`, `journal-cover`, `journal-author`, `journal-style`,`intro`, `comment-count`, `likeCount`) VALUES (NULL, ?, ?, ?, ?, ?,0, 0)");
			stmt.setString(1,journalName );
			stmt.setString(2, journalCover);
			stmt.setString(3, journalAuthor);
			stmt.setString(4,journalStyle);
			stmt.setString(5,intro );
			return stmt.executeUpdate()==1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * 					编辑期刊
	 * @param id
	 * @param journalName
	 * @param intro
	 * @param journalStyle
	 * @param journalAuthor
	 * @param journalCover
	 * @return
	 */
	public static boolean updateJournal(String id,String journalName,String intro,String journalStyle,String journalAuthor,String journalCover){
		try(Connection conn =JDBC.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("update journal set `journal-name`=?,`journal-cover`=?,`journal-author`=? ,`journal-style`=?,`intro`=? where `id`=? ");
			stmt.setString(1,journalName );
			stmt.setString(2, journalCover);
			stmt.setString(3, journalAuthor);
			stmt.setString(4,journalStyle);
			stmt.setString(5,intro );
			stmt.setString(6,id );
			return stmt.executeUpdate()==1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 *    删除期刊BYid
	 *    
	 */
	public static boolean DeleteJournal(String id){
		try(Connection conn =JDBC.getConnection()){
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM journal WHERE id = ? ");
			stmt.setString(1, id);
			return stmt.executeUpdate()==1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * 期刊下一页
	 */
	public static int getIdadd(String id){
		int  journalid= 0;
		try(Connection conn =JDBC.getConnection()){
			PreparedStatement stmt = conn.prepareStatement("select id from journal j1 where j1.id > (SELECT j2.id from journal j2 where id = ?) limit 1");
			stmt.setString(1, id);
			ResultSet res = stmt.executeQuery();
			if(res.next()){
				journalid = res.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return journalid;
	}
	/**
	 * 期刊上一页
	 */
	public static int getIdsub(String id){
		int  journalid= 0;
		try(Connection conn =JDBC.getConnection()){
			PreparedStatement stmt = conn.prepareStatement("select id from journal j1 where j1.id < (SELECT j2.id from journal j2 where id = ?) ORDER BY j1.id DESC  limit 1");
			stmt.setString(1, id);
			ResultSet res = stmt.executeQuery();
			if(res.next()){
				journalid = res.getInt(1);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return journalid;
	}
	/**
	 *   添加音乐
	 */
	public static boolean saveMusic(String journalId,String Song,String Singer,String MusicSrc,String coverSrc,String musicStyle){
		try(Connection conn =JDBC.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("INSERT INTO `users`.`music` (`id`, `journal-id`, `Song`, `Singer`, `music-style`,`Music-src`, `cover-src`, `like-cnunt`) VALUES (NULL, ?, ?, ?, ?, ?,?, 0)");
			stmt.setString(1,journalId );
			stmt.setString(2, Song);
			stmt.setString(3, Singer);
			stmt.setString(4,musicStyle);
			stmt.setString(5,MusicSrc );
			stmt.setString(6,coverSrc );
			return stmt.executeUpdate()==1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 *    编辑音乐
	 */
	public static boolean updateMusic(String id,String journalId,String Song,String Singer,String MusicSrc,String coverSrc,String musicStyle){
		try(Connection conn =JDBC.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("update music set `journal-id`=?,`Song`=?,`Singer`=? ,`music-style`=?,`Music-src`=?,`cover-src`=?,`like-cnunt`=0 where `id`=? ");
			stmt.setString(1,journalId );
			stmt.setString(2, Song);
			stmt.setString(3, Singer);
			stmt.setString(4,musicStyle);
			stmt.setString(5,MusicSrc );
			stmt.setString(6,coverSrc );
			stmt.setString(7,id );
			return stmt.executeUpdate()==1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * 删除音乐
	 */
	public static boolean DeleteMusic(String id){
		try(Connection conn =JDBC.getConnection()){
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM music WHERE id = ? ");
			stmt.setString(1, id);
			return stmt.executeUpdate()==1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 *   文件上传
	 */
	public static boolean upFile(Part file,String rootPath,String subPath){
		Path jPath = Paths.get(rootPath, subPath);
		try(InputStream is = file.getInputStream()){
			Files.copy(is, jPath);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	/**
	 * 期刊：按点赞数量排序
	 */
	public static List<Journal> getJournalBylikecount(){
		try(Connection conn =JDBC.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM journal ORDER BY likeCount DESC LIMIT 0,7");
			ResultSet res = stmt.executeQuery();
			List<Journal> Journal = new ArrayList<>();
			while(res.next()){
				Journal j = new Journal();
				j.setId(res.getString("id"));
				j.setCommentCount(res.getString("comment-count"));
				j.setIntro(res.getString("intro"));
				j.setJournalCover(res.getString("journal-cover"));
				j.setJournalName(res.getString("journal-name"));
				j.setLikeCount(res.getString("likeCount"));
				j.setJournalAuthor(res.getString("journal-author"));
				j.setJournalStyle(res.getString("journal-style"));
				Date d= res.getDate("journal-Date");
				j.setJournalDate(formatter.format(d));
				Journal.add(j);
			}
			return Journal;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	/**
	 * 音乐：按点赞数排序
	 */
	public static List<Song> getSongsBylikecount(){
		try(Connection conn =JDBC.getConnection()){
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM music ORDER BY `like-cnunt` DESC LIMIT 0,7");
			ResultSet res = stmt.executeQuery();
			List<Song> songs = new ArrayList<>();
			while(res.next()){
				Song song = new Song();
				song.setCoverSrc(res.getString("cover-src"));
				song.setId(res.getString("id"));
				song.setJournalId(res.getString("journal-id"));
				song.setMusicSrc(res.getString("Music-src"));
				song.setSinger(res.getString("Singer"));
				song.setMusicStyle(res.getString("music-style"));
				song.setSong(res.getString("Song"));
				song.setLikeCnunt(res.getString("like-cnunt"));
				songs.add(song);
			}
			return songs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	/**
	 * 搜索期刊
	 */
	public static List<Journal> getSearchJournal(String Search){
		String Searchtext = "%"+Search+"%";
		try(Connection conn =JDBC.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM journal WHERE `journal-name` LIKE ?");
			stmt.setString(1, Searchtext);
			ResultSet res = stmt.executeQuery();
			List<Journal> Journal = new ArrayList<>();
			while(res.next()){
				Journal j = new Journal();
				j.setId(res.getString("id"));
				j.setIntro(res.getString("intro"));
				j.setJournalCover(res.getString("journal-cover"));
				j.setLikeCount(res.getString("likeCount"));
				j.setJournalName(res.getString("journal-name"));
				Journal.add(j);
			}
			return Journal;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	/**
	 * 获取账号密码
	 */
	public static List<user> getuserALL(int page,int rows){
		int starindex = (page-1)*rows;
		try(Connection conn =JDBC.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM user ORDER BY id DESC LIMIT ?,?");
			stmt.setInt(1, starindex);
			stmt.setInt(2, rows);
			ResultSet res = stmt.executeQuery();
			List<user> user = new ArrayList<>();
			while(res.next()){
				user users = new user();
				users.setId(res.getString("id"));
				users.setName(res.getString("name"));
				users.setUsername(res.getString("username"));
				users.setPassword(res.getString("password"));
				users.setEmail(res.getString("e-mail"));
				users.setAvatarsrc(res.getString("Avatar-src"));
				user.add(users);
			}
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	/**
	 *  账号总数
	 */
	public static int getusercount(){
		int count = 0;
		try(Connection conn =JDBC.getConnection()){
			PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(id) FROM user");
			ResultSet res = stmt.executeQuery();
			while(res.next()){
				count = res.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
