package controller.access;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Access;
import model.entity.Resource;
import model.entity.Role;

@SuppressWarnings("serial")
public class AccessControllerEdit extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			
			Access access = pm.getObjectById(Access.class, Long.parseLong(req.getParameter("id")));
			req.setAttribute("access", access);
			
			String query4 = "SELECT FROM " + Role.class.getName();
			List<Role> roles = (List<Role>) pm.newQuery(query4).execute();
			req.setAttribute("roles", roles);
			
			String query5 = "SELECT FROM " + Resource.class.getName();
			List<Resource> resources = (List<Resource>) pm.newQuery(query5).execute();
			req.setAttribute("resources", resources);
			
			String queryEntra3 = "SELECT FROM " + Access.class.getName();
			List<Access> accessComp = (List<Access>) pm.newQuery(queryEntra3).execute();
			req.setAttribute("accessComp", accessComp);
			
			pm.close();
			
			
			
			
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Access/edit.jsp");
			rd.forward(req, resp);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Access access = pm.getObjectById(Access.class, Long.parseLong(req.getParameter("id")));
		boolean status = Boolean.parseBoolean(req.getParameter("status"));
		Long idRole = Long.parseLong(req.getParameter("idrole"));
		Long idResource = Long.parseLong(req.getParameter("idresource"));

		access.setIdRole(idRole);
		access.setIdUrl(idResource);
		access.setStatus(status);
		pm.close();
		resp.sendRedirect("/access/view?id=" + req.getParameter("id"));
	}
}