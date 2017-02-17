package org.sistema.springmvc.forms.controllers;

import java.util.List;

import javax.validation.Valid;

import org.sistema.springmvc.forms.dao.GenericDAO;
import org.sistema.springmvc.forms.models.Cliente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/clientApi")
public class ClientControllerAPI {

	@Autowired
	private GenericDAO<Cliente> clienteDAO;

	@RequestMapping(method = RequestMethod.GET)
	public List<Cliente> getAll() {
		return clienteDAO.selectAll(Cliente.class);
	}

	@RequestMapping(method = RequestMethod.GET, value = { "/{id}" })
	public Cliente getById(@PathVariable(value = "id") Integer id) {
		return clienteDAO.selectById(id, Cliente.class);
	}

	@RequestMapping(method = RequestMethod.POST)
	public void insert(@RequestBody @Valid Cliente clients) {
		clienteDAO.insert(clients);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public void update(@PathVariable Integer id,
			@RequestBody @Valid Cliente clients) {
		clients.setId(id);
		clienteDAO.update(clients);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public void delete(@PathVariable Integer id) {
		clienteDAO.delete(clienteDAO.selectById(id, Cliente.class));
	}

	public GenericDAO<Cliente> getSeriesDAO() {
		return clienteDAO;
	}

	public void setSeriesDAO(GenericDAO<Cliente> clientsDAO) {
		this.clienteDAO = clientsDAO;
	}
	
	

}
