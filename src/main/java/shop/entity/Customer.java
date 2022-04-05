package shop.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "CUSTOMER")
public class Customer {
	@Id
	@GeneratedValue
	@Column(name = "CustomerID")
	private int customerID;
	@Column(name = "PhoneNumber")
	private String phoneNumber;
	@Column(name = "EmailAddress")
	private String email;
	@Column(name = "Name")
	private String name;
	@Column(name = "AccountID")
	private String accountID;
	
	
	 @OneToMany(mappedBy = "customer", fetch = FetchType.EAGER) 
	 private Collection<Address> address;
	 
//	@OneToMany(mappedBy = "customerID", fetch = FetchType.EAGER)
//	private Collection<SellOrder> sellOrder;
//	@OneToMany(mappedBy = "customer", fetch = FetchType.EAGER)
//	private Collection<Cart> cart;
	
	
	
	
	public Customer() {
		super();
	}
	public Customer( String phoneNumber, String email, String name, String accountID) {
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.name = name;
		this.accountID = accountID;
	}
	public int getCustomerID() {
		return customerID;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAccountID() {
		return accountID;
	}
	public void setAccountID(String accountID) {
		this.accountID = accountID;
	}
	public Collection<Address> getAddress() {
		return address;
	}
	public void setAddress(Collection<Address> address) {
		this.address = address;
	}
//	public Collection<SellOrder> getSellOrder() {
//		return sellOrder;
//	}
//	public void setSellOrder(Collection<SellOrder> sellOrder) {
//		this.sellOrder = sellOrder;
//	}
//	public Collection<Cart> getCart() {
//		return cart;
//	}
//	public void setCart(Collection<Cart> cart) {
//		this.cart = cart;
//	}
	
	
}
