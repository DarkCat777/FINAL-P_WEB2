package controller.access;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.*;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Access;
import model.entity.Resource;
import model.entity.Role;

@SuppressWarnings("serial")
public class AccessControllerAdd extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			
			String query = "SELECT FROM " + Role.class.getName();
			List<Role> roles = (List<Role>) pm.newQuery(query).execute();
			req.setAttribute("roles", roles);
			
			String query2 = "SELECT FROM " + Resource.class.getName();
			List<Resource> resources = (List<Resource>) pm.newQuery(query2).execute();
			req.setAttribute("resources", resources);
			
			String query3 = "SELECT FROM "+ Access.class.getName();
			List<Access> access = (List<Access>)pm.newQuery(query3).execute();
			req.setAttribute("access", access);
			
			pm.close();
			
			
			
			req.getRequestDispatcher("/WEB-INF/Views/Access/add.jsp").forward(req, resp);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		boolean status = Boolean.parseBoolean(req.getParameter("status"));
		Long idRole = Long.parseLong(req.getParameter("idrole"));
		Long idResource = Long.parseLong(req.getParameter("idresource"));
		Access access = new Access(idRole, idResource,status);
		pm.makePersistent(access);
		pm.close();
		resp.sendRedirect("/access");// ControllerIndex.java

	}
}