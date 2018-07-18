package controller.ticket;

import controller.*;
import model.entity.*;

import java.io.IOException;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;

import java.util.List;
import javax.servlet.*;
import javax.jdo.PersistenceManager;

@SuppressWarnings("serial")
public class TicketControllerIndex extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		User user=UserServiceFactory.getUserService().getCurrentUser();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		if(user==null){
			req.getRequestDispatcher("/user/login").forward(req, resp);
		}else{
			String query="SELECT FROM "+Users.class.getName()+" WHERE email=='"+user.getEmail()+"' && status==true";
			List<Users> users=(List<Users>)pm.newQuery(query).execute();
			if(users.isEmpty()){
				//ERROR NO EXISTE UN USUARIO O NO ESTA ACTIVO
				String codigoError="ERROR NO ES UN USUARIO REGRISTRADO O NO ESTA ACTIVO";
				req.setAttribute("error", codigoError);
				req.getRequestDispatcher("/WEB-INF/Views/Users/error.jsp").forward(req, resp);
			}else{
				String query2="SELECT FROM "+Resource.class.getName()+" WHERE url=='"+req.getServletPath()+"' && status==true";
				List<Resource> resource=(List<Resource>)pm.newQuery(query2).execute();
				if(resource.isEmpty()){
					//ERROR NO EXISTE UN RECURSO O NO ESTA ACTIVO
					String codigoError="ERROR NO EXISTE UN RECURSO O NO ESTA ACTIVO";
					req.setAttribute("error", codigoError);
					req.getRequestDispatcher("/WEB-INF/Views/Users/error.jsp").forward(req, resp);
				}else{
					String query3="SELECT FROM "+Access.class.getName()+" WHERE idRole=="+users.get(0).getIdRol()+" && idUrl=="+resource.get(0).getId()+" && status==true";
					List<Access> access=(List<Access>)pm.newQuery(query3).execute();
					if(access.isEmpty()){
						//ERROR NO EXISTE UN ACCESO O NO ESTA ACTIVO
						String codigoError="ERROR NO EXISTE UN ACCESO O NO ESTA ACTIVO";
						req.setAttribute("error", codigoError);
						req.getRequestDispatcher("/WEB-INF/Views/Users/error.jsp").forward(req, resp);
					}else{
						//Esto utlimo es el servlet Original
						String query4 = "SELECT FROM "+ Ticket.class.getName()+" WHERE idUser=="+users.get(0).getId();
						String query5= "SELECT FROM " + Product.class.getName();
						List<Ticket> tickets = (List<Ticket>)pm.newQuery(query4).execute();
						List<Product> products = (List<Product>)pm.newQuery(query5).execute();
						String query6="SELECT FROM "+Users.class.getName()+" WHERE email=='"+user.getEmail()+"'";
						List<Users> users2=(List<Users>)pm.newQuery(query6).execute();
						pm.close();
						req.setAttribute("tickets", tickets);
						req.setAttribute("products", products);
						req.setAttribute("users",users2);
						req.getRequestDispatcher("/WEB-INF/Views/Ticket/index.jsp").forward(req, resp);
					}
				}
			}
		}
	}
}
