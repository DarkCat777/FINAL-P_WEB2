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
import model.entity.Cart;

@SuppressWarnings("serial")
public class CartControllerAdd extends HttpServlet{
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		User user = UserServiceFactory.getUserService().getCurrentUser();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		if (user == null) {
			resp.sendRedirect("/user/login");
			
		} else {
			String idUser = user.getUserId();
			Long idProduct = new Long(req.getParameter("idproduct")).longValue();
			String query = "SELECT FROM " + Cart.class.getName();
			List<Cart> carts = (List<Cart>)pm.newQuery(query).execute();
			List<Cart> cartUser=new ArrayList<Cart>();
			for (Cart cart : carts) {
				if(cart.getIdUser().equals(idUser)){
					cartUser.add(cart);
				}
			}
			boolean seAñadio=false;
			
			if (!cartUser.isEmpty()) {
				for (int i = 0; i < cartUser.size(); i++) {
					if(cartUser.get(i).getIdProduct().equals(idProduct)){
						cartUser.get(i).addingProduct();
						seAñadio=true;
					}
				}
			}
			
			if(!seAñadio){
				Cart cart = new Cart(idProduct, idUser);
				cart.addingProduct();
				pm.makePersistent(cart);
			}
			
		}
		
		pm.close();
		resp.sendRedirect("/cart");

	}
}
