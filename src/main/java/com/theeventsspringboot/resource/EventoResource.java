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
import com.theeventsspringboot.repository.EventoRepository;

@RestController
@RequestMapping("/eventos")
@CrossOrigin("${origem-permitida}")
public class EventoResource {

	@Autowired
	private EventoRepository eventoRepository;

	@GetMapping()
	public List<Evento> listar() {
		return eventoRepository.findAll();
	}

	@PostMapping()
	public Evento adicionar(@RequestBody @Valid Evento evento) {
		return eventoRepository.save(evento);
	}

	@GetMapping("/{id}")
	public Evento buscar(@PathVariable Long id) {
		return eventoRepository.findById(id).get();
	}

	@DeleteMapping("/{id}")
	public Evento remover(@PathVariable Long id) {
		Evento evento = eventoRepository.findById(id).get();
		eventoRepository.delete(evento);
		return evento;
	}
}
