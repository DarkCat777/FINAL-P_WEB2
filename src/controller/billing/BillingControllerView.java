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
public class BillingControllerView extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Billing billing = pm.getObjectById(Billing.class, Long.parseLong(req.getParameter("id")));
			Users user=pm.getObjectById(Users.class,billing.getIdUser());
			String query="SELECT FROM "+Product.class.getName();
			List<Product> products=(List<Product>) pm.newQuery(query).execute();
			req.setAttribute("user", user);
			pm.close();
			req.setAttribute("products", products);
			req.setAttribute("billing", billing);
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Billing/view.jsp");
			rd.forward(req, resp);
		}
	}
}