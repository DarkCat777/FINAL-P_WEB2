package controller.billing;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Billing;
import model.entity.Product;
import model.entity.Users;

@SuppressWarnings("serial")
public class BillingControllerEdit extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			// Esto utlimo es el servlet Original
			Billing billing = pm.getObjectById(Billing.class, Long.parseLong(req.getParameter("id")));
			req.setAttribute("billing", billing);
			Users user=pm.getObjectById(Users.class,billing.getIdUser());
			req.setAttribute("user", user);
			String query="SELECT FROM "+Product.class.getName();
			List<Product> products=(List<Product>) pm.newQuery(query).execute();
			req.setAttribute("products", products);
			pm.close();
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Billing/edit.jsp");
			rd.forward(req, resp);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Billing billing = pm.getObjectById(Billing.class, Long.parseLong(req.getParameter("id")));
		if(req.getParameter("operación").equalsIgnoreCase("añadir")){//Esto va en el jsp
			Long idProduct=Long.parseLong(req.getParameter("idproduct"));
			int cantidad=Integer.parseInt(req.getParameter("cantidad"));
			billing.addProduct(idProduct, cantidad);
		}else if(req.getParameter("operación").equalsIgnoreCase("eliminar")){
			Long idProduct=Long.parseLong(req.getParameter("idproduct"));//Esto tambien va en el jsp
			billing.removeProduct(idProduct);
		}else if(req.getParameter("operación").equalsIgnoreCase("añadircantidadproducto")){
			Long idProduct=Long.parseLong(req.getParameter("idproduct"));
		}
		pm.close();
		resp.sendRedirect("/billing/view?id=" + req.getParameter("id"));// Enviar														// ViewController
	}
}