package entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the bills database table.
 * 
 */
@Entity
@Table(name="bills")
@NamedQuery(name="Bill.findAll", query="SELECT b FROM Bill b")
public class Bill implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String mavd;

	private String diachi;

	private String hoten;

	private String sdt;

	private String thanhtoan;

	private int trangthai;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="username")
	private User user;

	//bi-directional many-to-one association to DetailBill
	@OneToMany(mappedBy="bill")
	private List<DetailBill> detailBills;

	public Bill() {
	}

	public String getMavd() {
		return this.mavd;
	}

	public void setMavd(String mavd) {
		this.mavd = mavd;
	}

	public String getDiachi() {
		return this.diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getHoten() {
		return this.hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public String getSdt() {
		return this.sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getThanhtoan() {
		return this.thanhtoan;
	}

	public void setThanhtoan(String thanhtoan) {
		this.thanhtoan = thanhtoan;
	}

	public int getTrangthai() {
		return this.trangthai;
	}

	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<DetailBill> getDetailBills() {
		return this.detailBills;
	}

	public void setDetailBills(List<DetailBill> detailBills) {
		this.detailBills = detailBills;
	}

	public DetailBill addDetailBill(DetailBill detailBill) {
		getDetailBills().add(detailBill);
		detailBill.setBill(this);

		return detailBill;
	}

	public DetailBill removeDetailBill(DetailBill detailBill) {
		getDetailBills().remove(detailBill);
		detailBill.setBill(null);

		return detailBill;
	}

}