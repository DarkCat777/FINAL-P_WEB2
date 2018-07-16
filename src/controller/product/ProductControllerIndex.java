package controller.product;

import java.io.IOException;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Product;

@SuppressWarnings("serial")
public class ProductControllerIndex extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm1 = PMF.get().getPersistenceManager();
			String query5 = "SELECT FROM " + Product.class.getName();
			List<Product> products = (List<Product>) pm1.newQuery(query5).execute();
			pm1.close();
			req.setAttribute("products", products);
			req.getRequestDispatcher("/WEB-INF/Views/Product/index.jsp").forward(req, resp);
		}
	}
}
