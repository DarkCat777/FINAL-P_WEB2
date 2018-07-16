package model.entity;
// ID long
//name String
//Date create
//Boolean status
import javax.jdo.annotations.IdGeneratorStrategy;

import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.repackaged.org.joda.time.DateTimeZone;
import com.google.appengine.repackaged.org.joda.time.LocalDateTime;

import java.util.Date;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Role {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)private Long id;
	@Persistent private String name;
	@Persistent private Date create;
	@Persistent private boolean status;
	public Role(String name,boolean status) {
		this.name = name;
		this.status=status;
		LocalDateTime ldt = LocalDateTime.now(DateTimeZone.forID("America/Lima"));
		create=ldt.toDate();
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
	public Date getMade() {
		return create;
	}
	public void setMade(Date create) {
		this.create = create;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
}