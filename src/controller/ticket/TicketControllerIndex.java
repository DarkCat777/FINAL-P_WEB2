package controller.ticket;

import controller.*;
import model.entity.*;

import java.io.IOException;
import javax.servlet.http.*;

import java.util.List;
import javax.servlet.*;
import javax.jdo.PersistenceManager;

@SuppressWarnings("serial")
public class TicketControllerIndex extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		if (ACL_Controller.isAvalible(req, resp)) {
			String query = "select from " + Ticket.class.getName();
			List<Ticket> tickets = (List<Ticket>) pm.newQuery(query).execute();
			req.setAttribute("tickets", tickets);
			req.getRequestDispatcher("/WEB-INF/Views/Tickets/index.jsp").forward(req, resp);
		}
	}
}
