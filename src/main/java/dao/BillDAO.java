package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.Bill;
import utils.JPAUtils;

public class BillDAO {
	private EntityManager em;

	public BillDAO() {
		this.em = JPAUtils.getEntityManager();
	}

	public Bill create(Bill c) throws Exception {
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

	public void delete(Bill c) throws Exception {
		try {
			em.getTransaction().begin();
			em.remove(c);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		}
	}

	public void update(Bill c) throws Exception {
		try {
			em.getTransaction().begin();
			em.merge(c);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		}
	}

	public List<Bill> getByUser(String username) {
		String SelectByUser = "Select o From Bill o Where o.user.username=:username";
		TypedQuery<Bill> query = em.createQuery(SelectByUser, Bill.class);
		query.setParameter("username", username);
		return query.getResultList();
	}
	
	public List<Bill> getAll() {
		String SelectByUser = "Select o From Bill o";
		TypedQuery<Bill> query = em.createQuery(SelectByUser, Bill.class);
		return query.getResultList();
	}

	public List<Bill> getByStatus(int stt) {
		String SelectByUser = "Select o From Bill o Where o.trangthai=:stt";
		TypedQuery<Bill> query = em.createQuery(SelectByUser, Bill.class);
		query.setParameter("stt", stt);
		return query.getResultList();
	}

	public Bill findByID(String id) {
		Bill c = em.find(Bill.class, id);
		if (c != null) {
			return c;
		} else {
			return null;
		}
	}
}
