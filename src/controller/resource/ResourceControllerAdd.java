package controller.resource;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.*;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Resource;

@SuppressWarnings("serial")
public class ResourceControllerAdd extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm= PMF.get().getPersistenceManager();
			
			String query1 = "select from " + Resource.class.getName();
			List<Resource> resources = (List<Resource>)pm.newQuery(query1).execute();
			req.setAttribute("resources", resources);
			
			req.getRequestDispatcher("/WEB-INF/Views/Resource/add.jsp").forward(req, resp);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		String url = req.getParameter("url").toLowerCase();
		boolean status = Boolean.parseBoolean(req.getParameter("status"));
		
		Resource resource = new Resource(url,status);
		try{
			pm.makePersistent(resource);
			pm.close();
			resp.sendRedirect("/resource");
		}catch(Exception e){
			System.out.println(e);
		}
	}
}