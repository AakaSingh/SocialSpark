package controller;

import java.io.IOException;

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
 * Servlet implementation class NotificationActions
 */
@WebServlet("/NotificationActions")
public class NotificationActions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotificationActions() {
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
		String action = request.getParameter("act");
		HttpSession session = request.getSession();
		User currentUser = (User)session.getAttribute("currentUser");
		try 
		{
			if(action.equals("clr"))
			{
				userdb.notifSeen(currentUser.getUserId());
				System.out.print("done");
			}
			else
			{
				userdb.acceptRequest(Integer.parseInt(request.getParameter("nid")), currentUser.getUserId(),Integer.parseInt(request.getParameter("uid")));
				session.setAttribute("userFriends", userdb.getFriends(currentUser));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("./LoadProfile?profileUser="+currentUser.getUserName());
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
