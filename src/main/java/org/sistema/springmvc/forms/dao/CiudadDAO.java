package org.sistema.springmvc.forms.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.sistema.springmvc.forms.models.Ciudad;
import org.sistema.springmvc.forms.models.Cliente;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


public class CiudadDAO extends GenericDAO<Ciudad> {


		/**
	 * Selects all product types by name
	 * 
	 * @return List of ciudades
	 */
	@Transactional(readOnly = true)
	public List<Ciudad> selectByName(String name) {

		List<Ciudad> ciudades = null;

			Query query = getSession()
							.createQuery("from ciudades u where u.nombre LIKE :nombre");
		    query.setParameter("nombre", "%"+name+"%");
		    
			// We get a generic object list
		    ciudades = query.list();

		return ciudades;
	}

}
