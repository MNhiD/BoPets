package shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ACCOUNT")
public class Account {
	@Id
	@Column(name = "AccountID")
	private String accountID;
	@Column(name = "Password")
	private String password;
	@Column(name = "Avatar")
	private String avatar;
	@Column(name = "Status")
	private boolean status;
	@Column(name = "Type")
	private String type;
	
	public Account() {
		super();
	}
	public Account(String accountID, String password, String avatar, boolean status, String type) {
		super();
		this.accountID = accountID;
		this.password = password;
		this.avatar = avatar;
		this.status = status;
		this.type = type;
	}
	public String getAccountID() {
		return accountID;
	}
	public void setAccountID(String accountID) {
		this.accountID = accountID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
