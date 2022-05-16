package utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAUtils {
	public static EntityManagerFactory getFactory() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Assignment");
		return emf;
	}

	public static EntityManager getEntityManager() {
		EntityManager em = JPAUtils.getFactory().createEntityManager();
		return em;
	}

}
