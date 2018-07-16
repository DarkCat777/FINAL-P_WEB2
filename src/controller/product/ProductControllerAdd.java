package controller.product;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.*;

@SuppressWarnings("serial")
public class ProductControllerAdd extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "select from " + Product.class.getName();
			List<Product> products = (List<Product>) pm.newQuery(query).execute();
			req.setAttribute("products", products);
			req.getRequestDispatcher("/WEB-INF/Views/Product/add.jsp").forward(req, resp);
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String name = req.getParameter("name");
		String marca = req.getParameter("marca");
		String model = req.getParameter("model");// serie del producto
		String description = req.getParameter("description");
		int descuento = Integer.parseInt(req.getParameter("descuento"));
		boolean status = Boolean.parseBoolean(req.getParameter("status"));
		double price = Double.parseDouble(req.getParameter("price"));
		int stock = Integer.parseInt(req.getParameter("stock"));
		Product product = new Product(name, marca, model, description, descuento, status, price, stock);
		try {
			pm.makePersistent(product);
			pm.close();
			resp.sendRedirect("/product");
		} catch (Exception e) {
			System.out.println(e);
		}

	}
}
