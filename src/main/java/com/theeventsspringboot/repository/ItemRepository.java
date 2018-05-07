package com.theeventsspringboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.theeventsspringboot.model.Item;

public interface ItemRepository extends JpaRepository<Item, Long> {

}
