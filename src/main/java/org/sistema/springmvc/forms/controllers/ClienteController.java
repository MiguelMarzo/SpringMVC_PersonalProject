package org.sistema.springmvc.forms.controllers;

import java.util.Map;

import org.sistema.springmvc.forms.dao.GenericDAO;
import org.sistema.springmvc.forms.models.Cliente;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	 * handles /users/cliente/new by POST
	 * 
	 * @return the name of the view to show RequestMapping({"/users/new"})
	 */
	@RequestMapping(method = RequestMethod.POST, value = { "/clientes/new" })
	public ModelAndView createCliente(Cliente cliente) {
		
		ModelAndView modelAndView = new ModelAndView();

		clienteDAO.insert(cliente);
			// We return view name
			modelAndView.setViewName("cliente/created");
			modelAndView.addObject("cliente", cliente);
			logger.info("Saveview POST " + cliente.getId());
		
		return modelAndView;
	}

	/**
	 * Simply selects the update view for clientes
	 */
	@RequestMapping(value = "/clientes/update/{id}", method = RequestMethod.GET)
	public String updateCliente(@PathVariable(value = "id") Integer clienteId,
			Model model) {
		logger.info("Showing update cliente view GET ");

		// We find the cliente through DAO and load into model
		model.addAttribute("cliente", clienteDAO.selectById(clienteId,Cliente.class));

		return "cliente/update";
	}

	/**
	 * Handles the POST from the Custom.jsp page to update the User.
	 */
	@RequestMapping(value = "/clientes/saveupdate", method = RequestMethod.POST)
	public ModelAndView saveUpdateCliente(Cliente cliente) {
		logger.info("Save update cliente " + cliente.getId());

		clienteDAO.update(cliente);

		ModelAndView modelAndView = new ModelAndView();

		// We pass the user received through this object
		modelAndView.addObject("cliente", cliente);

		// The same as return "user/saveUpdate"
		modelAndView.setViewName("cliente/saveUpdated");
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
