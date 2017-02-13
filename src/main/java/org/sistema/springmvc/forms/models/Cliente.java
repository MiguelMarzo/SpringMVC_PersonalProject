package org.sistema.springmvc.forms.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * Represents a Cliente
 * 
 * @author Miguel Marzo
 *
 */
@Entity
public class Cliente {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Pattern(regexp = "[0-9]+", message = "Must contain only numbers")
	private int id;
	
	@Size(max = 50, message = "Nombre must be max 50 characters long")
	@NotNull(message="Campo requerido")
	@Pattern(regexp = "[A-Za-z0-9]+", message = "Must contain only chars and numbers")
	private String nombre;
	
	@Size(max = 100, message = "Dirección must be max 100 characters long")
	@NotNull(message="Campo requerido")
	@Pattern(regexp = "[A-Za-z0-9]+", message = "Must contain only chars and numbers")
	private String direccion;
	
	@Size(max = 10, message = "Telefono must be max 10 characters long")
	@NotNull(message="Campo requerido")
	@Pattern(regexp = "[A-Za-z0-9]+", message = "Must contain only chars and numbers")
	private String telefono;
	
	@Size(max = 100, message = "Email must be max 100 characters long")
	@NotNull(message="Campo requerido")
	@Pattern(regexp = "[A-Za-z0-9]+", message = "Must contain only chars and numbers")
	private String email;
	
	@ManyToOne
    @JoinColumn(name="idCiudad")
	private Ciudad ciudad;
	
	/**
	 * default constructor
	 */
	public Cliente () {
		
	}
	
	/**
	 * @param id
	 * @param nombre
	 * @param description
	 */
	public Cliente(int id, String nombre, String direccion, String telefono, String email,Ciudad ciudad) {
		this.id = id;
		this.nombre = nombre;
		this.direccion = direccion;
		this.ciudad = ciudad;
		this.telefono = telefono;
		this.email = email;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return direccion;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.direccion = description;
	}

	/**
	 * @return the city
	 */
	public Ciudad getCiudad() {
		return ciudad;
	}

	/**
	 * @param city the city to set
	 */
	public void setCiudad(Ciudad ciudad) {
		this.ciudad = ciudad;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

}
