package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.DetailBill;
import utils.JPAUtils;

public class DetailBillDAO {
	private EntityManager em;

	public DetailBillDAO() {
		this.em = JPAUtils.getEntityManager();
	}

	public DetailBill create(DetailBill p) throws Exception {
		try {
			em.getTransaction().begin();
			em.persist(p);
			em.flush();
			em.getTransaction().commit();
			return p;
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		}
	}

	public DetailBill update(DetailBill p) throws Exception {
		try {
			em.getTransaction().begin();
			em.merge(p);
			em.flush();
			em.getTransaction().commit();
			return p;
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		}
	}

	public DetailBill delete(DetailBill p) throws Exception {
		try {
			em.getTransaction().begin();
			em.remove(p);
			em.flush();
			em.getTransaction().commit();
			return p;
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		}
	}

	public List<DetailBill> getAll() {
		String SelectALL = "SELECT p FROM DetailBill p";
		TypedQuery<DetailBill> query = em.createQuery(SelectALL, DetailBill.class);
		return query.getResultList();
	}
	
	public List<DetailBill> getByMaVD(String mavd) {
		String Select = "SELECT dt FROM DetailBill dt WHERE dt.bill.mavd=:vd";
		TypedQuery<DetailBill> query = em.createQuery(Select, DetailBill.class);
		query.setParameter("vd", mavd);
		return query.getResultList();
	}

	public DetailBill findByID(int id) {
		DetailBill p = em.find(DetailBill.class, id);
		if (p != null) {
			return p;
		} else {
			return null;
		}
	}
}
