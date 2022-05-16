package entities;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the cart database table.
 * 
 */
@Embeddable
public class CartPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable=false, updatable=false)
	private String username;

	@Column(name="product_id", insertable=false, updatable=false)
	private int productId;

	public CartPK() {
	}
	public String getUsername() {
		return this.username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getProductId() {
		return this.productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof CartPK)) {
			return false;
		}
		CartPK castOther = (CartPK)other;
		return 
			this.username.equals(castOther.username)
			&& (this.productId == castOther.productId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.username.hashCode();
		hash = hash * prime + this.productId;
		
		return hash;
	}
}