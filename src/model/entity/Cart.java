package model.entity;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Cart {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	@Persistent
	private Long idProduct;
	@Persistent
	private String idUser;
	@Persistent
	private int cantidad;

	public Cart(Long idProduct, String idUser) {
		super();
		this.idProduct = idProduct;
		this.idUser = idUser;
		this.cantidad=0;
	}

	public Cart(String idUser) {
		super();
		this.idUser = idUser;
		this.cantidad=0;
	}

	public Long getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(Long idProduct) {
		this.idProduct = idProduct;
	}

	public String getIdUser() {
		return idUser;
	}

	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void addingProduct() {
		this.cantidad++;
	}
	public void removeProduct() {
		this.cantidad--;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	

}
