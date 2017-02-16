package org.sistema.springmvc.forms.controllers;

import java.util.List;

import javax.validation.Valid;

import org.sistema.springmvc.forms.dao.GenericDAO;
import org.sistema.springmvc.forms.models.Cliente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/clients")
public class ClientControllerAPI {

	@Autowired
	private GenericDAO<Cliente> clientsDAO;

	@RequestMapping(method = RequestMethod.GET)
	public List<Cliente> getAll() {
		return clientsDAO.selectAll(Cliente.class);
	}

	@RequestMapping(method = RequestMethod.GET, value = { "/{id}" })
	public Cliente getById(@PathVariable(value = "id") Integer id) {
		return clientsDAO.selectById(id, Cliente.class);
	}

	@RequestMapping(method = RequestMethod.POST)
	public void insert(@RequestBody @Valid Cliente clients) {
		clientsDAO.insert(clients);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public void update(@PathVariable Integer id,
			@RequestBody @Valid Cliente clients) {
		clients.setId(id);
		clientsDAO.update(clients);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public void delete(@PathVariable Integer id) {
		clientsDAO.delete(clientsDAO.selectById(id, Cliente.class));
	}

	public GenericDAO<Cliente> getSeriesDAO() {
		return clientsDAO;
	}

	public void setSeriesDAO(GenericDAO<Cliente> clientsDAO) {
		this.clientsDAO = clientsDAO;
	}
	
	

}
