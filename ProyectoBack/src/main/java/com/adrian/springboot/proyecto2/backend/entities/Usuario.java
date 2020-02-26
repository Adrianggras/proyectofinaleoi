package com.adrian.springboot.proyecto2.backend.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "usuario")
public class Usuario implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private int id;
	
	@Column(name = "nombre", nullable = false, length = 100)
	private String nombre;
	
	@Column(name = "apellido", nullable = false, length = 100)
	private String apellido;
	
	@Column(name = "email", nullable = false, length = 100)
	private String email;
	
	@Column(name = "telefono", nullable = false, unique = true, length = 9)
	private int telefono;
	
	@Column(name = "usuario", nullable = false, length = 100)
	private String usuario;
	
	@Column(name = "password", nullable = false, length = 100)
	private String password;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "usuario_asiste_evento", schema = "public", joinColumns = {
			@JoinColumn(name = "usuario", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "evento", nullable = false, updatable = false) })
	private Set<Evento> eventos = new HashSet<Evento>(0);

	public Usuario() {
	}

	public Usuario(int id, String nombre, String apellido, String email, int telefono, String usuario,
			String password) {
		this.id = id;
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.telefono = telefono;
		this.usuario = usuario;
		this.password = password;
	}

	public Usuario(int id, String nombre, String apellido, String email, int telefono, String usuario, String password,
			Set<Evento> eventos) {
		this.id = id;
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.telefono = telefono;
		this.usuario = usuario;
		this.password = password;
		this.eventos = eventos;
	}


	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return this.apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getTelefono() {
		return this.telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}

	public String getUsuario() {
		return this.usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public Set<Evento> getEventos() {
		return this.eventos;
	}

	public void setEventos(Set<Evento> eventos) {
		this.eventos = eventos;
	}

}
