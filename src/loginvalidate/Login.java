package loginvalidate;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/formValidation2")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		@SuppressWarnings("unchecked")
		List<User> users= (ArrayList<User>) session.getAttribute("userInfo");
		boolean exist = false;
		boolean flag1 = false;
		for(User s1 : users)
		{
			//System.out.println(s1.getUsername()==username);
			if(s1.getUsername().equals(username) && s1.getPassword().equals(password))
			{
				session.setAttribute("username", s1.getUsername());
				session.setAttribute("imgURL", s1.getImageURL());
				session.setAttribute("followers", s1.getFollowers());
				session.setAttribute("following", s1.getFollowing());
				session.setAttribute("read", s1.getLibrary().getRead());
				session.setAttribute("fav", s1.getLibrary().getFavorite());
				exist=true;
				//RequestDispatcher dispatch  = getServletContext().getRequestDispatcher("SearchPage.html");
				//dispatch.forward(request, response);
			}
			
			if(s1.getUsername().equals(username) && !s1.getPassword().equals(password))
			{
				exist = true;
				flag1 = true;
					
			}
			
		}
		
		if(!exist && (username.trim().length() != 0 && username != null))
		{
			out.println("Username not found!~");
		}
		else
		{
			out.println("~");
		}
		
		if(exist && flag1)
		{
			out.println("Password is not correct~");
		}
		else
		{
			out.println("~");
		}
		
		
		if(username.trim().length() == 0 || username==null)
		{
			out.println("Entry Cannot be Empty~");
		}
		else
		{
			out.println("~");
		}
		if(password.trim().length() == 0 || password == null)
		{
			
			out.println("Entry Cannot be Empty~");
		}
		else
		{
			out.println("~");
		}
		
		
		
	}

}
