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
	
	public PostDbUtil(DataSource ds)
	{
		this.ds = ds;
	}
	
	public ArrayList<Post> getPostsByUsername(String uName) throws Exception
	{
		ArrayList<Post> posts = new ArrayList<>();
		
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			conn = this.ds.getConnection();
			
			String sql = "select * from post join user on post.user_id = user.user_id where user.uname = '" + uName + "' order by post.post_date" ;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				posts.add(new Post(rs.getInt("user_id"),rs.getInt("post_id"),rs.getString("content"),rs.getString("post_date").toString()));
			}
		}
		finally
		{
			close(conn,stmt,pstmt,rs);
		}		
		
		System.out.print(posts.size());
		return posts;
		
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
