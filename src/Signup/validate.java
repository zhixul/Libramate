package Signup;

import java.io.FileWriter;
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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import user.User;
import user.User1;

/**
 * Servlet implementation class signup
 */
@WebServlet("/formValidation")
public class validate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String URL = request.getParameter("URL");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		@SuppressWarnings("unchecked")
		List<User> users= (ArrayList<User>) session.getAttribute("userInfo");
		boolean exist = false;
		//String pageToForward = "";
		boolean success = true;
		for(User u1 : users)
		{
			if(u1.getUsername().equals(username))
			{
				exist = true;
				success = false;
			}
		}
		if(exist)
		{
			//pageToForward = "/signup.jsp";
			//request.setAttribute("userError","Username Taken");
			out.println("Username Taken~");
		}
		else
		{
			out.println("~");
		}
		
		
		
		if(username.trim().length() == 0 || username == null)
		{
			//pageToForward = "/signup.jsp";
			//request.setAttribute("userError","Entry Cannot be Empty");
			out.println("Entry Cannot be Empty~");
			success = false;
		}
		else
		{
			out.println("~");
		}
		
		if(password.trim().length() == 0 || password == null)
		{
			//pageToForward = "/signup.jsp";
			//request.setAttribute("URLError", "Entry Cannot be Empty");
			out.println("Entry Cannot be Empty~");
			success = false;
		}
		else
		{
			out.println("~");
		}
		
		if(URL.trim().length() == 0 || URL == null)
		{
			//pageToForward = "/signup.jsp";
			//request.setAttribute("passwordError", "Entry Cannot be Empty");
			out.println("Entry Cannot be Empty~");
			success = false;
		}
		else
		{
			out.println("~");
			//pageToForward = "/searchPage.html";
		}
		if(success)
		{
			Gson gson2 = new GsonBuilder().setPrettyPrinting().create();
			//User newUserInstance = new User();
			User newUser = new User(username,password,URL);
			users.add(newUser);
			
			session.setAttribute("username", username);
			session.setAttribute("imgURL", URL);
			session.setAttribute("followers", newUser.getFollowers());
			session.setAttribute("following", newUser.getFollowing());
			session.setAttribute("read", newUser.getLibrary().getRead());
			session.setAttribute("fav", newUser.getLibrary().getFavorite());
			User1 s2 = new User1(users);
		
			// convert Java object to JSON, and assign to a String
			String jsonInString = gson2.toJson(s2);
			//System.out.println(jsonInString);
			FileWriter fw = null;
			try {
				fw = new FileWriter(getServletContext().getRealPath("/Sample.json"));
			} catch (IOException e) {
				
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			PrintWriter pw = new PrintWriter(fw);
			pw = new PrintWriter(fw);
			pw.println(jsonInString);
			fw.flush();
			fw.close();
			pw.flush();
			pw.close();

		}
//		RequestDispatcher dispatch  = getServletContext().getRequestDispatcher(pageToForward);
//		dispatch.forward(request, response);
	}

}
