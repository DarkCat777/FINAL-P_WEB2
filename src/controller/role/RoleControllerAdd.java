package controller.role;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.*;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Role;

@SuppressWarnings("serial")
public class RoleControllerAdd extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if (ACL_Controller.isAvalible(req, resp)) {
			
			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query1 = "SELECT FROM " + Role.class.getName();
			List<Role> roles = (List<Role>) pm.newQuery(query1).execute();
			
			req.setAttribute("roles", roles);
			
			req.getRequestDispatcher("/WEB-INF/Views/Role/add.jsp").forward(req, resp);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		String nameRol = req.getParameter("nameRol");
		boolean status = Boolean.parseBoolean(req.getParameter("status"));
		
		Role role = new Role(nameRol,status);
		try{
			pm.makePersistent(role);
			pm.close();
			resp.sendRedirect("/role");
		}catch(Exception e){
			System.out.println(e);
		}

	}
}