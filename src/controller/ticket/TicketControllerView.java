package controller.ticket;

import model.entity.*;
import controller.*;

import java.io.IOException;
import javax.servlet.http.*;

import java.util.List;
import javax.servlet.*;
import javax.jdo.PersistenceManager;

@SuppressWarnings("serial")
public class TicketControllerView extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();

		if (ACL_Controller.isAvalible(req, resp)) {

			String query4 = "select from " + Ticket.class.getName() + " where id == " + req.getParameter("id");
			List<Ticket> tickets = (List<Ticket>) pm.newQuery(query4).execute();

			req.setAttribute("tickets", tickets);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Ticket/view.jsp");
			dispatcher.forward(req, resp);

		}
	}
}