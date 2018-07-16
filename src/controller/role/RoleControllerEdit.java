package controller.role;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Role;

@SuppressWarnings("serial")
public class RoleControllerEdit extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm2 = PMF.get().getPersistenceManager();

			Role roles = pm2.getObjectById(Role.class, Long.parseLong(req.getParameter("id")));
			req.setAttribute("roles", roles);

			String queryEntra = "SELECT FROM " + Role.class.getName();
			List<Role> rolesComp = (List<Role>) pm2.newQuery(queryEntra).execute();
			req.setAttribute("rolesComp", rolesComp);

			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Role/edit.jsp");
			rd.forward(req, resp);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		Role role = pm.getObjectById(Role.class, Long.parseLong(req.getParameter("id")));
		String nameRol = req.getParameter("nameRol");
		boolean status = Boolean.parseBoolean(req.getParameter("status"));
		
		role.setName(nameRol);
		role.setStatus(status);
		pm.close();
		resp.sendRedirect("/role/view?id=" + req.getParameter("id"));
	}
}