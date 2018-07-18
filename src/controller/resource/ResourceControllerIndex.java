package controller.resource;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Resource;

//envia el paramentro billing a /WEB-INF/Views/Billing/index.jsp
@SuppressWarnings("serial")
public class ResourceControllerIndex extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if (ACL_Controller.isAvalible(req, resp)) {

			PersistenceManager pm = PMF.get().getPersistenceManager();

			String query = "SELECT FROM " + Resource.class.getName();
			List<Resource> resources = (List<Resource>) pm.newQuery(query).execute();
			req.setAttribute("resources", resources);
			pm.close();

			req.getRequestDispatcher("/WEB-INF/Views/Resource/index.jsp").forward(req, resp);
		}
	}
}