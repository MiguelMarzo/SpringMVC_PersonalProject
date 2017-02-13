package org.sistema.springmvc.forms.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Generic DAO to share logic between all the specific DAOs.
 * 
 * @author Eugenia P�rez Mart�nez
 *
 */

public class GenericDAO<T> {

	protected SessionFactory sessionFactory;

	/**
	 * gives Hibernate Session
	 * 
	 * @return current hibernate Session
	 */
	protected Session getSession() {

		return sessionFactory.getCurrentSession();
	}

	/**
	 * Handles any exception thrown during a transaction
	 * 
	 * @param he
	 */
	protected void handleException(HibernateException he) {
		System.err.println("Hibernate Exception: " + he.getMessage());
	}

	/**
	 * Insert the specific entity.
	 * 
	 * @param entity
	 * @return 
	 * @throws HibernateException
	 */
	@Transactional
	public void insert(T entity) {
		getSession().persist(entity);
		getSession().flush();
	}

	/**
	 * Save or update the specific entity.
	 * 
	 * @param entity
	 * @throws HibernateException
	 */
	@Transactional
	public void update(T entity) throws HibernateException {
		getSession().merge(entity);
		getSession().flush();
	}

	/**
	 * Find by ID the specific entity
	 * 
	 * @param id
	 * @param entityClass
	 * @return the template of the entity
	 * @throws HibernateException
	 */
	@Transactional(readOnly = true)
	public T selectById(Serializable id, Class<T> entityClass)
			throws HibernateException {
		
		T obj = (T) getSession().get(entityClass, id);

		return obj;
	}

	/**
	 * Select all the entities of this concrete class
	 * 
	 * @param entityClass
	 * @return the list of templates
	 * @throws HibernateException
	 */
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<T> selectAll(Class<T> entityClass) throws HibernateException {
		List<T> result = null;

			result = getSession().createQuery(
					"FROM " + entityClass.getSimpleName()).list();
			
		return result;
	}

	/**
	 * Delete the specific entity
	 * 
	 * @param entity
	 * @throws HibernateException
	 */
	@Transactional
	public void delete(T entity) throws HibernateException {	
			getSession().delete(entity);
			getSession().flush();
	}

	/**
	 * @return the sessionFactory
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
	 * @param sessionFactory
	 *            the sessionFactory to set
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
