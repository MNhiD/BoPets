package shop.entity;

import java.util.List;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="SELLORDER",uniqueConstraints = @UniqueConstraint(name="customerID", columnNames = { "CustomerID" }))
public class SellOrder {
	@Id
	@Column(name = "SellID")
	private String sellID;
	//@ManyToOne
	@JoinColumn(name="CustomerID")
	private int customerID;
	@OneToMany(mappedBy = "sellID", fetch = FetchType.EAGER)
	private List<SellDetails> sellDetails;
	@Column(name = "OrderDate")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "MM/dd/yyyy hh:mm:ss")
	private Date orderDate;
	@Column(name = "Status")
	private String status;
	@Column(name = "PaidStatus")
	private boolean paidStatus;
	@Column(name = "TotalMoney")
	private long totalMoney;
	@Column(name = "NOTE")
	private String note;
	@Column(name = "Address")
	private String address;
	
	
	
	
	
public List<SellDetails> getSellDetails() {
		return sellDetails;
	}
	public void setSellDetails(List<SellDetails> sellDetails) {
		this.sellDetails = sellDetails;
	}
public SellOrder() {
		super();
	}
		public SellOrder(String sellID, int customer, Date orderDate,
			String status, boolean paidStatus, long totalMoney, String note, String address) {
		super();
		this.sellID = sellID;
		this.customerID = customer;
		this.orderDate = orderDate;
		this.status = status;
		this.paidStatus = paidStatus;
		this.totalMoney = totalMoney;
		this.note = note;
		this.address = address;
	}





public String getSellID() {
	return sellID;
}





public void setSellID(String sellID) {
	this.sellID = sellID;
}






//public Customer getCustomerID() {
//	return customerID;
//}
//
//
//
//
//
//public void setCustomerID(Customer customerID) {
//	this.customerID = customerID;
//}





public Date getOrderDate() {
	return orderDate;
}





public int getCustomerID() {
	return customerID;
}
public void setCustomerID(int customerID) {
	this.customerID = customerID;
}
public void setOrderDate(Date orderDate) {
	this.orderDate = orderDate;
}





public String getStatus() {
	return status;
}





public void setStatus(String status) {
	this.status = status;
}





public boolean isPaidStatus() {
	return paidStatus;
}





public void setPaidStatus(boolean paidStatus) {
	this.paidStatus = paidStatus;
}





public long getTotalMoney() {
	return totalMoney;
}





public void setTotalMoney(long totalMoney) {
	this.totalMoney = totalMoney;
}





public String getNote() {
	return note;
}





public void setNote(String note) {
	this.note = note;
}





public String getAddress() {
	return address;
}





public void setAddress(String address) {
	this.address = address;
}
	
	
}
