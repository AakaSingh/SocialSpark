package model;

public class Comment {

	int userId;
	String content;
	
	public Comment(int userId, String content) {
		this.userId = userId;
		this.content = content;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
