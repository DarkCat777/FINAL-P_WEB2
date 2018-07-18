package controller.cart;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;

import controller.PMF;
import model.entity.Cart;

public class CartControllerEdit extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		User user = UserServiceFactory.getUserService().getCurrentUser();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		if (user == null) {
			resp.sendRedirect("/user/login");
			
		} else {
			Long idProduct = new Long(req.getParameter("idproduct")).longValue();
			int cantidad= Integer.parseInt(req.getParameter("cantidad"));
			Cart cart=pm.getObjectById(Cart.class,idProduct);
			cart.setCantidad(cantidad);
		}
		
		pm.close();
		resp.sendRedirect("/cart");

	}
}
