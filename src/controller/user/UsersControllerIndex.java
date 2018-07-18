package controller.user;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Role;
import model.entity.Users;

@SuppressWarnings("serial")
public class UsersControllerIndex extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			
			String query = "SELECT FROM " + Users.class.getName();
			List<Users> users = (List<Users>) pm.newQuery(query).execute();
			req.setAttribute("users", users);
			
			String query2 = "SELECT FROM " + Role.class.getName();
			List<Role> roles = (List<Role>) pm.newQuery(query2).execute();
			req.setAttribute("roles", roles);
			
			pm.close();
			req.getRequestDispatcher("/WEB-INF/Views/Users/index.jsp").forward(req, resp);
		}
	}
}
