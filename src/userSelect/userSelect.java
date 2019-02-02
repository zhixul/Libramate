package userSelect;

import java.io.IOException;
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
 * Servlet implementation class userSelect
 */
@WebServlet("/userSelect")
public class userSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ID = Integer.parseInt(request.getParameter("userID"));
		HttpSession session =request.getSession();
		@SuppressWarnings("unchecked")
		List<User> userList = (ArrayList<User>)session.getAttribute("newUser");
		session.setAttribute("finalUser", userList.get(ID));
		
	}

}
