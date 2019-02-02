package addFav;

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
 * Servlet implementation class addFav
 */
@WebServlet("/addFav")
public class addFav extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookname = request.getParameter("bookname");
		HttpSession session = request.getSession();
		
		@SuppressWarnings("unchecked")
		List<User> userList= (ArrayList<User>)session.getAttribute("userInfo");
		String[] readList =(String[]) session.getAttribute("fav");
		String username1 = (String)session.getAttribute("username");
		String[] readList2 = new String[readList.length+1];
		boolean exist = false;
		for(int i = 0; i < readList.length; i++)
		{
			if(readList[i].equals(bookname)) {
				exist = true;
			}
		}
		if(!exist) {
			for(int i = 0;i < readList2.length; i++)
			{
				if(i == readList2.length-1)
				{
					readList2[i] = bookname;
				}
				else
				{
					readList2[i] = readList[i];
				}
			}
			session.setAttribute("fav", readList2);
			for(User u1 : userList)
			{
				if(u1.getUsername().equals(username1))
				{
					u1.getLibrary().setRead(readList2);;
				}
			}
			Gson gson2 = new GsonBuilder().setPrettyPrinting().create();
			User1 s2 = new User1(userList);
			
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
	}

}
