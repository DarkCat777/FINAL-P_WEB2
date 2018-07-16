package controller.product;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Product;

@SuppressWarnings("serial")
public class ProductAddComent extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if (ACL_Controller.isAvalible(req, resp)) {
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Long id=Long.parseLong(req.getParameter("id"));
			Product product=pm.getObjectById(Product.class,id);
			String coment=req.getParameter("coment");
			product.addComent(coment);
			pm.close();
			resp.sendRedirect("/product/view?id=" + req.getParameter("id"));
		}
	}
}
