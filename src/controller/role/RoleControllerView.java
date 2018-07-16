package controller.role;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Role;

@SuppressWarnings("serial")
public class RoleControllerView extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		if (ACL_Controller.isAvalible(req, resp)) {
			Role roles = pm.getObjectById(Role.class, Long.parseLong(req.getParameter("id")));
			pm.close();
			req.setAttribute("roles", roles);
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Role/view.jsp");
			rd.forward(req, resp);
			// req.getRequestDispatcher("/view.jsp").forward(req,
			// resp);
		}
	}
}