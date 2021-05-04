package model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Post {

	int userId;
	int postId;
	String content;
	String date;
	int likes;
	ArrayList<Comment> comments;
	
	public Post(int userId, int postId, String content, String date, int likes) {
		
		this.userId = userId;
		this.postId = postId;
		this.content = content;
		this.date = date;
		this.likes = likes;
	}
	
	public Post(int userId, int postId, String content) {
		
		SimpleDateFormat SDF = new SimpleDateFormat("dd-MM-yy HH:mm:ss");
		this.userId = userId;
		this.postId = postId;
		this.content = content;
		this.date = SDF.format(new Date());
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public ArrayList<Comment> getComments() {
		return comments;
	}

	public void setComments(ArrayList<Comment> comments) {
		this.comments = comments;
	}
	
}
