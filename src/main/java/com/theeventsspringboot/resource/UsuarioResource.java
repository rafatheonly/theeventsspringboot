package com.theeventsspringboot.resource;

import java.io.InputStream;
import java.util.*;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.theeventsspringboot.model.Usuario;
import com.theeventsspringboot.repository.UsuarioRepository;
import com.theeventsspringboot.service.UsuarioService;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@RestController
@RequestMapping("/usuarios")
@CrossOrigin("${origem-permitida}")
public class UsuarioResource {

	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@Autowired
	private UsuarioService usuarioService;

	@PostMapping
	public Usuario adicionar(@Valid @RequestBody Usuario usuario) {
		return usuarioRepository.save(usuario);
	}
	
	
	@GetMapping()
	@RequestMapping("/exportusuario")
	public ResponseEntity<byte[]> exportUsuario() throws JRException {
		 List<Usuario> usuarios = usuarioRepository.findAll();    //usuarioRepository.findAll();
		 Map<String, Object> parametros = new HashMap<>();
		 InputStream x = getClass().getResourceAsStream("/reports/usuarioExport.jrxml");
		 JasperReport is = JasperCompileManager.compileReport(x);

		 JasperPrint print = JasperFillManager.fillReport(is, parametros, new JRBeanCollectionDataSource(usuarios));

		 return ResponseEntity.ok()
         .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE)
         .body(JasperExportManager.exportReportToPdf(print));

	}
	
	@GetMapping()
	public List<Usuario> listar(){
		return usuarioRepository.findAll();
	}

	@GetMapping("/{id}")
	public ResponseEntity<Usuario> findById(@PathVariable Long id) {
		Usuario usuario = usuarioRepository.getOne(id);

		if (usuario == null) {
			return ResponseEntity.notFound().build();
		}

		return ResponseEntity.ok(usuario);
	}

	@PutMapping("/{id}")
	public ResponseEntity<Usuario> atualizar(@PathVariable Long id, @Valid @RequestBody Usuario usuario) {
		Usuario existente = usuarioRepository.findById(id).get();

		if (existente == null) {
			return ResponseEntity.notFound().build();
		}

		BeanUtils.copyProperties(usuario, existente, "id");

		existente = usuarioRepository.save(existente);

		return ResponseEntity.ok(existente);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> remover(@PathVariable Long id) {
		Usuario usuario = usuarioRepository.findById(id).get();

		if (usuario == null) {
			return ResponseEntity.notFound().build();
		}

		usuarioRepository.delete(usuario);

		return ResponseEntity.noContent().build();
	}

}
