package controller.ticket;

import model.entity.*;
import controller.*;

import java.io.IOException;
import javax.servlet.http.*;

import java.util.Date;
import java.util.List;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;

@SuppressWarnings("serial")
public class TicketControllerAdd extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "SELECT FROM " + Ticket.class.getName();
			List<Ticket> tickets = (List<Ticket>) pm.newQuery(query).execute();
			req.setAttribute("tickets", tickets);
			req.getRequestDispatcher("/WEB-INF/Views/Ticket/add.jsp");
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		//Recibe y se castea la fecha.
		PersistenceManager pm=PMF.get().getPersistenceManager();
		String createStr=req.getParameter("datecreate");
		Date create=null;
		SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
		try {
			create = formatoDelTexto.parse(createStr);
		} catch (ParseException e) {
			resp.getWriter().println(e.getMessage());
		}
		//Status del Ticket cambiar a Option jsp
		boolean status=Boolean.parseBoolean(req.getParameter("status"));//Respecto a si esta pagado o no
		String nameCustomer=req.getParameter("namecustomer");//Obtenerlo de Usuarios
		String address=req.getParameter("address");
		int customerDni=Integer.parseInt(req.getParameter("customerdni"));
		Long idProduct=Long.parseLong(req.getParameter("idproduct"));
		String descriptionProduct=req.getParameter("descriptionproduct");
		double unitPrice=Double.parseDouble(req.getParameter("unitprice"));
		double mountProduct=Double.parseDouble(req.getParameter("mountproduct"));
		double IGV=Double.parseDouble(req.getParameter("IGV"));
		double total=unitPrice*mountProduct*(1+IGV);
		try {
			Ticket ticket=new Ticket(create, nameCustomer, address, status, customerDni, idProduct, descriptionProduct, unitPrice, mountProduct, total, IGV);
			pm.makePersistent(ticket);
			pm.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
			resp.sendRedirect("/tickets");
		}
	}