package controller;

import java.io.IOException;
import java.util.Date;

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
 * Servlet implementation class NewMessage
 */
@WebServlet("/NewMessage")
public class NewMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewMessage() {
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
		String content = request.getParameter("txt");
		HttpSession session = request.getSession();
		User sender = (User)session.getAttribute("currentUser");
		User reciever = (User)session.getAttribute("chatUser");
		if(!content.equals(""))
		{
			Date date = new Date();
			try
			{
				userdb.addMessage(sender.getUserId(),reciever.getUserId(), content , date);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("./LoadMessages?chat="+reciever.getUserName());
			dispatcher.forward(request,response);
		}
		else
		{
			RequestDispatcher dispatcher = request.getRequestDispatcher("./LoadMessages?chat="+reciever.getUserName());
			dispatcher.forward(request,response);
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
