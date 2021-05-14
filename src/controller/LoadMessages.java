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
import model.Message;
import model.User;

/**
 * Servlet implementation class LoadMessages
 */
@WebServlet("/LoadMessages")
public class LoadMessages extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadMessages() {
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
		ArrayList<Message> messages = new ArrayList<>();
		String chatU = request.getParameter("chat");
		System.out.print(chatU);
		HttpSession session =  request.getSession();
		User currentUser = (User)session.getAttribute("currentUser");
		
		if(chatU.equals("Make Friends  "))
		{
			response.sendRedirect("./LoadProfile?profileUser="+currentUser.getUserName());
		}
		
		try {
		User chatUser = userdb.searchUsername(chatU);
		messages = userdb.getMessages(currentUser, chatUser);
		session.setAttribute("chatUser", chatUser);
		session.setAttribute("messages", messages);
		response.sendRedirect("./Messages.jsp");
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
