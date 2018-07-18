package controller.ticket;

import model.entity.*;
import controller.*;

import java.io.IOException;
import javax.servlet.http.*;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

@SuppressWarnings("serial")
public class TicketControllerEdit extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			
			Ticket ticket = pm.getObjectById(Ticket.class,Long.parseLong(req.getParameter("id")));
			req.setAttribute("ticket", ticket);
			
			Users user=pm.getObjectById(Users.class,ticket.getIdUser());
			req.setAttribute("user", user);
			
			String query="SELECT FROM "+Product.class.getName();
			List<Product> products=(List<Product>) pm.newQuery(query).execute();
			req.setAttribute("products", products);
			
			pm.close();
			
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Ticket/edit.jsp");
			rd.forward(req, resp);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Ticket ticket = pm.getObjectById(Ticket.class, Long.parseLong(req.getParameter("id")));
		if(req.getParameter("operacion").equalsIgnoreCase("anadir")){//Esto va en el jsp
			Long idProduct=Long.parseLong(req.getParameter("idproduct"));
			int cantidad=Integer.parseInt(req.getParameter("cantidad"));
			ticket.addProduct(idProduct, cantidad);
		}else if(req.getParameter("operacion").equalsIgnoreCase("eliminar")){
			Long idProduct=Long.parseLong(req.getParameter("idproduct"));//Esto tambien va en el jsp
			ticket.removeProduct(idProduct);
		}
		pm.close();
		resp.sendRedirect("/tickets/view?id=" + req.getParameter("id"));// Enviar														// ViewController
	}
}