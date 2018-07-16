package controller.product;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Product;

@SuppressWarnings("serial")
public class ProductControllerEdit extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Product product = pm.getObjectById(Product.class, Long.parseLong(req.getParameter("id")));
			pm.close();
			req.setAttribute("product", product);
			req.getRequestDispatcher("/WEB-INF/Views/Product/edit.jsp").forward(req, resp);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Long id = Long.parseLong(req.getParameter("id"));
		String name = req.getParameter("name");
		String description = req.getParameter("description");
		Product product = pm.getObjectById(Product.class, id);
		double price = Double.parseDouble(req.getParameter("price"));
		int stock = Integer.parseInt(req.getParameter("stock"));
		product.setName(name);
		product.setDescription(description);
		product.setPrice(price);
		product.setStock(stock);
		pm.close();
		resp.sendRedirect("/product/view?id=" + req.getParameter("id"));
	}
}
