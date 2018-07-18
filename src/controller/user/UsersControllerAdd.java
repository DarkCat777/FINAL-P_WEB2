package controller.user;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
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
public class UsersControllerAdd extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (ACL_Controller.isAvalible(req, resp)) {
			
			PersistenceManager pm = PMF.get().getPersistenceManager();

			String queryEntra = "SELECT FROM " + Role.class.getName();
			List<Role> roles = (List<Role>) pm.newQuery(queryEntra).execute();
			req.setAttribute("roles", roles);

			String queryEntra2 = "SELECT FROM " + Users.class.getName();
			List<Users> users = (List<Users>) pm.newQuery(queryEntra2).execute();
			req.setAttribute("users", users);

			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Users/add.jsp");
			rd.forward(req, resp);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		String name = request.getParameter("name");
		String city = request.getParameter("city");
		String cellphone = request.getParameter("cellphone");
		String email = request.getParameter("email");
		boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
		Long idRole = Long.parseLong(request.getParameter("idroles")); 
		Users user = new Users(name, city,cellphone, email, gender, idRole);
		pm.makePersistent(user);
		pm.close();
		response.sendRedirect("/user");
	}
}
