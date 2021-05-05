package model;

import java.util.ArrayList;

public class User {

	int userId;
	String fName;
	String lName;
	String userName;
	String pass;
	ArrayList<Post> posts;
	
	public User(int userId,String fName, String lName, String userName, String pass,ArrayList<Post> posts) {
		
		this.userId = userId;
		this.fName = fName;
		this.lName = lName;
		this.userName = userName;
		this.pass = pass;
		this.posts = posts;
	}
	
	public User(String fName, String lName, String userName) {
		
		this.fName = fName;
		this.lName = lName;
		this.userName = userName;
	}
	
	public ArrayList<Post> getPosts()
	{
		return posts;
	}
	
	public void setPosts(ArrayList<Post> posts)
	{
		this.posts = posts;
	}
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Override
	public String toString() {
		return "User [userName=" + userName + "]";
	}	
	
	
	
}
