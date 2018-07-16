package controller.ticket;

import model.entity.*;
import controller.*;

import java.io.IOException;
import javax.servlet.http.*;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;

@SuppressWarnings("serial")
public class TicketControllerEdit extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "SELECT FROM " + Ticket.class.getName();
			List<Ticket> tickets = (List<Ticket>) pm.newQuery(query).execute();
			req.setAttribute("tickets", tickets);
			req.getRequestDispatcher("/WEB-INF/Views/Ticket/edit.jsp");
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		//Recibe y se castea la fecha.
		PersistenceManager pm=PMF.get().getPersistenceManager();
		//Status del Ticket cambiar a Option jsp
		boolean status=Boolean.parseBoolean(req.getParameter("status"));//Respecto a si esta pagado o no
		String nameCustomer=req.getParameter("namecustomer");//Obtenerlo de Usuarios
		String address=req.getParameter("address");
		int customerDni=Integer.parseInt(req.getParameter("customerdni"));
		String descriptionProduct=req.getParameter("descriptionproduct");
		double unitPrice=Double.parseDouble(req.getParameter("unitprice"));
		double mountProduct=Double.parseDouble(req.getParameter("mountproduct"));
		double IGV=Double.parseDouble(req.getParameter("IGV"));
		double total=unitPrice*mountProduct*(1+IGV);
		Long id=Long.parseLong(req.getParameter("id"));
		
		
		try {
			Ticket ticket=pm.getObjectById(Ticket.class,id);
			ticket.setAddress(address);
			ticket.setCustomerdni(customerDni);
			ticket.setDescriptionProduct(descriptionProduct);
			ticket.setIGV(IGV);
			ticket.setMountProduct(mountProduct);
			ticket.setNameCustomer(nameCustomer);
			ticket.setStatus(status);
			ticket.setTotal(total);
			pm.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
			resp.sendRedirect("/tickets");
		}
	}
