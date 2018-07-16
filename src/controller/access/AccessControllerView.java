package controller.access;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Access;
import model.entity.Resource;
import model.entity.Role;

@SuppressWarnings("serial")
public class AccessControllerView extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		if (ACL_Controller.isAvalible(req, resp)) {
			Access access = pm.getObjectById(Access.class, Long.parseLong(req.getParameter("id")));
			String query = "SELECT FROM " + Role.class.getName();
			String query2 = "SELECT FROM " + Resource.class.getName();
			List<Role> roles = (List<Role>) pm.newQuery(query).execute();
			List<Resource> resources = (List<Resource>) pm.newQuery(query2).execute();
			pm.close();
			req.setAttribute("roles", roles);
			req.setAttribute("resources", resources);
			req.setAttribute("access", access);
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Access/view.jsp");
			rd.forward(req, resp);
			// req.getRequestDispatcher("/view.jsp").forward(req,
			// resp);
		}
	}
}