package controller.user;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Role;
import model.entity.Users;

@SuppressWarnings("serial")
public class UsersControllerView extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Long id = Long.parseLong(req.getParameter("id"));
			Users user = pm.getObjectById(Users.class, id);

			String query = "SELECT FROM " + Role.class.getName();
			List<Role> roles = (List<Role>) pm.newQuery(query).execute();
			req.setAttribute("roles", roles);

			pm.close();
			req.setAttribute("user", user);

			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Users/view.jsp");//directorio
			rd.forward(req, resp);
//		}
	}
}