package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.Product;
import utils.JPAUtils;

public class ProductDAO {
	private EntityManager em;

	public ProductDAO() {
		this.em = JPAUtils.getEntityManager();
	}

	public Product create(Product p) throws Exception {
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

	public Product update(Product p) throws Exception {
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

	public Product delete(Product p) throws Exception {
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

	public List<Product> getAll() {
		String SelectALL = "SELECT p FROM Product p";
		TypedQuery<Product> query = em.createQuery(SelectALL, Product.class);
		return query.getResultList();
	}

	public List<Product> getByBound(int cate_id, int min, int max) {
		String SelectALL = "SELECT p FROM Product p Where p.category.id=:id and p.price between :min and :max";
		TypedQuery<Product> query = em.createQuery(SelectALL, Product.class);
		query.setParameter("id", cate_id);
		query.setParameter("min", min);
		query.setParameter("max",max);
		return query.getResultList();
	}
	
	public List<Product> getPrice(int min, int max) {
		String SelectALL = "SELECT p FROM Product p Where p.price between :min and :max";
		TypedQuery<Product> query = em.createQuery(SelectALL, Product.class);
		query.setParameter("min", min);
		query.setParameter("max",max);
		return query.getResultList();
	}
	
	public List<Product> getCate(int cate_id) {
		String SelectALL = "SELECT p FROM Product p Where p.category.id=:id";
		TypedQuery<Product> query = em.createQuery(SelectALL, Product.class);
		query.setParameter("id", cate_id);
		return query.getResultList();
	}

	public Product findByID(int id) {
		Product p = em.find(Product.class, id);
		if (p != null) {
			return p;
		} else {
			return null;
		}
	}

}
