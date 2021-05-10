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

import db.PostDbUtil;
import db.UserDbUtil;
import model.User;

/**
 * Servlet implementation class PostActions
 */
@WebServlet("/PostActions")
public class PostActions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostActions() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Resource(name="jdbc/socialproject")
    private DataSource ds;
    private UserDbUtil userdb;
    private PostDbUtil postdb;
    
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
		userdb = new UserDbUtil(ds);
		postdb = new PostDbUtil(ds);
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session  = request.getSession();
		String desiredAction = request.getParameter("act");
		String page = null;
		page = request.getParameter("page");
		User u = (User)session.getAttribute("currentUser");
		User u1 = (User)session.getAttribute("profileUser");
		
		try 
		{
			if(desiredAction.equals("edit"))
			{
				int pId = Integer.parseInt(request.getParameter("pId"));
				String content = request.getParameter("postContent");
				postdb.updatePost(pId,content);
			}
			else if(desiredAction.equals("lik"))
			{
				int pId = Integer.parseInt(request.getParameter("pId"));
				userdb.likeDislikePost(u.getUserId(), pId);
			}
			else if(desiredAction.equals("del"))
			{
				int pId = Integer.parseInt(request.getParameter("pId"));
				postdb.delPost(pId);
			}
			else if(desiredAction.equals("new"))
			{
				String content = request.getParameter("postContent");
				postdb.addPost(u.getUserId(), content);
			}
			if(page!=null)
			{
				if(page.equals("home"))
				{
					RequestDispatcher dispatcher = request.getRequestDispatcher("./LoadHomePage");
					dispatcher.forward(request,response);
				}
			}
			
			u = userdb.searchUsername(u.getUserName());
			session.setAttribute("currentUser", u);
			RequestDispatcher dispatcher = request.getRequestDispatcher("./LoadProfile?profileUser="+u1.getUserName());
			dispatcher.forward(request,response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
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
