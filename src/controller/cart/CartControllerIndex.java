package controller.cart;

import java.io.IOException; 
import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;

import controller.PMF;
import model.entity.*;

@SuppressWarnings("serial")
public class CartControllerIndex extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		User user = UserServiceFactory.getUserService().getCurrentUser();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		if (user == null) {
			resp.sendRedirect("/user/login");
			
		} else {
			String idUser = user.getUserId();
			String query = "SELECT FROM " + Cart.class.getName();
			
			List<Cart> Carts = (List<Cart>) pm.newQuery(query).execute();
			List<Cart> CartsUser = new ArrayList<Cart>();
			
			if (!Carts.isEmpty()) {
				for (int i = 0; i < Carts.size(); i++) {
					if (idUser.equals(Carts.get(i).getIdUser())) {
						CartsUser.add(Carts.get(i));
					}
				}
			}
			
			String query2="SELECT FROM "+Product.class.getName();
			List<Product> productos=(List<Product>) pm.newQuery(query2).execute();
			
			req.setAttribute("productos", productos);
			req.setAttribute("cartsuser", CartsUser);
			
			req.getRequestDispatcher("/WEB-INF/Views/Cart/index.jsp").forward(req, resp);
		}
	}
}
