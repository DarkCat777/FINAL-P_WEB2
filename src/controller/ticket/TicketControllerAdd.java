package controller.ticket;

import model.entity.*;

import controller.*;

import java.io.IOException;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

@SuppressWarnings("serial")
public class TicketControllerAdd extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if (ACL_Controller.isAvalible(req, resp)) {
			
			PersistenceManager pm = PMF.get().getPersistenceManager();
			
			String query = "SELECT FROM " + Product.class.getName();
			List<Product> products = (List<Product>) pm.newQuery(query).execute();
			req.setAttribute("products",products);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Ticket/add.jsp");
			dispatcher.forward(req, resp);
		}
	}

	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		//Recibe y se castea la fecha.
		PersistenceManager pm=PMF.get().getPersistenceManager();
		
		User userInLine = UserServiceFactory.getUserService().getCurrentUser();
		String query = "SELECT FROM " + Users.class.getName() + " WHERE email=='" + userInLine.getEmail()
		+ "' && status==true";
		List<Users> user = (List<Users>) pm.newQuery(query).execute();
		Long idUser = null;
		if (!user.isEmpty()) {
			idUser = user.get(0).getId();
		}
		Long idProduct=Long.parseLong(req.getParameter("idproduct"));
		int cantidad=Integer.parseInt(req.getParameter("cantidad"));
		int DNI = Integer.parseInt(req.getParameter("dni"));
		try {
			Ticket ticket = new Ticket(idUser,DNI);
			ticket.addProduct(idProduct, cantidad);
			pm.makePersistent(ticket);
			pm.close();
			resp.sendRedirect("/tickets");// ControllerIndex.java
		} catch (Exception e) {
			resp.getWriter().println(e.getMessage());
		}
	}
}