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

public class CartControllerDelete extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		User user = UserServiceFactory.getUserService().getCurrentUser();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		if (user == null) {
			resp.sendRedirect("/user/login");
			
		} else {
			String idUser = user.getUserId();
			Long idProduct = Long.parseLong(req.getParameter("idproduct"));
			String query = "SELECT FROM " + Cart.class.getName();
			List<Cart> carts = (List<Cart>) pm.newQuery(query).execute();
			List<Cart> cartUser=new ArrayList<Cart>();
			for (Cart cart : carts) {
				if(cart.getIdUser().equals(idUser)){
					cartUser.add(cart);
				}
			}
			
			if (!cartUser.isEmpty()) {
				for (int i = 0; i < cartUser.size(); i++) {
					if (cartUser.get(i).getIdProduct().equals(idProduct)) {
						if(cartUser.get(i).getCantidad()>1){
							cartUser.get(i).removeProduct();
						}else{
							Cart cart = cartUser.get(i);
							if (cart != null) {
								pm.deletePersistent(cart);
							}
						}
					}
				}
			}
		}
		
		pm.close();
		resp.sendRedirect("/cart");

	}
}
