package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import db.UserDbUtil;
import model.User;

/**
 * Servlet implementation class FriendActions
 */
@WebServlet("/FriendActions")
public class FriendActions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FriendActions() {
        super();
        // TODO Auto-generated constructor stub
    }
    

    @Resource(name="jdbc/socialproject")
    private DataSource ds;
    private UserDbUtil userdb;

    
    
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
		userdb = new UserDbUtil(ds);
	}


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String action = request.getParameter("act");
		User cUser = (User)session.getAttribute("currentUser");
		try 
		{
			User friend = (User)userdb.searchUsername(request.getParameter("friend"));
			
				if(action.equals("rem"))
				{
					userdb.removeFriend(cUser, friend);
					ArrayList<String> userFriends = new ArrayList<>();
					userFriends = userdb.getFriends(cUser);
					session.setAttribute("userFriends", userFriends);
				}
				else if(action.equals("req"))
				{
					userdb.sendRequest(cUser, friend);
				}
				else if(action.equals("blk"))
				{
					userdb.blockfriend(cUser,friend);
					ArrayList<String> userFriends = new ArrayList<>();
					userFriends = userdb.getFriends(cUser);
					session.setAttribute("userFriends", userFriends);
				}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("./LoadProfile?profileUser="+cUser.getUserName());
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
