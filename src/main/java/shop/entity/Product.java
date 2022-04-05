package shop.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="PRODUCT")
public class Product {
	
	@Id
	@Column(name="ProductID")
	private String productId;
	
	@Column(name="Image")
	private String image;
	
	@Column(name="Name")
	private String name;
	
	@Column(name="Amount")
	private Integer amount;
	
	@ManyToOne
	@JoinColumn(name="Category")
	private Category categories;
	
	@Column(name="Description")
	private String description;
	
	@Column(name="Price")
	private int price;
	
	@Column(name="Cost")
	private int cost;
	
	@Column(name="Status")
	private String status;
	
	@OneToMany(mappedBy = "productID", fetch = FetchType.EAGER)
	private Collection<SellDetails> sellDetailsID;

	@OneToMany(mappedBy = "productID", fetch = FetchType.EAGER)
	private Collection<Cart> cartID;

	@OneToMany(mappedBy = "productID", fetch = FetchType.EAGER)
	private Collection<Price> priceID;

		
	
	public Product() {
		super();
	}

	public Product(String productId, String image, String name, Integer amount, Category categories, String description,
			int price, int cost) {
		super();
		this.productId = productId;
		this.image = image;
		this.name = name;
		this.amount = amount;
		this.categories = categories;
		this.description = description;
		this.price = price;
		this.cost = cost;
	}
	
	

	public Product(String productId, String image, String name, Integer amount, Category categories, String description,
			int price, int cost, String status) {
		super();
		this.productId = productId;
		this.image = image;
		this.name = name;
		this.amount = amount;
		this.categories = categories;
		this.description = description;
		this.price = price;
		this.cost = cost;
		this.status = status;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Category getCategories() {
		return categories;
	}

	public void setCategories(Category categories) {
		this.categories = categories;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public Collection<SellDetails> getSellDetailsID() {
		return sellDetailsID;
	}

	public void setSellDetailsID(Collection<SellDetails> sellDetailsID) {
		this.sellDetailsID = sellDetailsID;
	}

	public Collection<Cart> getCartID() {
		return cartID;
	}

	public void setCartID(Collection<Cart> cartID) {
		this.cartID = cartID;
	}

	public Collection<Price> getPriceID() {
		return priceID;
	}

	public void setPriceID(Collection<Price> priceID) {
		this.priceID = priceID;
	}
}
