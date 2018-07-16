package controller.product;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Product;

@SuppressWarnings("serial")
public class ProductControllerDelete extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Long id=Long.parseLong(req.getParameter("id"));
			Product product = pm.getObjectById(Product.class,id);
			if (product != null) {
				pm.deletePersistent(product);
			}
			pm.close();
			resp.sendRedirect("/product");
		}
	}
}