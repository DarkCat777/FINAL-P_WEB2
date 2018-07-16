package model.entity;

import java.util.ArrayList;
import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

public class Ticket {
		 @PrimaryKey
		 @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
		 @Persistent private Date create;
		 @Persistent private String nameCustomer;
		 @Persistent private String address;
		 @Persistent private boolean status;
		 @Persistent private int customerdni;

		 @Persistent private String descriptionProduct;
		 @Persistent private Double unitPrice;
		 @Persistent private Double mountProduct;
		 @Persistent private Double total;
		 @Persistent private Double IGV;
		 @Persistent private ArrayList<Long> idProducts=new ArrayList<Long>();
		 
		public Ticket(Date create, String nameCustomer, String address, boolean status, int customerDni,
				Long idProduct, String descriptionProduct, Double unitPrice, Double mountProduct, Double total,
				Double IGV) {
			super();
			this.create = create;
			this.nameCustomer = nameCustomer;
			this.address = address;
			this.status = status;
			this.customerdni = customerDni;
			this.idProducts.add(idProduct);
			this.descriptionProduct = descriptionProduct;
			this.unitPrice = unitPrice;
			this.mountProduct = mountProduct;
			this.total = total;
			this.IGV = IGV;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public Date getCreate() {
			return create;
		}
		
		public ArrayList<Long> getIdProducts() {
			return idProducts;
		}

		public void setIdProducts(ArrayList<Long> idProducts) {
			this.idProducts = idProducts;
		}

		public void setCreate(Date create) {
			this.create = create;
		}

		public String getNameCustomer() {
			return nameCustomer;
		}

		public void setNameCustomer(String nameCustomer) {
			this.nameCustomer = nameCustomer;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public boolean isStatus() {
			return status;
		}

		public void setStatus(boolean status) {
			this.status = status;
		}

		public int getCustomerdni() {
			return customerdni;
		}

		public void setCustomerdni(int customerdni) {
			this.customerdni = customerdni;
		}

		public String getDescriptionProduct() {
			return descriptionProduct;
		}

		public void setDescriptionProduct(String descriptionProduct) {
			this.descriptionProduct = descriptionProduct;
		}

		public Double getUnitPrice() {
			return unitPrice;
		}

		public void setUnitPrice(Double unitPrice) {
			this.unitPrice = unitPrice;
		}

		public Double getMountProduct() {
			return mountProduct;
		}

		public void setMountProduct(Double mountProduct) {
			this.mountProduct = mountProduct;
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
		
		
		 
		 
}
