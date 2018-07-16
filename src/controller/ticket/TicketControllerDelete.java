package controller.ticket;

import controller.*;

import java.io.IOException;
import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.*;

@SuppressWarnings("serial")

public class TicketControllerDelete extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		if (ACL_Controller.isAvalible(req, resp)) {
			Ticket ticket = pm.getObjectById(Ticket.class, new Long(req.getParameter("id")).longValue());
			if (ticket != null) {
				pm.deletePersistent(ticket);
				pm.close();
				resp.sendRedirect("/tickets");
			}
			resp.sendRedirect("/tickets");

		}
	}
}
