package controller.report;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import controller.ACL_Controller;
import controller.PMF;
import model.entity.*;

@SuppressWarnings("serial")
public class ControllerReportSearch extends HttpServlet{
	 
	ArrayList<Long> idporduct = new ArrayList<Long>();
	ArrayList<Integer> cantidad = new ArrayList<Integer>();

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		if(ACL_Controller.isAvalible(req, resp)){
			PersistenceManager pm = PMF.get().getPersistenceManager();

			String query4 = "SELECT FROM "+ Billing.class.getName();
			List<Billing> billings = (List<Billing>)pm.newQuery(query4).execute();
			
			req.setAttribute("billings", billings);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Report/search.jsp");
			dispatcher.forward(req, resp);
		}
	}
	
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		String query = "SELECT FROM "+Product.class.getName();
		String query2 = "SELECT FROM "+Billing.class.getName();
		
		List<Product> products = (List<Product>)pm.newQuery(query).execute();
		List<Billing> billings = (List<Billing>)pm.newQuery(query2).execute();
		List<Billing> billings2 = new ArrayList<Billing>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-dd-MM");
		
		DateFormat df = DateFormat.getDateInstance(2);
		
		Date date1 = null, date2 = null;
		String fecha="";
		try {
			
//			fecha=sdf.format(date1); 
			date1 = sdf.parse(req.getParameter("date1"));
			date2 = sdf.parse(req.getParameter("date2"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		for(int i=0; i<billings.size(); i++){
			String fecha2=null;
			Date date3 = null;
			
			if(billings.get(i).getDateCreate() != null){
				fecha2 = sdf.format(billings.get(i).getDateCreate());
				//0123456789
				//2018-17-07
				int año, mes, dia, año1, mes1, dia1, año2, mes2, dia2;
				año = Integer.parseInt(fecha2.substring(0,4));
				mes = Integer.parseInt(fecha2.substring(5,7));
				dia = Integer.parseInt(fecha2.substring(8));
				
				año1 = Integer.parseInt(req.getParameter("date1").substring(0,4));
				mes1 = Integer.parseInt(req.getParameter("date1").substring(8));
				dia1 = Integer.parseInt(req.getParameter("date1").substring(5,7));
				
				año2 = Integer.parseInt(req.getParameter("date2").substring(0,4));
				mes2 = Integer.parseInt(req.getParameter("date2").substring(8));
				dia2 = Integer.parseInt(req.getParameter("date2").substring(5,7));
				
				if(año >= año1 && mes >= mes1 && dia >= dia1 && año <= año2 && mes <= mes2 && dia <=dia2){
					billings2.add(billings.get(i));
				}
				
			}
		}
	
		for(int i=0; i<billings2.size(); i++){
			for(int j=0; j<billings2.get(i).getCantidad().size(); j++){
				cantidad.add(billings2.get(i).getCantidad().get(j));
				idporduct.add(billings2.get(i).getIdProducts().get(j));
			}
		}
		ordenar(cantidad, idporduct, 0, cantidad.size()-1);
		
		req.setAttribute("cantidad", cantidad);
		req.setAttribute("idproduct", idporduct);
		req.setAttribute("products", products);
		
		req.getRequestDispatcher("/WEB-INF/Views/Report/report.jsp").forward(req, resp);
	}
	
	private void ordenar(List<Integer> cantidad, List<Long> idporduct, int izquierda, int derecha){
		
		int pivote, left, right, aux;
		Long idaux;
		
		left=izquierda;
		right = derecha;
		pivote = cantidad.get(izquierda);
		
		while(left < right){
			while(cantidad.get(left) <= pivote && left<right){
				left++;
			}
			while(cantidad.get(right) > pivote){
				right--;
			}
			if(left < right){
				aux = cantidad.get(left);
				idaux = idporduct.get(left);
				cantidad.set(left,cantidad.get(right));
				idporduct.set(left, idporduct.get(right));
				
				cantidad.set(right, aux);
				idporduct.set(right, idaux);
			}
		}
		
		cantidad.set(izquierda, cantidad.get(right));
		cantidad.set(right, pivote);
		
		if(izquierda < right-1){
			ordenar(cantidad, idporduct, izquierda, right-1);
		}
		if(right+1 < derecha){
			ordenar(cantidad, idporduct, right+1, derecha);
		}
	}
}
