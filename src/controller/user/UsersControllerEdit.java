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
public class UsersControllerEdit extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Long id=Long.parseLong(req.getParameter("id"));
			Users user = pm.getObjectById(Users.class, id);
			req.setAttribute("user", user);

			String queryEntra = "SELECT FROM " + Role.class.getName();
			List<Role> roles = (List<Role>) pm.newQuery(queryEntra).execute();
			req.setAttribute("roles", roles);

			String queryEntra2 = "SELECT FROM " + Users.class.getName();
			List<Users> users = (List<Users>) pm.newQuery(queryEntra2).execute();
			req.setAttribute("users", users);
			
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Users/edit.jsp"); //Cambiar el nombre de directorio
			rd.forward(req, resp);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Users user = pm.getObjectById(Users.class, Long.parseLong(req.getParameter("id")));

		

		String name = req.getParameter("name");
		String city = req.getParameter("city");
		String almacenaFecha = req.getParameter("birth");
		String año = almacenaFecha.substring(0, 4);
		String mes = almacenaFecha.substring(5, 7);
		String dia = almacenaFecha.substring(8);
		String f = dia + "/" + mes + "/" + año;
		DateFormat df = DateFormat.getDateInstance(2);
		Date closeDate = new Date();
		try {
			closeDate = df.parse(f);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String cellphone = req.getParameter("cellphone");
		String email = req.getParameter("email");
		boolean gender = Boolean.parseBoolean(req.getParameter("gender"));
		Long idRole = Long.parseLong(req.getParameter("idroles"));
		boolean status = Boolean.parseBoolean(req.getParameter("status"));

		user.setName(name);
		user.setCity(city);
		user.setBirth(closeDate);
		user.setCellphone(cellphone);
		user.setEmail(email);
		user.setGender(gender);
		user.setIdRol(idRole);
		user.setStatus(status);
		pm.close();
		resp.sendRedirect("/user/view?id=" + req.getParameter("id"));
	}
}
