package org.sistema.springmvc.forms.models;

import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 * Represents a city.
 * 
 * @author Miguel Marzo
 *
 */
@JsonIgnoreProperties({"clientes"})
@Entity
public class Ciudad {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Size(max = 50, message = "Nombre must be max 50 characters long")
	@Pattern(regexp = "[A-Za-z0-9]+", message = "Must contain only chars and numbers")
	@NotNull(message="Campo requerido")
	private String nombre;
	
	@Range(min =  10000, max =  99999, message="Debe estar entre 10000 y 99999")
	@Pattern(regexp = "[0-9]+", message = "Must contain only numbers")
	private String cpostal;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "ciudad")
	private Set<Cliente> clientes = new HashSet<Cliente>();

	/**
	 * default constructor
	 */
	public Ciudad() {
	}

	/**
	 * constructor with parameters
	 * 
	 * @param id
	 * @param nombre
	 * @param description
	 * @param cpostal
	 */
	public Ciudad(int id, String nombre, String cpostal, String password) {
		this.id = id;
		this.nombre = nombre;
		this.cpostal = cpostal;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the clientes
	 */
	public Set<Cliente> getClientes() {
		return clientes;
	}

	/**
	 * @param clientes
	 *            to set
	 */
	public void setCliente(Set<Cliente> clientes) {
		this.clientes = clientes;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getCpostal() {
		return cpostal;
	}

	public void setCpostal(String cpostal) {
		this.cpostal = cpostal;
	}

	public void setClientes(Set<Cliente> clientes) {
		this.clientes = clientes;
	}

}
