package shop.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="PRODUCTDETAILS")
public class ProductDetails {

	@Column(name="Brand")
	private String brand;
	
	@Column(name="Weight",nullable = true)
	private Double weight;
	
	@Column(name="Material",nullable = true)
	private String material;
	
	@Column(name="Volume",nullable = true)
	private Integer volume;
	
	@Column(name="Classify",nullable = true)
	private String classify;
	
	
	@Column(name="ExpDate",nullable = true)
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date expDate;
	@Id
	@Column(name = "ProductID")
	private String productID;
	
	
	
	public ProductDetails() {
		super();
	}
	public ProductDetails(String brand, Double weight, String material, Integer volume, String classify, Date expDate,
			String productID) {
		super();
		this.brand = brand;
		this.weight = weight;
		this.material = material;
		this.volume = volume;
		this.classify = classify;
		this.expDate = expDate;
		this.productID = productID;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public Integer getVolume() {
		return volume;
	}
	public void setVolume(Integer volume) {
		this.volume = volume;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public Date getExpDate() {
		return expDate;
	}
	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	
	
}
