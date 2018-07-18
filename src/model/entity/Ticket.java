package model.entity;

import java.util.ArrayList;
import java.util.Date;

import javax.jdo.PersistenceManager;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import controller.PMF;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Ticket {
		 @PrimaryKey
		 @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
		 
		 @Persistent private Long idUser;
		 @Persistent private Date create;
		 @Persistent private int customerdni;
		 @Persistent private Double total;
		 @Persistent private Double IGV = 0.18;
		 @Persistent private ArrayList<Long> idProducts=new ArrayList<Long>();
		 @Persistent private ArrayList<Integer> cantidad = new ArrayList<Integer>();
		public Ticket(Long idUser,int customerDni){
			this.idUser=idUser;
			this.customerdni = customerDni;
			this.total = 0.0;
			this.create=new Date();
		}
		
		public void addProduct(Long idProduct, int cantidad) {
			boolean seAñadio = false;
			for (int i = 0; i < this.idProducts.size(); i++) {
				if (idProducts.get(i).equals(idProduct)) {
					seAñadio = true;
					this.cantidad.set(i, this.cantidad.get(i)+cantidad);
				}
			}
			if (!seAñadio) {
				this.idProducts.add(idProduct);
				this.cantidad.add(cantidad);
			}
			PersistenceManager pm = PMF.get().getPersistenceManager();
			Product product = pm.getObjectById(Product.class, idProduct);
			this.total += product.getPrice() * cantidad;
			pm.close();
		}

		public void removeProduct(Long idProduct) {
			int cantidadAux=0;
			for(int i=0;i<idProducts.size();i++){
				if(idProducts.get(i).equals(idProduct)){
					idProducts.remove(i);
					cantidadAux=this.cantidad.remove(i);
				}
			}

			PersistenceManager pm = PMF.get().getPersistenceManager();
			Product product = pm.getObjectById(Product.class, idProduct);
			this.total -= product.getPrice() * cantidadAux;
			pm.close();
		}

		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public Long getIdUser() {
			return idUser;
		}
		public void setIdUser(Long idUser) {
			this.idUser = idUser;
		}
		public Date getCreate() {
			return create;
		}
		public void setCreate(Date create) {
			this.create = create;
		}
		public int getCustomerdni() {
			return customerdni;
		}
		public void setCustomerdni(int customerdni) {
			this.customerdni = customerdni;
		}
		public Double getTotal() {
			return total;
		}
		public void setTotal(Double total) {
			this.total = total;
		}
		public Double getIGV() {
			return IGV;
		}
		public void setIGV(Double iGV) {
			IGV = iGV;
		}
		public ArrayList<Long> getIdProducts() {
			return idProducts;
		}
		public void setIdProducts(ArrayList<Long> idProducts) {
			this.idProducts = idProducts;
		}
		public ArrayList<Integer> getCantidad() {
			return cantidad;
		}
		public void setCantidad(ArrayList<Integer> cantidad) {
			this.cantidad = cantidad;
		}
		 
		 
}
