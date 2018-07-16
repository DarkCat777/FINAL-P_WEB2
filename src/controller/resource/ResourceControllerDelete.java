package controller.resource;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Resource;

@SuppressWarnings("serial")
public class ResourceControllerDelete extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Long idResource = Long.parseLong(req.getParameter("id"));
			Resource resource = pm.getObjectById(Resource.class, idResource);
			if (resource != null) {
				pm.deletePersistent(resource);
			}
			pm.close();
			resp.sendRedirect("/resource");
		}
	}
}