package com.adrian.springboot.proyecto2.backend.entities;

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "evento")
public class Evento implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private int id;

	@Column(name = "nombre", nullable = false, length = 150)
	private String nombre;
	
	@Column(name = "descripcion", nullable = false, length = 2000)
	private String descripcion;
	
	@Column(name = "lugar", nullable = false, length = 2000)
	private String lugar;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "fecha", nullable = false, length = 13)
	private Date fecha;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "usuario_asiste_evento", schema = "public", joinColumns = {
			@JoinColumn(name = "evento", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "usuario", nullable = false, updatable = false) })
	private Set<Usuario> usuarios = new HashSet<Usuario>(0);

	public Evento() {
	}

	public Evento(int id, String nombre, String descripcion, String lugar, Date fecha) {
		this.id = id;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.lugar = lugar;
		this.fecha = fecha;
	}

	public Evento(int id, String nombre, String descripcion, String lugar, Date fecha, Set<Usuario> usuarios) {
		this.id = id;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.lugar = lugar;
		this.fecha = fecha;
		this.usuarios = usuarios;
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

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getLugar() {
		return this.lugar;
	}

	public void setLugar(String lugar) {
		this.lugar = lugar;
	}

	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Set<Usuario> getUsuarios() {
		return this.usuarios;
	}

	public void setUsuarios(Set<Usuario> usuarios) {
		this.usuarios = usuarios;
	}

}
