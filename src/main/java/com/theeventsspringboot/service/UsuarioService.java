package com.theeventsspringboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.theeventsspringboot.model.*;
import com.theeventsspringboot.repository.UsuarioRepository;

@Service
public class UsuarioService {
	
	@Autowired
	UsuarioRepository usuarioRepository;
	
	public List<Usuario> listaUsuarios(){
		return usuarioRepository.findAll();
	}
}
