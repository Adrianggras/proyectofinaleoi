package com.adrian.springboot.proyecto2.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.adrian.springboot.proyecto2.backend.entities.Usuario;

@CrossOrigin(origins="*")
public interface IUsuario extends JpaRepository<Usuario, Integer>{

}
