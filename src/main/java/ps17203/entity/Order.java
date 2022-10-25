package ps17203.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Orders")
public class Order  implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	String createDate;
	@ManyToOne
	@JoinColumn(name = "Username")
	Account account;
	@JsonIgnore
	@OneToMany(mappedBy = "order")
	List<OrderDetail> orderDetails;

	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCreateDate() {
		return createDate;
	}



	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}



	public Account getAccount() {
		return account;
	}



	
	public void setAccount(Account account) {
		this.account = account;
	}


	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}



	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}



	public Order(int id, String createDate, Account account, List<OrderDetail> orderDetails) {
		this.id = id;
		this.createDate = createDate;
		this.account = account;
		this.orderDetails = orderDetails;
	}



	public Order() {
		// TODO Auto-generated constructor stub
	}
	
	
	
}