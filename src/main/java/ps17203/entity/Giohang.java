package ps17203.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import lombok.Data;


@SuppressWarnings("serial")
@Data
@Entity @Table(name = "Giohang")
public class Giohang  implements Serializable{
	@Id	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	String name;
	String image;
	Double price;
	Double price2;
	Double soluong;
	@ManyToOne
	@JoinColumn(name = "Categoryid")
	Category category;
 
	public Double getSoluong() {
		return soluong;
	}
	public void setSoluong(Double soluong) {
		this.soluong = soluong;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Double getPrice2() {
		return price2;
	}
	public void setPrice2(Double price2) {
		this.price2 = price2;
	}
	public Giohang(int id, String name, String image, Double price, Double price2,Double soluong, Category category) {

		this.id = id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.price2 = price2;
		this.soluong = soluong;
		this.category = category;
	}

	public Giohang() {
		// TODO Auto-generated constructor stub
	}	
	
	
}
