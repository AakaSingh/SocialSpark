package controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import db.PostDbUtil;
import db.UserDbUtil;

/**
 * Servlet implementation class LoadHomePage
 */
@WebServlet("/LoadHomePage")
public class LoadHomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadHomePage() {
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
		
		HttpSession session = request.getSession();
		
		try {
		session.setAttribute("allPosts",postdb.getAllPosts());
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		response.sendRedirect("./Home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
