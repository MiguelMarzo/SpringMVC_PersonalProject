package org.sistema.springmvc.forms.controllers;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.sistema.springmvc.forms.dao.CiudadDAO;
import org.sistema.springmvc.forms.dao.GenericDAO;
import org.sistema.springmvc.forms.models.Ciudad;
import org.sistema.springmvc.forms.models.Cliente;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Controller for users.
 * 
 * @author Eugenia Pérez Martínez
 *
 */
@Controller
public class ClienteController {
	private static final Logger logger = LoggerFactory
			.getLogger(ClienteController.class);

	@Autowired
	private GenericDAO<Cliente> clienteDAO;
	@Autowired
	private CiudadDAO ciudadDAO = new CiudadDAO();

	/**
	 * handles /clientes/id
	 * 
	 * @param model
	 * @return the name of the view to show RequestMapping({"/users/{id}"})
	 */
	@RequestMapping(method = RequestMethod.GET, value = { "/clientes/{id}" })
	public String userClienteDetail(@PathVariable(value = "id") Integer id,
			Map<String, Object> model) {
		logger.info("User cliente detail");

		Cliente cliente = clienteDAO.selectById(id, Cliente.class);
		model.put("cliente", cliente);

		return "cliente/clienteDetail";
	}

	/**
	 * handles /ciudades/cliente/new by POST
	 * 
	 * @return the name of the view to show RequestMapping({"/clientes/new"})
	 */
	@RequestMapping(method = RequestMethod.POST, value = { "/clientes/new" })
	public ModelAndView createCliente(@Valid Cliente cliente, BindingResult bindingResult) {
		
		ModelAndView modelAndView = new ModelAndView();
		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("cliente/created");
			modelAndView.addObject("cliente", cliente);
			return modelAndView;
		}
		try {
			clienteDAO.insert(cliente);
			// We return view name
			modelAndView.setViewName("cliente/created");
			modelAndView.addObject("cliente", cliente);
		} catch (Exception e) {
			modelAndView.setViewName("error");
			modelAndView.addObject("error", "An error ocurred while trying to create a new ciudad. Please, try again");
		}

		return modelAndView;
	}

	/**
	 * Simply selects the update view for clientes
	 */
	@RequestMapping(value = "/clientes/update/{id}", method = RequestMethod.GET)
	public String updateCliente(@PathVariable(value = "id") Integer clienteId,
			Model model) {
		logger.info("Showing update cliente view GET ");
		model.addAttribute("cliente", clienteDAO.selectById(clienteId,Cliente.class));
		
		Cliente cliente = clienteDAO.selectById(clienteId, Cliente.class);
		
		List<Ciudad> ciudad = ciudadDAO.selectAll(Ciudad.class);
		// add to model 
		model.addAttribute("cliente", cliente);
		model.addAttribute("ciudad", ciudad);
		logger.info("Here we have: " + ciudad);
		
		return "cliente/update";		
	}

	/**
	 * Handles the POST from the Custom.jsp page to update the client.
	 */
	@RequestMapping(value = "/clientes/saveupdate", method = RequestMethod.POST)
	public ModelAndView saveUpdateCliente(@Valid Cliente cliente, BindingResult bindingResult) {
		logger.info("Save update cliente " + cliente.getId());
		ModelAndView modelAndView = new ModelAndView();
		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("cliente/saveUpdated");
			modelAndView.addObject("cliente", cliente);
			return modelAndView;
		}	

		try {
			clienteDAO.update(cliente);
			// We return view name
			modelAndView.setViewName("cliente/saveUpdated");
			modelAndView.addObject("cliente", cliente);
		} catch (Exception e) {
			modelAndView.setViewName("error");
			modelAndView.addObject("error", "An error ocurred while trying to create a new city. Please, try again");
		}
		return modelAndView;
	}

	/**
	 * Delete the specific cliente
	 */
	@RequestMapping(value = "/clientes/delete/{id}", method = RequestMethod.GET)
	public String deleteCliente(@PathVariable(value = "id") Integer clienteId,
			Model model) {
		logger.info("User detail /delete cliente: " + clienteId);

		// Store the concrete cliente to send it back before deleting to use it in
		// the following view.
		Cliente cliente = clienteDAO.selectById(clienteId, Cliente.class);
		model.addAttribute("cliente", cliente);

		clienteDAO.delete(cliente);

		return "cliente/deleted";
	}

}
