package model;

public class user {
	private String id;
	private String name;
	private String username;
	private String password;
	private String Avatarsrc;
	private String Email;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAvatarsrc() {
		return Avatarsrc;
	}
	public void setAvatarsrc(String avatarsrc) {
		Avatarsrc = avatarsrc;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
}