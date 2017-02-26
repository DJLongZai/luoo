package model;

public class Journal {
	private String id;
	private String commentCount;
	private String intro;
	private String journalCover;
	private String journalName;
	private String journalDate;
	private String journalAuthor;
	private String journalStyle;
	public String getJournalStyle() {
		return journalStyle;
	}
	public void setJournalStyle(String journalStyle) {
		this.journalStyle = journalStyle;
	}
	public String getJournalAuthor() {
		return journalAuthor;
	}
	public void setJournalAuthor(String journalAuthor) {
		this.journalAuthor = journalAuthor;
	}
	public String getJournalDate() {
		return journalDate;
	}
	public void setJournalDate(String journalDate) {
		this.journalDate = journalDate;
	}
	private String likeCount;
	public String getId() {
		return id;
	}
	public String getIdadd() {
		int i = Integer.parseInt(getId());
		int a = i+1;
		String id = String.valueOf(a);
		return id;
	}
	public String getIdsub() {
		int i = Integer.parseInt(getId());
		int a = i-1;
		String id = String.valueOf(a);
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(String commentCount) {
		this.commentCount = commentCount;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getJournalCover() {
		return journalCover;
	}
	public void setJournalCover(String journalCover) {
		this.journalCover = journalCover;
	}
	public String getJournalName() {
		return journalName;
	}
	public void setJournalName(String journalName) {
		this.journalName = journalName;
	}
	public String getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(String likeCount) {
		this.likeCount = likeCount;
	}
	
	
}
