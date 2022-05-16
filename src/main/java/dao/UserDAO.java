package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.User;
import utils.JPAUtils;

public class UserDAO {
	private EntityManager em;

	public UserDAO() {
		this.em = JPAUtils.getEntityManager();
	}

	public User create(User u) throws Exception {
		try {
			em.getTransaction().begin();
			em.persist(u);
			em.flush();
			em.getTransaction().commit();
			return u;
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		}
	}

	public void delete(User u) throws Exception {
		try {
			em.getTransaction().begin();
			em.remove(u);
			em.flush();
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		}
	}

	public void update(User u) throws Exception {
		try {
			em.getTransaction().begin();
			em.merge(u);
			em.flush();
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			em.getTransaction().rollback();
			throw e;
		}
	}

	public List<User> getAll() {
		String SelectALL = "Select obj From User obj";
		TypedQuery<User> query = em.createQuery(SelectALL, User.class);
		return query.getResultList();
	}

	public User findByID(String id) {
		User u = em.find(User.class, id);
		if (u != null) {
			return u;
		} else {
			return null;
		}
	}
}
