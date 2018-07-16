package model.entity;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.repackaged.org.joda.time.DateTimeZone;
import com.google.appengine.repackaged.org.joda.time.LocalDateTime;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Product {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	@Persistent
	private String name;
	@Persistent
	private String model;
	@Persistent
	private String marca;
	@Persistent
	private String description;
	@Persistent
	private double price;
	@Persistent
	private boolean status;
	@Persistent
	private Date made;
	@Persistent
	private int stock;
	@Persistent
	private int descuento;

	public Product(String name, String marca, String model, String description, int descuento, boolean status,
			double price, int stock) {
		this.name = name;
		this.marca = marca;
		this.model = model;
		this.description = description;
		this.descuento = descuento;
		this.price = price;
		this.status = status;
		this.stock = stock;
		LocalDateTime ldt = LocalDateTime.now(DateTimeZone.forID("America/Lima"));
		made = ldt.toDate();

	}

	public int getDescuento() {
		return descuento;
	}

	public void setDescuento(int descuento) {
		this.descuento = descuento;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Date getMade() {
		return made;
	}

	public void setMade(Date made) {
		this.made = made;
	}
}