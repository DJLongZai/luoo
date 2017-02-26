package model;

public class Comment {
	private String content;
	private String createdTime;
	private String id;
	private String juournalid;
	private String likeCount;
	private String owneruserid;
	private String Avatarsrc;
	private String username;
	public String getAvatarsrc() {
		return Avatarsrc;
	}
	public void setAvatarsrc(String avatarsrc) {
		Avatarsrc = avatarsrc;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJuournalid() {
		return juournalid;
	}
	public void setJuournalid(String juournalid) {
		this.juournalid = juournalid;
	}
	public String getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(String likeCount) {
		this.likeCount = likeCount;
	}
	public String getOwneruserid() {
		return owneruserid;
	}
	public void setOwneruserid(String owneruserid) {
		this.owneruserid = owneruserid;
	}


}
