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
public class Users {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
	@Persistent private String name;
	@Persistent private String city;
	@Persistent private Date birth;
	@Persistent private String cellphone;
	@Persistent private String email;
	@Persistent private boolean gender;
	@Persistent private boolean status;
	@Persistent private Date made;
	@Persistent private Long idRol;
	public Users(String name, String city,Date birth,String cellphone,String email,boolean gender,Long idRol){//Date birth,String cellphone,String email,boolean gender,Long idRol){
		this.name=name;
		this.city=city;
		this.birth=birth;
		this.cellphone=cellphone;
		this.email=email;
		this.gender=gender;
		this.status=true;
		LocalDateTime ldt = LocalDateTime.now(DateTimeZone.forID("America/Lima"));
		made=ldt.toDate();
		this.idRol=idRol;
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
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isGender() {
		return gender;
	}
	public void setGender(boolean gender) {
		this.gender = gender;
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
	public Long getIdRol() {
		return idRol;
	}
	public void setIdRol(Long idRol) {
		this.idRol = idRol;
	}
		
}
