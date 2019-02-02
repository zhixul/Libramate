package FirstServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FirstServlet
 */
@WebServlet("/Search")
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("searchType");
		String typedInfo = request.getParameter("key");
		String pageToForward = "";
		if((typedInfo.trim().length() == 0 || typedInfo == null) && type != null)
		{
			pageToForward = "/homepage.jsp";
			request.setAttribute("textError","Please input a search keyword");
		}
		else if(typedInfo != null && type == null)
		{
			pageToForward = "/homepage.jsp";
			request.setAttribute("typeError", "Please select a search type");
		}
		else if(typedInfo == null && type == null)
		{
			pageToForward = "/homepage.jsp";
			request.setAttribute("typeError", "Please select a search type");
			request.setAttribute("textError","Please input a search keyword");
		}
		else
		{
			pageToForward = "/searchPage.html";
			//request.setAttribute("result", );
		}
		RequestDispatcher dispatch  = getServletContext().getRequestDispatcher(pageToForward);
		dispatch.forward(request, response);
		
		
	}



}
