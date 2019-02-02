package follow;

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
 * Servlet implementation class Follow
 */
@WebServlet("/Follow")
public class Follow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String status = (String) session.getAttribute("Followstatus");
		User otherUser = (User)session.getAttribute("finalUser");
		String[] followers = otherUser.getFollowers();
		List<String> followerList = new ArrayList<String>();
		String[] followings = (String[]) session.getAttribute("following");
		List<String> followingList = new ArrayList<String>();
		if(!status.equals("Follow")) {
			for(String s1 : followers)
			{
				followerList.add(s1);
			}
			followerList.remove((String)session.getAttribute("username"));
			String[] newFollowers = new String[followerList.size()];
			for(int i = 0; i < followerList.size();i++)
			{
				newFollowers[i] = followerList.get(i);
			}
			for(String s1 : followings)
			{
				followingList.add(s1);
			}
			followingList.remove(otherUser.getUsername());
			String[] newFollowings = new String[followingList.size()];
			for(int i = 0; i < followingList.size();i++)
			{
				newFollowings[i] = followingList.get(i);
			}
			@SuppressWarnings("unchecked")
			List<User> originalList = (ArrayList<User>) session.getAttribute("userInfo");
			for(User s1:originalList)
			{
				if(s1.getUsername().equals((String)session.getAttribute("username")))
				{
					s1.setFollowing(newFollowings);
				}
				if(s1.getUsername().equals(otherUser.getUsername()))
				{
					s1.setFollowers(newFollowers);
				}
			}
			session.setAttribute("userInfo", originalList);
			session.setAttribute("following", newFollowings);
			//session.setAttribute("followers", newFollowers);
			session.setAttribute("Followstatus","UnFollow");
			Gson gson2 = new GsonBuilder().setPrettyPrinting().create();
			User1 s2 = new User1(originalList);
			
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
		else//Unfollow status
		{
			
			for(String s1 : followers)
			{
				followerList.add(s1);
			}
			followerList.add((String)session.getAttribute("username"));
			String[] newFollowers = new String[followerList.size()];
			for(int i = 0; i < followerList.size();i++)
			{
				newFollowers[i] = followerList.get(i);
			}
			for(String s1 : followings)
			{
				followingList.add(s1);
			}
			followingList.add(otherUser.getUsername());
			String[] newFollowings = new String[followingList.size()];
			for(int i = 0; i < followingList.size();i++)
			{
				newFollowings[i] = followingList.get(i);
			}
			@SuppressWarnings("unchecked")
			List<User> originalList = (ArrayList<User>) session.getAttribute("userInfo");
			for(User s1:originalList)
			{
				if(s1.getUsername().equals((String)session.getAttribute("username")))
				{
					s1.setFollowing(newFollowings);
				}
				if(s1.getUsername().equals(otherUser.getUsername()))
				{
					s1.setFollowers(newFollowers);
				}
			}
			session.setAttribute("userInfo", originalList);
			session.setAttribute("following", newFollowings);
			//session.setAttribute("followers", newFollowers);
			session.setAttribute("Followstatus","Follow");
			Gson gson2 = new GsonBuilder().setPrettyPrinting().create();
			User1 s2 = new User1(originalList);
			
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
		//String[] followings = (String[]) session.getAttribute("following");

	}

}
