package shop.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="CATEGORY")
public class Category {

	@Id
	@Column(name="CategoryID")
	private String categoryId;
	
	@Column(name="Name")
	private String name;
	
	@Column(name="Image")
	private String image;
	
	@OneToMany(mappedBy="categories", fetch = FetchType.EAGER)
	private List<Product> pd;

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public List<Product> getPd() {
		return pd;
	}

	public void setPd(List<Product> pd) {
		this.pd = pd;
	}

	
	
}
