package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import model.Post;

public class PostDbUtil {
	
	DataSource ds;
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public PostDbUtil(DataSource ds)
	{
		this.ds = ds;
	}
	
	public void delPost(int postId) throws Exception
	{
		try
		{
			conn = this.ds.getConnection();
			stmt = conn.createStatement();
			String sql = "delete from post where post_id = "+ postId;
			stmt.executeUpdate(sql);
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}
	}
	
	public void updatePost(int postId, String content) throws Exception
	{
		try
		{
			conn = this.ds.getConnection();
			stmt = conn.createStatement();
			String sql = "update post set content = \""+content+"\" where post_id = "+ postId;
			stmt.executeUpdate(sql);		
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}
	}
	
	public ArrayList<Post> getPostsByUsername(String uName) throws Exception
	{
		ArrayList<Post> posts = new ArrayList<>();
		
		try
		{
			conn = this.ds.getConnection();
			
			String sql = "select * from post join user on post.user_id = user.user_id where user.uname = '" + uName + "' order by post.post_date desc" ;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			ResultSet rstemp = null;
			int noOfLikes;
			
			while(rs.next())
			{
				rstemp = null;
				noOfLikes = 0;
				sql = "select count(*) as nooflikes from likesdata where post_id = " + rs.getInt("post_id");
				stmt = conn.createStatement();
				rstemp = stmt.executeQuery(sql);
				if(rstemp.next())
					noOfLikes = rstemp.getInt("nooflikes");
				posts.add(new Post(rs.getInt("user_id"),rs.getInt("post_id"),rs.getString("content"),rs.getString("post_date").toString(),noOfLikes));	
			}
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}		
		
		return posts;
		
	}
	
	public ArrayList<Post> getAllPosts() throws Exception
	{
ArrayList<Post> posts = new ArrayList<>();
		
		try
		{
			conn = this.ds.getConnection();
			
			String sql = "select * from post order by post_date desc" ;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			ResultSet rstemp = null;
			int noOfLikes;
			
			while(rs.next())
			{
				rstemp = null;
				noOfLikes = 0;
				sql = "select count(*) as nooflikes from likesdata where post_id = " + rs.getInt("post_id");
				stmt = conn.createStatement();
				rstemp = stmt.executeQuery(sql);
				if(rstemp.next())
					noOfLikes = rstemp.getInt("nooflikes");
				posts.add(new Post(rs.getInt("user_id"),rs.getInt("post_id"),rs.getString("content"),rs.getString("post_date").toString(),noOfLikes));	
			}
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}		
		
		return posts;
	}
	
	public void addPost(int userId, String content) throws Exception
	{
		try
		{
			conn = this.ds.getConnection();
			
			String sql = "insert into post(content,post_date,user_id) values('"+content+"',current_time,"+userId+")" ;
			stmt = conn.createStatement();
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
