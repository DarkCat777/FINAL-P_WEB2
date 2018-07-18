package model.entity;

import java.util.ArrayList;
import java.util.Date;

import javax.jdo.PersistenceManager;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.repackaged.org.joda.time.DateTimeZone;
import com.google.appengine.repackaged.org.joda.time.LocalDateTime;

import controller.PMF;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Billing {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	@Persistent
	private Date dateCreate;
	@Persistent
	private Long idUser;
	@Persistent
	private ArrayList<Long> idProducts = new ArrayList<Long>();
	@Persistent
	private ArrayList<Integer> cantidad = new ArrayList<Integer>();
	@Persistent
	private double total = 0;
	@Persistent
	private double igv = 0.18;

	public Billing(Long idUser) {
		this.dateCreate = LocalDateTime.now(DateTimeZone.forID("America/Lima")).toDate();
		this.total = 0;
		this.idUser = idUser;
	}

	public void addProduct(Long idProduct, int cantidad) {
		boolean seAñadio = false;
		for (int i = 0; i < this.idProducts.size(); i++) {
			if (idProducts.get(i).equals(idProduct)) {
				seAñadio = true;
				this.cantidad.set(i, cantidad);
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

	public Long getIdUser() {
		return idUser;
	}

	public Date getDateCreate() {
		return dateCreate;
	}

	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
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

	public double getIgv() {
		return igv;
	}

	public void setIgv(double igv) {
		this.igv = igv;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public void setIdUser(Long idUser) {
		this.idUser = idUser;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public double getTotal() {
		return total;
	}

}