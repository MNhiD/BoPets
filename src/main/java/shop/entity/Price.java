package shop.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="PRICE")
public class Price {
	
	@Id
	@Column(name="TimeUpdate")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	private Date timeUpdate;
	
	@Column(name="Price")
	private long price;
	
	@Column(name="HistoricalCost")
	private long historicalCost;
	
	@ManyToOne
	@JoinColumn(name = "productID")
	private Product productID;

	public Date getTimeUpdate() {
		return timeUpdate;
	}

	public void setTimeUpdate(Date timeUpdate) {
		this.timeUpdate = timeUpdate;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public long getHistoricalCost() {
		return historicalCost;
	}

	public void setHistoricalCost(long historicalCost) {
		this.historicalCost = historicalCost;
	}

	public Product getRoductID() {
		return productID;
	}

	public void setRoductID(Product roductID) {
		this.productID = roductID;
	}

	
}
