package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import model.Post;
import model.User;

public class UserDbUtil {
	DataSource ds;
	
	public UserDbUtil(DataSource ds)
	{
		this.ds = ds;
	}

	public User searchUsername(String uName) throws Exception
	{
		User tempUser = null;
		ArrayList<Post> posts = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
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
		
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
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
		
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
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
	
	
	void close(Connection conn,Statement stmt,PreparedStatement pstmt,ResultSet rs)
	{
		try {
		if(conn !=null)
			conn.close();
		if(stmt !=null)
			stmt.close();
		if(pstmt !=null)
			pstmt.close();
		if(rs !=null)
			rs.close();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	
}
