package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
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
 * Servlet implementation class LoadProfile
 */
@WebServlet("/LoadProfile")
public class LoadProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadProfile() {
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
		ArrayList<String> friends = new ArrayList<>();
		String profileU = request.getParameter("profileUser");
		HttpSession session =  request.getSession();
		User currentUser = (User)session.getAttribute("currentUser");
		User profileUser;
		
		if(profileU.equals("none"))
		{
			profileUser = (User)session.getAttribute("profileUser");
			try {
			friends = userdb.getFriends(profileUser);
			session.setAttribute("notifications", userdb.getNotificationById(profileUser.getUserId()));
			session.setAttribute("userFriends", friends);
			session.setAttribute("friends", friends);
			response.sendRedirect("UserProfile.jsp");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			try 
			{
				if(profileU.equals(currentUser.getUserName()))
				{
					session.setAttribute("notifications", userdb.getNotificationById(currentUser.getUserId()));
				}
				profileUser = userdb.searchUsername(profileU);
				friends = userdb.getFriends(profileUser);
				session.setAttribute("friends", friends);
				session.setAttribute("profileUser", profileUser);
				response.sendRedirect("UserProfile.jsp");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
