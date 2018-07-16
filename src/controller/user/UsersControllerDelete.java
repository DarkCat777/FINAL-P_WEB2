package controller.user;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.Users;

@SuppressWarnings("serial")
public class UsersControllerDelete extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		if(ACL_Controller.isAvalible(req, resp)){
			
			PersistenceManager pm2 = PMF.get().getPersistenceManager();
			
			Long id=Long.parseLong(req.getParameter("id"));
			
			Users user = pm2.getObjectById(Users.class, id);
			
			if (user!=null){
				pm2.deletePersistent(user);
			}
			pm2.close();
			resp.sendRedirect("/user");
		}
	}
}