package entities;

import java.io.Serializable;

import javax.annotation.processing.Generated;
import javax.persistence.*;


/**
 * The persistent class for the detail_bills database table.
 * 
 */
@Entity
@Table(name="detail_bills")
@NamedQuery(name="DetailBill.findAll", query="SELECT d FROM DetailBill d")
public class DetailBill implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private int amount;

	private int price;

	//bi-directional many-to-one association to Product
	@ManyToOne
	private Product product;

	//bi-directional many-to-one association to Bill
	@ManyToOne
	@JoinColumn(name="mavd")
	private Bill bill;

	public DetailBill() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAmount() {
		return this.amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return this.price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Bill getBill() {
		return this.bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

}