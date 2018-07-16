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
public class CartControllerView extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		User user = UserServiceFactory.getUserService().getCurrentUser();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		if (user == null) {
			resp.sendRedirect("/user/login");
			
		} else {
			String idUser = user.getUserId();
			String query = "SELECT FROM " + Cart.class.getName();
			String query2 = "SELECT FROM " + Product.class.getName();
			
			List<Cart> carts=(List<Cart>) pm.newQuery(query).execute();
			List<Cart> cartUser=new ArrayList<Cart>();
			for (Cart cart : carts) {
				if(cart.getIdUser().equals(idUser)){
					cartUser.add(cart);
				}
			}
			List<Product> products=(List<Product>) pm.newQuery(query2).execute();
			
			req.setAttribute("products", products);
			req.setAttribute("cartuser", cartUser);
			
			//revisar
			if(req.getParameter("pago").equalsIgnoreCase("boleta")){
				req.getRequestDispatcher("/WEB-INF/Views/Ticket/view.jsp").forward(req, resp);
			}else if(req.getParameter("pago").equalsIgnoreCase("factura")){
				req.getRequestDispatcher("/WEB-INF/Views/Billing/view.jsp").forward(req, resp);
			}
			
			//req.getRequestDispatcher("/WEB-INF/View/Carts/view.jsp");//Ahi se vera si es tipo boleta ... y se calculara los precios... etc.
		}
	}
}
