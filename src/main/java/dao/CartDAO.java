package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.Cart;
import entities.CartPK;
import utils.JPAUtils;

public class CartDAO {
	private EntityManager em;

	public CartDAO() {
		this.em = JPAUtils.getEntityManager();
	}

	public Cart create(Cart c) throws Exception {
		try {
			em.getTransaction().begin();
			em.persist(c);
			em.flush();
			em.getTransaction().commit();
			return c;
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		}
	}

	public void delete(Cart c) throws Exception {
		try {
			em.getTransaction().begin();
			em.remove(c);
			em.flush();
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		}
	}

	public void update(Cart c) throws Exception {
		try {
			em.getTransaction().begin();
			em.merge(c);
			em.flush();
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		}
	}

	public List<Cart> getByUser(String username) {
		String SelectByUser = "Select obj From Cart obj Where obj.id.username=:username";
		TypedQuery<Cart> query = em.createQuery(SelectByUser, Cart.class);
		query.setParameter("username", username);
		return query.getResultList();
	}

	public Cart findByID(CartPK id) {
		Cart c = em.find(Cart.class, id);
		if (c != null) {
			return c;
		} else {
			return null;
		}
	}
}
