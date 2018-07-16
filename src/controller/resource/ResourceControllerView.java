package controller.resource;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Resource;

@SuppressWarnings("serial")
public class ResourceControllerView extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Resource resources = pm.getObjectById(Resource.class, Long.parseLong(req.getParameter("id")));
			pm.close();
			req.setAttribute("resources", resources);
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Resource/view.jsp");
			rd.forward(req, resp);
			// req.getRequestDispatcher("/view.jsp").forward(req,
			// resp);
		}
	}
}
