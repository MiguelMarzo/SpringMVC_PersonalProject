package org.sistema.springmvc.forms.controllers;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.sistema.springmvc.forms.dao.CiudadDAO;
import org.sistema.springmvc.forms.models.Ciudad;
import org.sistema.springmvc.forms.models.Cliente;
import org.sistema.springmvc.forms.models.Ciudad;
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
 * Controller for clients.
 * 
 * @author Miguel Marzo
 *
 */
@Controller
public class CiudadController {
	private static final Logger logger = LoggerFactory.getLogger(CiudadController.class);

	@Autowired
	private CiudadDAO ciudadDAO;

	/**
	 * handles default /ciudades
	 * 
	 * @param model
	 * @return the name of the view to show RequestMapping({"/ciudades"})
	 */

	@RequestMapping(method = RequestMethod.GET, value = { "/", "/ciudades" })
	public String showCiudades(Map<String, Object> model) {
		logger.info("Ciudad showCiudades. ");

		List<Ciudad> ciudades = ciudadDAO.selectAll(Ciudad.class);
		model.put("ciudades", ciudades);

		return "ciudad/ciudades";
	}

	/**
	 * handles default /ciudads/id
	 * 
	 * @param model
	 * @return the name of the view to show RequestMapping({"/ciudades/{id}"})
	 */
	@RequestMapping(method = RequestMethod.GET, value = { "/ciudades/{id}" })
	public String ciudadDetail(@PathVariable(value = "id") Integer id, Map<String, Object> model) {
		logger.info("Ciudad detail");

		Ciudad ciudad = ciudadDAO.selectById(id, Ciudad.class);
		// The ciudad gets his own collection of tasks load
		model.put("ciudad", ciudad);

		// We add task for the new task form
		Cliente cliente = new Cliente();
		model.put("cliente", cliente);

		return "ciudad/ciudadDetail";
	}

	/**
	 * handles /ciudades/new by GET
	 * 
	 * @return the name of the view to show RequestMapping({"/ciudades/new"})
	 */
	@RequestMapping(method = RequestMethod.GET, value = { "/ciudades/new" })
	public String newCiudad(Map<String, Object> model) {
		logger.info("Showing custom view GET ");

		model.put("ciudad", new Ciudad());

		return "ciudad/newCiudad";
	}

	/**
	 * handles /ciudades/new by POST
	 * 
	 * @return the name of the view to show RequestMapping({"/ciudades/new"})
	 */
	@RequestMapping(method = RequestMethod.POST, value = { "/ciudades/new" })
	public ModelAndView createCiudad(@Valid Ciudad ciudad, BindingResult bindingResult) {
		logger.info("Saveview POST " + ciudad.getId());

		ModelAndView modelAndView = new ModelAndView();

		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("ciudad/newCiudad");
			modelAndView.addObject("ciudad", ciudad);
			return modelAndView;
		}
		try {
			ciudadDAO.insert(ciudad);
			// We return view name
			modelAndView.setViewName("ciudad/created");
			modelAndView.addObject("ciudad", ciudad);
		} catch (Exception e) {
			modelAndView.setViewName("error");
			modelAndView.addObject("error", "An error ocurred while trying to create a new ciudad. Please, try again");
		}

		return modelAndView;

	}

	/**
	 * Simply selects the update view
	 */
	@RequestMapping(value = "/ciudades/update/{id}", method = RequestMethod.GET)
	public String update(@PathVariable(value = "id") Integer ciudadId, Model model) {
		logger.info("Showing update view GET ");

		// We find the ciudad through DAO and load into model
		model.addAttribute("ciudad", ciudadDAO.selectById(ciudadId, Ciudad.class));

		return "ciudad/update";
	}

	/**
	 * Handles the POST from the Custom.jsp page to update the Ciudad.
	 */
	@RequestMapping(value = "/ciudades/saveupdate", method = RequestMethod.POST)
	public ModelAndView saveUpdate(@Valid Ciudad ciudad, BindingResult bindingResult) {
		logger.info("Save update " + ciudad.getId());
		ModelAndView modelAndView = new ModelAndView();
		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("ciudad/update");
			modelAndView.addObject("ciudad", ciudad);
			return modelAndView;
		}

		try {
			ciudadDAO.update(ciudad);
			// We return view name
			modelAndView.setViewName("ciudad/saveUpdated");
			modelAndView.addObject("ciudad", ciudad);
		} catch (Exception e) {
			modelAndView.setViewName("error");
			modelAndView.addObject("error", "An error ocurred while trying to create a new city. Please, try again");
		}

		return modelAndView;
	}

	/**
	 * Delete the specific ciudad
	 */
	@RequestMapping(value = "/ciudades/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable(value = "id") Integer ciudadId, Model model) {
		logger.info("Ciudad detail /delete");

		ciudadDAO.delete(ciudadDAO.selectById(ciudadId, Ciudad.class));
		model.addAttribute("ciudadId", ciudadId);

		return "ciudad/deleted";
	}

}
