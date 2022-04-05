package shop.bean;

public class ProductSellDetails {
	String sellID;
	String productID;
	String name;
	int amount;
	long price;
	
	public ProductSellDetails() {
		super();
	}
	
	public ProductSellDetails(String sellID, String productID, String name, int amount, long price) {
		super();
		this.sellID = sellID;
		this.productID = productID;
		this.name = name;
		this.amount = amount;
		this.price = price;
	}

	public String getSellID() {
		return sellID;
	}
	public void setSellID(String sellID) {
		this.sellID = sellID;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	
}
