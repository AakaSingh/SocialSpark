package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import model.Message;
import model.Post;
import model.User;

public class UserDbUtil {
	DataSource ds;
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public UserDbUtil(DataSource ds)
	{
		this.ds = ds;
	}

	public User searchUsername(String uName) throws Exception
	{
		User tempUser = null;
		ArrayList<Post> posts = new ArrayList<>();
		
		try
		{
			conn = this.ds.getConnection();
			
			String sql = "Select * from user where uname = '"+ uName +"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
			{
				
				PostDbUtil postdb = new PostDbUtil(ds);
				posts = postdb.getPostsByUsername(uName);
				tempUser = new User(rs.getInt("user_id"),rs.getString("fname"),rs.getString("lname"),rs.getString("uname"),rs.getString("pass"),posts);			
			}
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}		
		return tempUser;	
	}
	
	
	public ArrayList<String> getFriends(User user) throws Exception
	{
		ArrayList<String> friends = new ArrayList<>();
		
		try
		{
			conn = this.ds.getConnection();
			
			String sql = "select u.uname from friends f join user u on f.userid_two = u.user_id where f.userid_one ="+user.getUserId()+" and f.type = 1";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				friends.add(rs.getString("uname"));
			}
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}		
		
		return friends;
	}
	
	public boolean registerUser(User tempUser) throws Exception
	{
		if(searchUsername(tempUser.getUserName())!=null)
		{
			return false;
		}
		
		try
		{
			conn = this.ds.getConnection();
			
			stmt = conn.createStatement();
			String sql = "insert into user(fname,lname,uname,pass) values('"+ tempUser.getfName()+"','"+ tempUser.getlName()+"','"+ tempUser.getUserName()+"','"+ tempUser.getPass()+"')";
			stmt.executeUpdate(sql);
			return true;
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}
	}
	
	public ArrayList<Message> getMessages(User sender,User reciever) throws Exception
	{
		ArrayList<Message> messages = new ArrayList<>();
		
		try
		{
			conn = this.ds.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from messages where (sender_id = "+ sender.getUserId()+" and reciever_id = "+ reciever.getUserId()+") or (sender_id = "+reciever.getUserId()+" and reciever_id = "+sender.getUserId()+")";
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				messages.add(new Message(rs.getInt("sender_id"),rs.getString("msg_content"),rs.getString("time").toString()));
			}
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}
		
		return messages;
	}
	
	public void addMessage(int senderId, int recieverId, String msg_content) throws Exception
	{
		try
		{
			conn = this.ds.getConnection();
			stmt = conn.createStatement();
			String sql = "insert into messages values("+senderId+","+recieverId+",'"+msg_content+"',current_time)";
			stmt.executeUpdate(sql);
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}
	}
	
	public void notifSeen(int user) throws Exception
	{
		try
		{
			conn = this.ds.getConnection();
			stmt = conn.createStatement();
			String sql = "delete from notifications where reciever_id = "+ user + " and type = 1";
			stmt.executeUpdate(sql);
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}
	}
	
	public void acceptRequest(int notifId,int userOne, int userTwo) throws Exception
	{
		try
		{
			conn = this.ds.getConnection();
			stmt = conn.createStatement();
			String sql = "delete from notifications where notif_id = "+ notifId;
			stmt.executeUpdate(sql);
			sql = "insert into friends values("+userOne+","+userTwo+",1)";
			sql = "insert into friends values("+userTwo+","+userOne+",1)";
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}
	}
	
	public void removeFriend(User sender, User reciever) throws Exception
	{
		try
		{
			conn = this.ds.getConnection();
			stmt = conn.createStatement();
			String sql = "delete from friends where userid_one = "+sender.getUserId()+" and userid_two = "+ reciever.getUserId();
			stmt.executeUpdate(sql);
			sql = "delete from friends where userid_one = "+reciever.getUserId()+" and userid_two = "+ sender.getUserId();
			stmt.executeUpdate(sql);
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}
	}
	
	public void sendRequest(User sender, User reciever) throws Exception
	{
		try
		{
			conn = this.ds.getConnection();
			stmt = conn.createStatement();
			String sql = "insert into notifications(sender_id,reciever_id,type,time) values("+sender.getUserId()+","+reciever.getUserId()+",0,current_time)";
			stmt.executeUpdate(sql);
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}
	}
	
	public void likeDislikePost(int userId, int postId) throws Exception
	{
		try
		{
			conn = this.ds.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from likesdata where user_id = "+ userId + " and post_id = "+ postId;
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
				sql = "delete from likesdata where user_id = "+ userId + " and post_id = "+ postId;
			
			else
				sql = "insert into likesdata values("+ postId +","+userId+")";
			
			System.out.print(sql);
			stmt.executeUpdate(sql);
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}
	}
	
	void close(Connection conn,Statement stmt,PreparedStatement pstmt,ResultSet rs)
	{
		try {
		if(conn !=null)
		{
			conn.close();
			conn=null;
		}
		if(stmt !=null)
			stmt=null;
		if(pstmt !=null)
			pstmt=null;
		if(rs !=null)
			rs=null;
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	
}
