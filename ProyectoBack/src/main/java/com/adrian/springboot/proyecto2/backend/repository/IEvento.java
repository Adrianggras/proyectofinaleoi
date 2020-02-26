package com.adrian.springboot.proyecto2.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.adrian.springboot.proyecto2.backend.entities.Evento;

@RepositoryRestResource(path="eventos", collectionResourceRel="eventos")
@CrossOrigin(origins="*")
public interface IEvento extends JpaRepository<Evento, Integer>{

}
