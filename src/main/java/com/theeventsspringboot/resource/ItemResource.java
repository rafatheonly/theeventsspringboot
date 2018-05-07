package com.theeventsspringboot.resource;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.theeventsspringboot.model.Item;
import com.theeventsspringboot.repository.ItemRepository;

@RestController
@RequestMapping("/itens")
@CrossOrigin("${origem-permitida}")
public class ItemResource {

	@Autowired
	private ItemRepository itemRepository;

	@GetMapping()
	public List<Item> listar() {
		return itemRepository.findAll();
	}	
}
