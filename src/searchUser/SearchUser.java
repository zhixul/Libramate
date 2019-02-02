package searchUser;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.User;

/**
 * Servlet implementation class SearchUser
 */
@WebServlet("/SearchUser")
public class SearchUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = (String) request.getParameter("key");
		
		HttpSession session = request.getSession();
		session.setAttribute("have", "yes");
		List<User> newUserList = new ArrayList<User>();
		@SuppressWarnings("unchecked")
		List<User> originalList = (ArrayList<User>) session.getAttribute("userInfo");
		
		if(keyword == null||keyword.equals(""))
		{
			newUserList = originalList;
			session.setAttribute("newUser", newUserList);
		}
		else {
			
			for(int i = 0; i < originalList.size(); i++)
			{
				if(originalList.get(i).getUsername().toLowerCase().startsWith(keyword.toLowerCase()))
				{
					newUserList.add(originalList.get(i));
					
				}
			}
			session.setAttribute("newUser", newUserList);
		}
		RequestDispatcher dispatch  = getServletContext().getRequestDispatcher("/updateSearchpg2.jsp");
		dispatch.forward(request, response);

	}

}
