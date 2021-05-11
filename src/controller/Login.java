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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String uName = request.getParameter("uName");
		String pass = request.getParameter("pass");
		try
		{
			User currentUser = userdb.searchUsername(uName);
			if(currentUser!=null)
			{
				if(currentUser.getPass().equals(pass))
				{
					session = request.getSession();
					session.setAttribute("currentUser", currentUser);
					session.setAttribute("profileUser", currentUser);
					session.setAttribute("allUsers", userdb.getAllUsers());
					RequestDispatcher dispatcher = request.getRequestDispatcher("./LoadProfile?profileUser=none");
					dispatcher.forward(request,response);
				}
				else
				{
					session.setAttribute("error","Incorrect Password");
					response.sendRedirect("./LoginRegister.jsp");
				}
			}
			else
			{

				session.setAttribute("error","Incorrect Username");
				response.sendRedirect("./LoginRegister.jsp");
			}
		
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
