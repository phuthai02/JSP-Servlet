package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entities.Category;
import utils.JPAUtils;

public class CategoryDAO {
	private EntityManager em;

	public CategoryDAO() {
		this.em = JPAUtils.getEntityManager();
	}

	public List<Category> getAll() {
		String SelectALL = "Select obj From Category obj";
		TypedQuery<Category> query = em.createQuery(SelectALL, Category.class);
		return query.getResultList();
	}

	public Category findByID(int id) {
		Category c = em.find(Category.class, id);
		if (c != null) {
			return c;
		} else {
			return null;
		}
	}

}
