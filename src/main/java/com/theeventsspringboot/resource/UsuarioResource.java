package com.theeventsspringboot.resource;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.theeventsspringboot.model.Evento;
import com.theeventsspringboot.model.Usuario;
import com.theeventsspringboot.repository.EventoRepository;
import com.theeventsspringboot.repository.UsuarioRepository;;


@RestController
@RequestMapping("/usuarios")
@CrossOrigin("${origem-permitida}")
public class UsuarioResource {

	@Autowired
	private UsuarioRepository usuarioRepository;

	@GetMapping()
	public List<Usuario> listar() {
		return usuarioRepository.findAll();
	}

	@PostMapping()
	public Usuario adicionar(@RequestBody @Valid Usuario usuario) {
		return usuarioRepository.save(usuario);
	}

	@GetMapping("/{id}")
	public Usuario buscar(@PathVariable Long id) {
		return usuarioRepository.findById(id).get();
	}

	@DeleteMapping("/{id}")
	public Usuario remover(@PathVariable Long id) {
		Usuario usuario = usuarioRepository.findById(id).get();
		usuarioRepository.delete(usuario);
		return usuario;
	}
	
}
