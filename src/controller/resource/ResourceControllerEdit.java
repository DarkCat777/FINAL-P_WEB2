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
public class ResourceControllerEdit extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if (ACL_Controller.isAvalible(req, resp)) {
			
			PersistenceManager pm = PMF.get().getPersistenceManager();
			
			Resource resource = pm.getObjectById(Resource.class, Long.parseLong(req.getParameter("id")));
			req.setAttribute("resource", resource);
			
			String queryEntra = "SELECT FROM "+ Resource.class.getName();
			List<Resource> resourcesComp = (List<Resource>)pm.newQuery(queryEntra).execute();
			req.setAttribute("resourcesComp", resourcesComp);
			pm.close();
			
			req.getRequestDispatcher("/WEB-INF/View/Resource/edit.jsp").forward(req, resp);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		Resource resource = pm.getObjectById(Resource.class, Long.parseLong(req.getParameter("id")));
		boolean status = Boolean.parseBoolean(req.getParameter("status"));
		String url = req.getParameter("url");
		
		resource.setStatus(status);
		resource.setUrl(url);
		
		pm.close();
		resp.sendRedirect("/resource/view?id="+req.getParameter("id"));
	}
}